# Copyright (c) 2015 Ioannis Kolovos
#
# MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.




require './methods'


Object.constants.map {|name|
  klass = Object.const_get(name) rescue false
  apply_alias_to klass if klass and not klass.frozen?
}
 
def apply_alias_to klass
  Methods.collect_translated.map{|k, v| 
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
