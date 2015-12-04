require './methods'


Object.constants.map {|name|
  klass = Object.const_get(name)
  apply_alias_to klass if klass
}
 
apply_alias_to Object

def apply_alias_to klass
  Methods.collect_translated.map{|k, v| 
    next if klass.frozen?
    k, v = k.to_sym, v.to_sym
    begin
      klass.singleton_class.send(:alias_method, k, v) if klass.class.respond_to? v
      klass.send(:alias_method, k, v) if klass.respond_to? v
    rescue Exception
    end
  }  
end

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
  Object.constants.reduce([]) {|memo, klass|
    klass = Object.const_get klass
    memo << klass.methods - METHOD_TRANSLATIONS.keys
    memo << klass.instance_methods - METHOD_TRANSLATIONS.keys if klass.respond_to? :instance_methods
    memo
  }.flatten.uniq.sort
end
