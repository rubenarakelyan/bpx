unit bpx;

{
This is the Borland Pascal eXtensions 0.3.1

Authored by William Setters and Ruben Arakelyan - tools.rubenarakelyan.com/bpx
Released 24 January 2006
Last modified 7 April 2010

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

To implement BPX in your application, simply compile it
then address it in the Pascal "uses" line as follows:
  uses crt, bpx;

For a full history of changes, see CHANGELOG.TXT.
}

interface

function string_to_int(s :string): integer;
function upcasestr(s: string): string;
function lowcasestr(s: string): string;
function numcheck(s: string): boolean;
function alphabetcheck(s: string): boolean;
procedure printtext(filepath, printfile: string);

implementation

{Uppercases a string}
function upcasestr(s: string): string;
    var
        x : integer;

    begin
        for x := 1 to length(s) do
        if (s[x] >= 'a') and (s[x] <= 'z') then
            dec(s[x], 32);
        upcasestr := s;
    end;

{Lowercases a string}
function lowcasestr(s: string): string;
    var
        x : integer;

    begin
        for x := 1 to length(s) do
        if (s[x] >= 'A') and (s[x] <= 'Z') then
            inc(s[x], 32);
        lowcasestr := s;
    end;

{Checks to make sure a string is comprised only of numbers}
function numcheck(s: string): boolean;
    var
        x : integer;

    begin
        numcheck := true;
        for x := 1 to length(s) do
            if (ord(s[x]) < 48) or (ord(s[x]) > 57) then
                if s[x] <> '' then
                    numcheck := false;
    end;

{Checks to make sure that a string is comprised only of letters}
function alphabetcheck(s: string): boolean;
    var
        x : integer;
        y : boolean;

    begin
        y := true;
        for x := 1 to length(s) do
            if ((s[x] < 'A') or (s[x] > 'Z')) and (y) then
                if s[x] = '' then
                    y := true
                else
                    if ((s[x] < 'a') or (s[x] > 'z')) then
                        y := false;
        if y then
            alphabetcheck := true
        else
            alphabetcheck := false;
        s := '';
    end;

{Converts a string to an integer}
function string_to_int(s: string): integer;
    var
        check : integer;
        i     : integer;

    begin
        if numcheck(s) then
            val(s, i, check);
        string_to_int := i;
    end;

procedure printtext(filepath, printfile: string);
	var
		line		:string;
		f		:text;
		list		:text;

	begin
		assign(list, printfile);
		rewrite(list);
		begin
			assign(f, filepath);
			reset(f);
			repeat
				begin
					readln(f, line);
					writeln(list, line);
				end;
			until eof(f);
		end;
		writeln(list, chr(12));
		close(list);
		close(f);
	end;
end.
