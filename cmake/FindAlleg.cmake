#.rst:
# FindAlleg
# --------
#
# Find Allegro5 includes and libraries.
#
# IMPORTED Targets
# ^^^^^^^^^^^^^^^^
#
# This module defines `IMPORTED` targets
#   ``Alleg::Allegro``,
#   ``Alleg::Acodec``,
#   ``Alleg::Audio``,
#   ``Alleg::Color``,
#   ``Alleg::Dialog``,
#   ``Alleg::Font``,
#   ``Alleg::Image``,
#   ``Alleg::Main``,
#   ``Alleg::Memfile``,
#   ``Alleg::PhysFS``,
#   ``Alleg::Primitives``,
#   ``Alleg::TTF``.
#
# Hints
# ^^^^^
#
# A user may set ``Alleg_ROOT`` to an Alleg installation root to tell this
# module where to look.

if(NOT Alleg_ROOT)
  set(Alleg_ROOT "")
endif()

find_path(ALLEG_INCLUDE_DIR NAMES "allegro5/allegro5.h" PATHS ${Alleg_ROOT} PATH_SUFFIXES "include")

find_library(ALLEG_ALLEGRO  NAMES allegro             allegro-static             PATHS ${Alleg_ROOT}  PATH_SUFFIXES "lib")
find_library(ALLEG_ACODEC   NAMES allegro_acodec      allegro_acodec-static      PATHS ${Alleg_ROOT}  PATH_SUFFIXES "lib")
find_library(ALLEG_AUDIO    NAMES allegro_audio       allegro_audio-static       PATHS ${Alleg_ROOT}  PATH_SUFFIXES "lib")
find_library(ALLEG_COLOR    NAMES allegro_color       allegro_color-static       PATHS ${Alleg_ROOT}  PATH_SUFFIXES "lib")
find_library(ALLEG_DIALOG   NAMES allegro_dialog      allegro_dialog-static      PATHS ${Alleg_ROOT}  PATH_SUFFIXES "lib")
find_library(ALLEG_FONT     NAMES allegro_font        allegro_font-static        PATHS ${Alleg_ROOT}  PATH_SUFFIXES "lib")
find_library(ALLEG_IMAGE    NAMES allegro_image       allegro_image-static       PATHS ${Alleg_ROOT}  PATH_SUFFIXES "lib")
find_library(ALLEG_MAIN     NAMES allegro_main        allegro_main-static        PATHS ${Alleg_ROOT}  PATH_SUFFIXES "lib")
find_library(ALLEG_MEMFILE  NAMES allegro_memfile     allegro_memfile-static     PATHS ${Alleg_ROOT}  PATH_SUFFIXES "lib")
find_library(ALLEG_PHYSFS   NAMES allegro_physfs      allegro_physfs-static      PATHS ${Alleg_ROOT}  PATH_SUFFIXES "lib")
find_library(ALLEG_PRIM     NAMES allegro_primitives  allegro_primitives-static  PATHS ${Alleg_ROOT}  PATH_SUFFIXES "lib")
find_library(ALLEG_TTF      NAMES allegro_ttf         allegro_ttf-static         PATHS ${Alleg_ROOT}  PATH_SUFFIXES "lib")

if(NOT ALLEG_ALLEGRO_NOTFOUND)
  add_library(Alleg::Allegro UNKNOWN IMPORTED)
  set_target_properties(Alleg::Allegro PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${ALLEG_INCLUDE_DIR}"
    IMPORTED_LOCATION ${ALLEG_ALLEGRO})

  if(WIN32)
    set(ALW32DEPS "shlwapi" "psapi" "winmm" "opengl32" "Gdiplus")
    if(NOT MSVC)
      list(APPEND ALW32DEPS "stdc++")
    endif()
    set_target_properties(Alleg::Allegro PROPERTIES INTERFACE_LINK_LIBRARIES "${ALW32DEPS}")
  endif(WIN32)
endif()

if(NOT ALLEG_AUDIO_NOTFOUND)
  add_library(Alleg::Audio UNKNOWN IMPORTED)
  add_dependencies(Alleg::Audio Alleg::Allegro)
  set_target_properties(Alleg::Audio PROPERTIES IMPORTED_LOCATION ${ALLEG_AUDIO})
endif()

if(NOT ALLEG_ACODEC_NOTFOUND)
  add_library(Alleg::Acodec UNKNOWN IMPORTED)
  add_dependencies(Alleg::Acodec Alleg::Audio)
  set_target_properties(Alleg::Acodec PROPERTIES IMPORTED_LOCATION ${ALLEG_ACODEC})
endif()

if(NOT ALLEG_COLOR_NOTFOUND)
  add_library(Alleg::Color UNKNOWN IMPORTED)
  add_dependencies(Alleg::Color Alleg::Allegro)
  set_target_properties(Alleg::Color PROPERTIES IMPORTED_LOCATION ${ALLEG_COLOR})
endif()

if(NOT ALLEG_DIALOG_NOTFOUND)
  add_library(Alleg::Dialog UNKNOWN IMPORTED)
  add_dependencies(Alleg::Dialog Alleg::Allegro)
  set_target_properties(Alleg::Dialog PROPERTIES IMPORTED_LOCATION ${ALLEG_DIALOG})
endif()

if(NOT ALLEG_FONT_NOTFOUND)
  add_library(Alleg::Font UNKNOWN IMPORTED)
  add_dependencies(Alleg::Font Alleg::Allegro)
  set_target_properties(Alleg::Font PROPERTIES IMPORTED_LOCATION ${ALLEG_FONT})
endif()

if(NOT ALLEG_TTF_NOTFOUND)
  add_library(Alleg::TTF UNKNOWN IMPORTED)
  add_dependencies(Alleg::TTF Alleg::Font)
  set_target_properties(Alleg::TTF PROPERTIES IMPORTED_LOCATION ${ALLEG_TTF})
endif()

if(NOT ALLEG_IMAGE_NOTFOUND)
  add_library(Alleg::Image UNKNOWN IMPORTED)
  add_dependencies(Alleg::Image Alleg::Allegro)
  set_target_properties(Alleg::Image PROPERTIES IMPORTED_LOCATION ${ALLEG_IMAGE})
endif()

if(NOT ALLEG_MAIN_NOTFOUND)
  add_library(Alleg::Main UNKNOWN IMPORTED)
  add_dependencies(Alleg::Main Alleg::Allegro)
  set_target_properties(Alleg::Main PROPERTIES IMPORTED_LOCATION ${ALLEG_MAIN})
endif()

if(NOT ALLEG_MEMFILE_NOTFOUND)
  add_library(Alleg::Memfile UNKNOWN IMPORTED)
  add_dependencies(Alleg::Memfile Alleg::Allegro)
  set_target_properties(Alleg::Memfile PROPERTIES IMPORTED_LOCATION ${ALLEG_MEMFILE})
endif()

if(NOT ALLEG_PHYSFS_NOTFOUND)
  add_library(Alleg::PhysFS UNKNOWN IMPORTED)
  add_dependencies(Alleg::PhysFS Alleg::Allegro)
  set_target_properties(Alleg::PhysFS PROPERTIES IMPORTED_LOCATION ${ALLEG_PHYSFS})
endif()

if(NOT ALLEG_PRIM_NOTFOUND)
  add_library(Alleg::Primitives UNKNOWN IMPORTED)
  add_dependencies(Alleg::Primitives Alleg::Allegro)
  set_target_properties(Alleg::Primitives PROPERTIES IMPORTED_LOCATION ${ALLEG_PRIM})
endif()

