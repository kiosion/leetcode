#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>

// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
// An input string is valid if:
//  - Open brackets must be closed by the same type of brackets.
//  - Open brackets must be closed in the correct order.
//  - Every close bracket has a corresponding open bracket of the same type.

bool isValid(char * s){
    size_t len = strlen(s);

    char *stack = (char *)malloc(len + 1);
    int top = 0;

    for (size_t i = 0; i < len; ++i) {
        char current = s[i];
        if (current == '(' || current == '[' || current == '{') {
            stack[++top] = current;
        } else {
            if (top == 0) {
                free(stack);
                return false;
            }

            char last_open = stack[top - 1];
            if ((current == ')' && last_open == '(') ||
                (current == ']' && last_open == '[') ||
                (current == '}' && last_open == '{')) {
                    top--;
            } else {
                free(stack);
                return false;
            }
        }
    }

    bool result = (top == 0);
    free(stack);
    return result;
}

