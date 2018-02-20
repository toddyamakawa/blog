
## Emulate Linux Commands
###### Emulates `grep regex`
```bash
sed -n '/regex/p'
sed '/regex/!d'
```
###### Emulates `grep -v regex`
```bash
sed -n '/regex/!p'
sed '/regex/d'
```
###### Emulates `head -1`
```bash
sed q
```
###### Emulates `head -10`
```bash
sed 10q
```
###### Emulates `tac`
```bash
sed '1!G;h;$!d'
sed -n '1!G;h;$p'
```
###### Emulates `tail -1`
```bash
sed '$!d'
sed -n '$p'
```
###### Emulates `wc -l`
```bash
sed -n '$='
```

## Insert Blank Lines
###### Insert a blank line below `regex`
```bash
 sed '/regex/G'
```
###### Insert a blank line above `regex`
```bash
sed '/regex/{x;p;x;}'
```

## Delete Whitespace
###### Delete leading whitespace
```bash
sed 's/^\s*//'
```
###### Delete trailing whitespace
```bash
sed 's/\s*$//'
```

## Substitution
###### Replace `foo` with `bar` on lines that match `baz`
```bash
sed '/baz/s/foo/bar/g'
```
###### Replace `foo` with `bar` on lines that don't match `baz`
```bash
sed '/baz/!s/foo/bar/g'
```

