int g = 4;
int min(int a, int b, int c) {
int v = a;
if (b < v)
v = b;
if (c < v)
v = c;
return v;
}
