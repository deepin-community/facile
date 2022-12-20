(***********************************************************************)
(*                                                                     *)
(*                           FaCiLe                                    *)
(*                 A Functional Constraint Library                     *)
(*                                                                     *)
(*            Nicolas Barnier, Pascal Brisset, LOG, CENA               *)
(*                                                                     *)
(* Copyright 2004 CENA. All rights reserved. This file is distributed  *)
(* under the terms of the GNU Lesser General Public License.           *)
(***********************************************************************)
(* $Id: fcl_debug.mli,v 1.9 2003/08/06 13:29:21 barnier Exp $ *)

(* Module [Debug]: debugging facilities *)

(* _Undocumented_
   Already used characters :
     c : Cstr
     g : Goals
     d : Gcc
     a : Arith
     e : Element
     l : LDS
*)

val level : string ref
(* _Undocumented_
   Equals to environement variable FACILEDEBUG if set, else "" *)
val log : out_channel ref
(* _Undocumented_
   Initialized to stdout *)
val call : char -> (out_channel -> unit) -> unit
(* _Undocumented_
   [call lev f] if [lev] belongs to [!level] or [level]="*", function [f] is
   applied to [!log]. Discarded (if inlined) with the -noassert compiler
   option. *)

val internal_error : string -> 'a
(* Implementor's error *)
val fatal_error : string -> 'a
(* User's error *)
val print_in_assert : bool -> string -> bool
(* [print_in_assert pred mesg] If [pred] is false, prints an error message containing
   [mesg] on [stderr] and returns [false], otherwise returns [true]. To be called
   within [assert]s. *)
