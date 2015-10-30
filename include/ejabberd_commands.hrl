%%%----------------------------------------------------------------------
%%%
%%% ejabberd, Copyright (C) 2002-2015   ProcessOne
%%%
%%% This program is free software; you can redistribute it and/or
%%% modify it under the terms of the GNU General Public License as
%%% published by the Free Software Foundation; either version 2 of the
%%% License, or (at your option) any later version.
%%%
%%% This program is distributed in the hope that it will be useful,
%%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%%% General Public License for more details.
%%%
%%% You should have received a copy of the GNU General Public License along
%%% with this program; if not, write to the Free Software Foundation, Inc.,
%%% 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
%%%
%%%----------------------------------------------------------------------

-type aterm() :: {atom(), atype()}.
-type atype() :: integer | string | binary |
                 {tuple, [aterm()]} | {list, aterm()}.
-type rterm() :: {atom(), rtype()}.
-type rtype() :: integer | string | atom |
                 {tuple, [rterm()]} | {list, rterm()} |
                 rescode | restuple.

-record(ejabberd_commands,
	{name                    :: atom() | '$1' | '_',
         tags = []               :: [atom()] | '_' | '$2',
         desc = ""               :: string() | '_' | '$3',
         longdesc = ""           :: string() | '_',
	 version = 0             :: integer(),
	 jabs = 1                :: integer(),
	 module                  :: atom() | '_',
         function                :: atom() | '_',
         args = []               :: [aterm()] | '_' | '$1' | '$2',
         policy = restricted     :: open | restricted | admin | user
                                  | '_' | '$3' | '$4',
         result = {res, rescode} :: rterm() | '_' | '$2',
         args_desc = none        :: none | [string()] | '_',
         result_desc = none      :: none | string() | '_',
         args_example = none     :: none | [any()] | '_',
         result_example = none   :: any()}).

-type ejabberd_commands() :: #ejabberd_commands{}.
