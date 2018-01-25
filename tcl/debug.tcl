
# ===========
#    USAGE
# ===========
# source <debug.tcl> at the start of a Tcl script
# Each proc and source will get printed

# --- proc ---
proc new_proc {name args body} {
	set header "puts \"# >> proc $name\""
	set footer "puts \"# << proc $name\""
	set body "$header\n\n$body\n\n$footer"
	real_proc $name $args $body
}
rename proc real_proc
rename new_proc proc

# --- source ---
proc new_source {fname} {
	puts "# > source $fname"
	if { [catch {uplevel real_source $fname} msg detail] } {
		puts "ERROR: source $fname"
		puts $detail
	}
	puts "# < source $fname"
}
rename source real_source
rename new_source source

