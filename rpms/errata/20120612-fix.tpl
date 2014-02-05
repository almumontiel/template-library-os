template rpms/errata/20120612-fix;

'/software/packages' = if(exists(SELF['cups'])) {
    pkg_repl('poppler-utils','0.5.4-4.4.el5_5.14','x86_64');
} else {
    SELF;
};

'/software/packages' = if (exists(SELF[escape('samba-common')]) || exists(SELF[escape('kdebase')])) {
    pkg_repl('libsmbclient','3.0.33-3.39.el5_8','x86_64');
} else {
    SELF;
};

'/software/packages' = if (exists(SELF[escape('tzdata')])) {
    pkg_del('tzdata');
    pkg_repl('tzdata','2012c-1.el5','x86_64');
} else {
    SELF;
};

'/software/packages' = if (exists(SELF[escape('xulrunner-devel')])) {
    pkg_repl('alsa-lib-devel','1.0.17-1.el5','x86_64');
    pkg_repl('freetype-devel','2.2.1-31.el5_8.1','x86_64');
    pkg_repl('gnome-vfs2-devel','2.16.2-6.el5','x86_64');
    pkg_repl('gtk2-devel','2.10.4-20.el5','x86_64');
    pkg_repl('libIDL-devel','0.8.7-1.fc6','x86_64');
    pkg_repl('libXrender-devel','0.9.1-3.1','x86_64');
    pkg_repl('libXt-devel','1.0.2-3.2.el5','x86_64');
    pkg_repl('libgnome-devel','2.16.0-6.el5','x86_64');
    pkg_repl('libgnomeui-devel','2.16.0-5.el5','x86_64');
    pkg_repl('libjpeg-devel','6b-37','x86_64');
    pkg_repl('libnotify-devel','0.4.2-6.el5','x86_64');
    pkg_repl('pango-devel','1.14.9-8.el5_7.3','x86_64');
    pkg_repl('startup-notification-devel','0.8-4.1','x86_64');
    pkg_repl('GConf2-devel','2.14.0-9.el5','x86_64');
    pkg_repl('dbus-glib-devel','0.73-10.el5_5','x86_64');
    pkg_repl('hal-devel','0.5.8.1-59.el5','x86_64');
    pkg_repl('atk-devel','1.12.2-1.fc6','x86_64');
    pkg_repl('cairo-devel','1.2.4-5.el5','x86_64');
    pkg_repl('libXi-devel','1.0.1-4.el5_4','x86_64');
    pkg_repl('libXinerama-devel','1.0.1-2.1','x86_64');
    pkg_repl('libX11-devel','1.0.3-11.el5','x86_64');
    pkg_repl('libXcursor-devel','1.1.7-1.1','x86_64');
    pkg_repl('libXext-devel','1.0.1-2.1','x86_64');
    pkg_repl('libXfixes-devel','4.0.1-2.1','x86_64');
    pkg_repl('libXrandr-devel','1.1.1-3.3','x86_64');
    pkg_repl('libSM-devel','1.0.1-3.1','x86_64');
    pkg_repl('ORBit2-devel','2.14.3-5.el5','x86_64');
    pkg_repl('esound-devel','0.2.36-3','x86_64');
    pkg_repl('libbonobo-devel','2.16.0-1.fc6','x86_64');
    pkg_repl('gnome-keyring-devel','0.6.0-1.fc6','x86_64');
    pkg_repl('libICE-devel','1.0.1-2.1','x86_64');
    pkg_repl('libart_lgpl-devel','2.3.17-4','x86_64');
    pkg_repl('libbonoboui-devel','2.16.0-1.fc6','x86_64');
    pkg_repl('libglade2-devel','2.6.0-2','x86_64');
    pkg_repl('libgnomecanvas-devel','2.14.0-4.1','x86_64');
    pkg_repl('fontconfig-devel','2.4.1-7.el5','x86_64');
    pkg_repl('libXft-devel','2.1.10-1.1','x86_64');
    pkg_repl('audiofile-devel','0.2.6-5','x86_64');
    pkg_repl('libpng-devel','1.2.10-17.el5_8','x86_64');
    pkg_repl('xorg-x11-proto-devel','7.1-13.el5','x86_64');
    pkg_repl('libXau-devel','1.0.1-3.1','x86_64');
    pkg_repl('libXdmcp-devel','1.0.1-2.1','x86_64');
    pkg_repl('mesa-libGL-devel','6.5.1-7.8.el5','x86_64');
} else {
    SELF;
};

