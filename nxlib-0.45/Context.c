#if 0
#include <stdio.h>
#include <stdlib.h>

void* xalloc(size_t sz)
{
	void* p;
	p = calloc(1, sz);
	if (!p) exit(1);
	return p;
}
/* Iterator */
typedef struct _iterator {
	void* element;
	struct _iterator* next;
} Iterator;
/* Linked List */
typedef struct _list {
	int element_size;
	struct _iterator* head;
	struct _iterator* tail;
} List;

/* Linked Listの生成 */
#define list_alloc(list, type) \
	list = xalloc(sizeof(List)); \
	list->element_size = sizeof(type);

/* Iteratorに格納する要素のalloc */
void* list_new_element(List* list)
{
	return xalloc(list->element_size);
}
/* Iteratorの取得 */
Iterator* get_iterator(List* list)
{
	return list->head;
}
/* 要素を持っているか？ */
int iterator_has_value(Iterator* ite)
{
	return ite != NULL;
}
/* 次の要素を取得する */
void* iterator_next(Iterator* ite)
{
	return ite->next;
}
/* Linked Listにオブジェクトを追加する */
void list_add(List* list, void* new_element)
{
	if (list->tail == NULL) {
		/* 最初の要素 */
		list->tail = list->head = xalloc(sizeof(Iterator));
	} else {
		Iterator* old_tail = list->tail;
		old_tail->next = xalloc(sizeof(Iterator));
		list->tail = old_tail->next;
	}
	list->tail->element = new_element;
}
/* Linked Listを開放する */
void list_free(List* list)
{
	Iterator* it = get_iterator(list);
	while (1) {
		Iterator* old_it = it;
		if (it == NULL) break;
		free(it->element);
		it = it->next;
		free(old_it);
	}
}
/* なんちゃって foreach */
#define foreach(it, list) for(it = get_iterator(list); iterator_has_value(it); it = iterator_next(it))


typedef struct _point {
    int x;
    int y;
} Point;                        /* 適当な構造体サンプル */
int main(int argc, char** argv)
{
    List* list;
    Iterator* it;
    int i;
    list_alloc(list, Point);    /* リストを作る */
    for (i = 0; i < 10; i++) {
        Point* p1 = list_new_element(list);  /* リストに格納するelementの領域を貰う */
        p1->x = i;
        p1->y = i;
        list_add(list, p1);     /* Point構造体をリストに追加する */
    }
    foreach (it, list) {        /* なんちゃってforeachの使い方 */
        Point* p = it->element;
        printf("point: (%d, %d)\n", p->x, p->y);
    }
    list_free(list);
    return 0;
}
#endif


#include "nxlib.h"
#include "Xutil.h"

typedef struct _XCList {
	Display *display;
	XID rid;
	XContext context;
	XPointer data;

	struct _XCList	*prev;
	struct _XCList	*next;
} XCList;

XCList xcl;

int XFindContext(Display *display, XID rid, XContext context, XPointer *data)
{
	printf("XFindContext called...\n");
	XCList *p = &xcl;
	while (p->next) {
		if (p->display == display && p->rid == rid && p->context == context) {
			*data = p->data;
			return 0;
		}
		p=p->next;
	}
	return XCNOENT;
}

int XSaveContext(Display *display, XID rid, XContext context, XPointer data)
{
	printf("XSaveContext called...\n");
	XCList *p = &xcl;
	while (p->next) {
		if (p->display == display && p->rid == rid && p->context == context) {
			p->data = data;	// over write
			return 0;
		}
		p=p->next;
	}

	p->next = calloc(1, sizeof(XCList));	// with 0 clear
	if (!p->next) return XCNOMEM;
	p->next->prev=p;
	p=p->next;

	p->display = display;
	p->rid = rid;
	p->context = context;
	p->data = data;
	return 0;
}

int XDeleteContext(Display *display, XID rid, XContext context)
{
	printf("XDeleteContext called...\n");
	XCList *p = &xcl;
	while (p->next) {
		if (p->display == display && p->rid == rid && p->context == context) {
			p->prev->next = p->next;
			p->next->prev = p->prev;
			free(p);
			return 0;
		}
		p=p->next;
	}
	return XCNOENT;
}
