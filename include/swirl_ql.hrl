%% macros
-define(NULL, undefined).

%% types
-type boolean_op() :: 'and' | 'or'.
-type comparison_op() :: '<' | '<=' | '=' | '>=' | '>' | '<>'.
-type inclusion_op() :: in | notin.
-type null_op() :: null | notnull.
-type value() :: integer() | float() | binary().

-type exp_tree() :: {boolean_op(), exp_tree(), exp_tree()} |
                    {comparison_op(), atom(), value()} |
                    {inclusion_op(), atom(), [value(), ...]} |
                    {null_op(), atom()}.
