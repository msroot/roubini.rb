
METHOD_TRANSLATIONS = {
  προσπάθεια_μετατροπής: :try_convert,
  διανέμω: :allocate,
  νέο: :new,
  υπερκλάση: :superclass,
  πάγωμα: :freeze,
  # to_s: :to_s,
  επιθεώρηση: :inspect,
  # included_modules: :included_modules,
  συμπεριλαμβάνεί?: :include?,
  όνομα: :name,
  πρόγονοι: :ancestors,
  # instance_methods: :instance_methods,
#   public_instance_methods: :public_instance_methods,
#   protected_instance_methods: :protected_instance_methods,
#   private_instance_methods: :private_instance_methods,
#   constants: :constants,
#   const_get: :const_get,
#   const_set: :const_set,
#   const_defined?: :const_defined?,
#   const_missing: :const_missing,
#   class_variables: :class_variables,
#   remove_class_variable: :remove_class_variable,
#   class_variable_get: :class_variable_get,
#   class_variable_set: :class_variable_set,
#   class_variable_defined?: :class_variable_defined?,
#   public_constant: :public_constant,
#   private_constant: :private_constant,
#   singleton_class?: :singleton_class?,
  # include: :include,
  # prepend: :prepend,
  # module_exec: :module_exec,
  # class_exec: :class_exec,
  # module_eval: :module_eval,
  # class_eval: :class_eval,
  # method_defined?: :method_defined?,
  # public_method_defined?: :public_method_defined?,
  # private_method_defined?: :private_method_defined?,
  # protected_method_defined?: :protected_method_defined?,
  # public_class_method: :public_class_method,
  # private_class_method: :private_class_method,
  φόρτωμα: :autoload,
  φόρτωσε?: :autoload?,
  # instance_method: :instance_method,
#   public_instance_method: :public_instance_method,
#   pretty_print_cycle: :pretty_print_cycle,
#   pretty_print: :pretty_print,
#   pretty_print_instance_variables: :pretty_print_instance_variables,
#   pretty_print_inspect: :pretty_print_inspect,
#   nil?: :nil?,
#   eql?: :eql?,
#   hash: :hash,
  κλάση: :class,
  # singleton_class: :singleton_class,
  κλώνος: :clone,
  # dup: :dup,
  # taint: :taint,
  # tainted?: :tainted?,
  # untaint: :untaint,
  # untrust: :untrust,
  # untrusted?: :untrusted?,
  # trust: :trust,
  # frozen?: :frozen?,
  μέθοδοι: :methods,
  # singleton_methods: :singleton_methods,
  # protected_methods: :protected_methods,
  # private_methods: :private_methods,
  # public_methods: :public_methods,
  # instance_variables: :instance_variables,
  # instance_variable_get: :instance_variable_get,
  # instance_variable_set: :instance_variable_set,
  # instance_variable_defined?: :instance_variable_defined?,
  # remove_instance_variable: :remove_instance_variable,
  # instance_of?: :instance_of?,
  # kind_of?: :kind_of?,
  είναι?: :is_a?,
  # tap: :tap,
  αποστολή: :send,
  # public_send: :public_send,
  ανταποκρίνεται_στό?: :respond_to?,
  επεκτείνει: :extend,
  απεικόνιση: :display,
  μέθοδος: :method,
  # public_method: :public_method,
  # singleton_method: :singleton_method,
  # define_singleton_method: :define_singleton_method,
  # object_id: :object_id,
  # to_enum: :to_enum,
  # enum_for: :enum_for,
  # pretty_inspect: :pretty_inspect,
  # equal?: :equal?,
  # instance_eval: :instance_eval,
  # instance_exec: :instance_exec,
  # __send__: :__send__,
  # __id__: :__id__
}



Object.constants.map {|_klass|
  METHOD_TRANSLATIONS.map{|k, v| 
    klass = Object.const_get _klass
    
  # if  klass.respond_to? v and
  #     klass.respond_to? :singleton_class and
  #     klass.respond_to? :alias_method and
  #     !klass.frozen?
      
      klass.singleton_class.send(:alias_method, k, v) if klass.class.respond_to? v
      klass.send(:alias_method, k, v) if klass.respond_to? v
    # end  
  }
}
 


Αντικείμενο =  Object
Μονάδα = Module
Κλάση = Class
# BasicObject
# Kernel
# NilClass
# NIL
# Data
# TrueClass
# TRUE
# FalseClass
# FALSE
# Encoding
# Comparable
# Enumerable
Σειρά = String
Σύμβολο = Symbol
Εξαίρεση = Exception
# SystemExit
# SignalException
# Interrupt
# StandardError
# TypeError
# ArgumentError
# IndexError
# KeyError
# RangeError
# ScriptError
# SyntaxError
# LoadError
# NotImplementedError
# NameError
# NoMethodError
# RuntimeError
# SecurityError
# NoMemoryError
# EncodingError
# SystemCallError
# Errno
# ZeroDivisionError
# FloatDomainError
Αριθμητικό = Numeric
Ακέραιος = Integer
# Fixnum
# Float
# Bignum
Παράταξη = Array
Μίγμα = Hash
# ENV
# Struct
# RegexpError
# Regexp
# MatchData
# Marshal
# Range
# IOError
# EOFError
# IO
# STDIN
# STDOUT
# STDERR
# ARGF
# FileTest
# File
# Dir
# Time
# Random
# Signal
# Process
# Proc
# LocalJumpError
# SystemStackError
# Method
# UnboundMethod
# Binding
# Math
# GC
# ObjectSpace
# Enumerator
# StopIteration
# RubyVM
# Thread
# TOPLEVEL_BINDING
# ThreadGroup
# Mutex
# ThreadError
# Fiber
# FiberError
# Rational
# Complex
# TracePoint
# ARGV
# Gem
# RbConfig
# Config
# CROSS_COMPILING
# Date
# ConditionVariable
# Queue
# SizedQueue
# MonitorMixin
# Monitor
# RubyToken
# RubyLex
# Readline

 

def methods_to_translate
  Object.constants.reduce([]) {|klass, memo|
    klass = Object.const_get klass
    memo = klass.methods - METHOD_TRANSLATIONS.keys
    memo << klass.instance_methods - METHOD_TRANSLATIONS.keys if klass.respond_to? :instance_methods
    memo
  }.uniq
end
