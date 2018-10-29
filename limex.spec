Summary: Lime-X
Name: limeX
Version: 0.2
Release: b1
License: GPL/MPL
Group: User Interface/Desktops
Source0: %{name}-%{version}.tar.bz2

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root
#BuildArchitectures: i686

%description
Lime-X is the graphic user interface like X.

%prep
%setup -q

%build
cp config core/src/config
pushd core/src
make || make
popd

cd nxlib-*
make

%install
rm -rf %{buildroot}
mkdir -p %{buildroot}/opt/limex
pushd core/src
make install INSTALL_PREFIX=%{buildroot}/opt/limex
strip %{buildroot}/opt/limex/bin/*
#strip --strip-unneeded -p %{buildroot}/opt/limex/lib/*.so
popd

cd nxlib-*
make install INSTALL_DIR=%{buildroot}/opt/limex/lib
strip --strip-unneeded -p %{buildroot}/opt/limex/lib/*.so
chmod 755 %{buildroot}/opt/limex/lib/*.so

%post
%postun

%clean
rm -rf %{buildroot}

%files
%defattr(-,root,root)
%dir /opt/limex
#/opt/limex/*
/opt/limex/bin/*
/opt/limex/lib/lib*.so*

%changelog
* Wed Feb 4 2009 Yuichiro Nakada <berry@po.yui.mine.nu>
- Create for Berry Linux