# Add python-lib if python is added
'/software/packages' = if (exists(SELF[escape('python')])) {
    pkg_repl('python-libs','2.4.3-44.el5','x86_64');
} else {
    SELF;
};

'/software/packages' = if (exists(SELF['gsl'])) {
    pkg_ronly('gsl','1.13-3.el5','x86_64');
    pkg_ronly('gsl','1.13-3.el5','i386');
} else {        
    SELF;
};

'/software/packages' = if ( exists(SELF[escape('libvirt')]) ) {
    pkg_repl('ebtables','2.0.9-5.el5','x86_64');
} else {
    SELF;
};

'/software/packages' = if ( exists(SELF[escape('libvirt')]) || exists(SELF[escape('rpm-build')])) {
    pkg_repl('xz','4.999.9-0.3.beta.20091007git.el5','x86_64');
    pkg_repl('xz-libs','4.999.9-0.3.beta.20091007git.el5','x86_64');
} else {
    SELF;
};

'/software/packages' = if ( exists(SELF['systemtap']) ) {
    pkg_repl('kernel-devel',KERNEL_VERSION_NUM,'x86_64');
} else {
    SELF;
};

'/software/packages' = if (exists(SELF[escape('kernel-module-openafs')])) {
    pkg_del('kernel-module-openafs');
    pkg_ronly('kernel-module-openafs-'+KERNEL_VERSION_NUM+KERNEL_VARIANT,AFS_VERSION,PKG_ARCH_KERNEL);
} else {
    SELF;
}; 

'/software/packages' = if (exists(SELF[escape('xen-libs')])) {
    pkg_repl('e4fsprogs-libs','1.41.9-3.el5','x86_64');
} else {
    SELF;
};

# if 'cairo' is included, add i386 version
'/software/packages' = if (
    exists(SELF[escape('compat-glibc')]) &&
    exists(SELF[escape('cairo')])
) {
    pkg_repl('cairo', unescape(key(SELF[escape('cairo')], 0)), 'i386');
} else {
    SELF;
};

# if 'fontconfig' is included, add i386 version
'/software/packages' = if (
    exists(SELF[escape('compat-glibc')]) &&
    exists(SELF[escape('fontconfig')])
) {
    pkg_repl('fontconfig', unescape(key(SELF[escape('fontconfig')], 0)), 'i386');
} else {
    SELF;
};

# if 'libpng' is included, add i386 version
'/software/packages' = if (
    exists(SELF[escape('compat-glibc')]) &&
    exists(SELF[escape('libpng')])
) {
    pkg_repl('libpng', unescape(key(SELF[escape('libpng')], 0)), 'i386');
} else {
    SELF;
};

# if 'freetype' is included, add i386 version
'/software/packages' = if (
    exists(SELF[escape('compat-glibc')]) &&
    exists(SELF[escape('freetype')])
) {
    pkg_repl('freetype', unescape(key(SELF[escape('freetype')], 0)), 'i386');
} else {
    SELF;
};

# if 'libXrender' is included, add i386 version
'/software/packages' = if (
    exists(SELF[escape('compat-glibc')]) &&
    exists(SELF[escape('libXrender')])
) {
    pkg_repl('libXrender', unescape(key(SELF[escape('libXrender')], 0)), 'i386');
} else {
    SELF;
};