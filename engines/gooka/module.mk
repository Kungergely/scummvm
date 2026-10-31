MODULE := engines/gooka

MODULE_OBJS := \
	actor.o \
	devtools.o \
	effects.o \
	font.o \
	game.o \
	gooka.o \
	image.o \
	inventory.o \
	metaengine.o \
	music.o \
	primitives.o \
	resource.o \
	rooms/ported.o \
	rooms/room_data.o \
	rooms/rooms.o \
	saveload.o \
	scene.o \
	sequencer.o \
	sound.o \
	state.o \
	text.o \
	ui.o \
	walk.o

# Ported rooms: one file per original room function (rooms/room_<id>.cpp)
MODULE_OBJS += $(filter-out rooms/room_data.o,$(patsubst $(srcdir)/engines/gooka/%.cpp,%.o,$(wildcard $(srcdir)/engines/gooka/rooms/room_*.cpp)))

# This module can be built as a plugin
ifeq ($(ENABLE_GOOKA), DYNAMIC_PLUGIN)
PLUGIN := 1
endif

# Include common rules
include $(srcdir)/rules.mk

# Detection objects
DETECT_OBJS += $(MODULE)/detection.o
