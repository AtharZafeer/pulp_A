# Check if we are using bender for ip management. If so, use the bender generated script that does everything
# Otherwise, source the individual tcl scripts generated by IPApprox.
if {[info exists ::env(IPAPPROX)] && $::env(IPAPPROX) == 1 } {
    # set up includes
    source ../pulp/tcl/generated/ips_inc_dirs.tcl
    set_property include_dirs $INCLUDE_DIRS [current_fileset]
    set_property include_dirs $INCLUDE_DIRS [current_fileset -simset]

    # setup and add IP source files
    source ../pulp/tcl/generated/ips_src_files.tcl
    source ../pulp/tcl/generated/ips_add_files.tcl

    # setup and add RTL source files
    source ../pulp/tcl/generated/rtl_src_files.tcl
    source ../pulp/tcl/generated/rtl_add_files.tcl
} else {
    source ../pulp/tcl/generated/compile.tcl
}
