//
//  egl.swift
//  three3d_egl
//
//  Created by 赵磊 on 2021/4/30.
//

import OpenGL

public class ThreeEgl {
  public static var contexts: [Int64: NSOpenGLContext] = [:];

  public static func setContext(key: Int64, context: NSOpenGLContext) {
    contexts[key] = context;
  }
  
  public static func getContext(key: Int64) -> NSOpenGLContext? {
    return contexts[key] ?? nil;
  }
  
  public static func remove(key: Int64) {
    contexts.removeValue(forKey: key);
  }
  
  public static func dispose() {
    contexts.removeAll();
  }
}


@_cdecl("makeCurrent")
public func makeCurrent(context: Int64) -> Int64 {
  let _context = ThreeEgl.getContext(key: context);
  
  if(_context != nil) {
    _context!.makeCurrentContext();
    return 1;
  } else {
    return -1;
  }
}

@_cdecl("testEgl")
public func testEgl() -> Int32 {
  return 123
}
