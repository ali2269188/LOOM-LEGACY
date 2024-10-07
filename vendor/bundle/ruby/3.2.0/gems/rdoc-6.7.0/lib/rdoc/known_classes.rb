# frozen_string_literal: true
module RDoc

  ##
  # Ruby's built-in classes, modules and exceptions

  KNOWN_CLASSES = {
    "rb_cArray"            => "Array",
    "rb_cBasicObject"      => "BasicObject",
    "rb_cBignum"           => "Bignum",
    "rb_cClass"            => "Class",
    "rb_cData"             => "Data",
    "rb_cDir"              => "Dir",
    "rb_cEncoding"         => "Encoding",
    "rb_cFalseClass"       => "FalseClass",
    "rb_cFile"             => "File",
    "rb_cFixnum"           => "Fixnum",
    "rb_cFloat"            => "Float",
    "rb_cHash"             => "Hash",
    "rb_cIO"               => "IO",
    "rb_cInteger"          => "Integer",
    "rb_cModule"           => "Module",
    "rb_cNilClass"         => "NilClass",
    "rb_cNumeric"          => "Numeric",
    "rb_cObject"           => "Object",
    "rb_cProc"             => "Proc",
    "rb_cRange"            => "Range",
    "rb_cRefinement"       => "Refinement",
    "rb_cRegexp"           => "Regexp",
    "rb_cRubyVM"           => "RubyVM",
    "rb_cSocket"           => "Socket",
    "rb_cString"           => "String",
    "rb_cStruct"           => "Struct",
    "rb_cSymbol"           => "Symbol",
    "rb_cThread"           => "Thread",
    "rb_cTime"             => "Time",
    "rb_cTrueClass"        => "TrueClass",

    "rb_eArgError"         => "ArgumentError",
    "rb_eEOFError"         => "EOFError",
    "rb_eException"        => "Exception",
    "rb_eFatal"            => "fatal",
    "rb_eFloatDomainError" => "FloatDomainError",
    "rb_eIOError"          => "IOError",
    "rb_eIndexError"       => "IndexError",
    "rb_eInterrupt"        => "Interrupt",
    "rb_eLoadError"        => "LoadError",
    "rb_eNameError"        => "NameError",
    "rb_eNoMemError"       => "NoMemoryError",
    "rb_eNotImpError"      => "NotImplementedError",
    "rb_eRangeError"       => "RangeError",
    "rb_eRuntimeError"     => "RuntimeError",
    "rb_eScriptError"      => "ScriptError",
    "rb_eSecurityError"    => "SecurityError",
    "rb_eSignal"           => "SignalException",
    "rb_eStandardError"    => "StandardError",
    "rb_eSyntaxError"      => "SyntaxError",
    "rb_eSystemCallError"  => "SystemCallError",
    "rb_eSystemExit"       => "SystemExit",
    "rb_eTypeError"        => "TypeError",
    "rb_eZeroDivError"     => "ZeroDivisionError",

    "rb_mComparable"       => "Comparable",
    "rb_mEnumerable"       => "Enumerable",
    "rb_mErrno"            => "Errno",
    "rb_mFConst"           => "File::Constants",
    "rb_mFileTest"         => "FileTest",
    "rb_mGC"               => "GC",
    "rb_mKernel"           => "Kernel",
    "rb_mMath"             => "Math",
    "rb_mProcess"          => "Process"
  }

end
