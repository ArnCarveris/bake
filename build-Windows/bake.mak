# GNU Make project makefile autogenerated by Premake

LINK = link.exe

!IFNDEF config
config = debug
!ENDIF

!IFNDEF verbose
SILENT = @
!ENDIF

.PHONY: clean prebuild prelink

!IF "$(config)" == "debug"
TARGETDIR = ..
TARGET = $(TARGETDIR)\bake.exe
OBJDIR = ..\.bake_cache\debug
DEFINES = -DBAKE_IMPL -DUT_IMPL -DDEBUG $(DEFINES)
INCLUDES =  /I ..\include /I ..\util\include
FORCE_INCLUDE = 
ALL_CPPFLAGS = /nologo /Zi /DNDEBUG /DEBUG:FULL $(CPPFLAGS) $(DEFINES) $(INCLUDES) $(ALL_CPPFLAGS)
ALL_CFLAGS   = /nologo /Zi /DNDEBUG /DEBUG:FULL $(CFLAGS) $(ALL_CPPFLAGS) $(ALL_CFLAGS)
ALL_RESFLAGS = /nologo $(RESFLAGS) $(DEFINES) $(INCLUDES) $(ALL_RESFLAGS)
LIBS = Ws2_32.lib Shlwapi.lib Kernel32.lib Dbghelp.lib Shell32.lib
ALL_LDFLAGS  = /NOLOGO /DEBUG /PDB:"$(TARGETDIR)\bake.pdb" $(LDFLAGS) $(ALL_LDFLAGS) 
LINKCMD = $(LINK) /OUT:"$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)

all: prebuild prelink $(TARGET)
	@:

!ENDIF

!IF "$(config)" == "release"
TARGETDIR = ..
TARGET = $(TARGETDIR)\bake.exe
OBJDIR = ..\.bake_cache\release
DEFINES = -DBAKE_IMPL -DUT_IMPL $(DEFINES)
INCLUDES =  /I ..\include
FORCE_INCLUDE = 
ALL_CPPFLAGS = $(CPPFLAGS) $(DEFINES) $(INCLUDES) $(ALL_CPPFLAGS)
ALL_CFLAGS   = $(CFLAGS) $(ALL_CPPFLAGS) $(ALL_CFLAGS)
ALL_RESFLAGS = $(RESFLAGS) $(DEFINES) $(INCLUDES) $(ALL_RESFLAGS)
LIBS = Ws2_32.lib Shlwapi.lib Kernel32.lib Dbghelp.lib Shell32.lib
ALL_LDFLAGS  = $(LDFLAGS) $(ALL_LDFLAGS)
LINKCMD = $(LINK) /OUT:"$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)

all: prebuild prelink $(TARGET) $(OBJDIR)
	@:

!ENDIF

BAKE_SOURCE= ..\src\attribute.c \
			..\src\build.c \
			..\src\bundle.c \
			..\src\config.c \
			..\src\crawler.c \
			..\src\driver.c \
			..\src\filelist.c \
			..\src\git.c \
			..\src\install.c \
			..\src\json_utils.c \
			..\src\main.c \
			..\src\project.c \
			..\src\rule.c \
			..\src\run.c \
			..\src\setup.c \

UTIL_SOURCE= ..\util\src\win\dl.c \
			..\util\src\win\fs.c \
			..\util\src\win\vs.c \
			..\util\src\win\thread.c \
			..\util\src\win\proc.c \
			..\util\src\win\err.c \
			..\util\src\code.c \
			..\util\src\env.c \
			..\util\src\expr.c \
			..\util\src\file.c \
			..\util\src\fs.c \
			..\util\src\iter.c \
			..\util\src\jsw_rbtree.c \
			..\util\src\ll.c \
			..\util\src\load.c \
			..\util\src\log.c \
			..\util\src\memory.c \
			..\util\src\os.c \
			..\util\src\parson.c \
			..\util\src\path.c \
			..\util\src\rb.c \
			..\util\src\strbuf.c \
			..\util\src\string.c \
			..\util\src\time.c \
			..\util\src\util.c \
			..\util\src\version.c

CPP_SOURCE=$(BAKE_SOURCE) $(UTIL_SOURCE)

OBJECTS=$(CPP_SOURCE:.c=.obj)

$(TARGET): $(GCH) $(OBJECTS) $(TARGETDIR)
	@echo Linking bake
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)


$(TARGETDIR):
	@echo Creating $(TARGETDIR)
	$(SILENT) mkdir $(TARGETDIR)

$(OBJDIR):
	@echo Creating $(OBJDIR)
	$(SILENT) mkdir $(OBJDIR)

clean:
	@echo Cleaning bake
	$(SILENT) @if EXIST $(TARGET) del /Q $(TARGET)
	$(SILENT) @if EXIST $(OBJDIR) del /Q $(OBJDIR)
	$(SILENT) @if EXIST ..\src\*.obj del /Q ..\src\*.obj
	$(SILENT) @if EXIST ..\util\src\*.obj del /Q ..\util\src\*.obj
	$(SILENT) @if EXIST ..\util\src\win\*.obj del /Q ..\util\src\win\*.obj

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

.c.obj:
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) /c $*.c  /Fo$@ 

