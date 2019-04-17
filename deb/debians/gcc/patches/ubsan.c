--- gcc-7.3.0/gcc/ubsan.c
+++ gcc-7.3.0/gcc/ubsan.c
@@ -1471,7 +1471,7 @@ ubsan_use_new_style_p (location_t loc)

   expanded_location xloc = expand_location (loc);
   if (xloc.file == NULL || strncmp (xloc.file, "\1", 2) == 0
-      || xloc.file == '\0' || xloc.file[0] == '\xff'
+      || xloc.file[0] == '\0' || xloc.file[0] == '\xff'
       || xloc.file[1] == '\xff')
     return false;

