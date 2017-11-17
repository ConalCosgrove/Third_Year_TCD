#pragma once

//
// t1.h
//
// 
//
// 
//

//
// NB: "extern C" to avoid procedure name mangling by compiler
//

extern int g = 4;
extern "C" int _cdecl min(int, int, int);   // _cdecl calling convention


// eof