# Prismatik (Lightpack) — Windows Build

This repository contains the Lightpack/Prismatik sources. The Prismatik app lives under `Software/`.

## Prerequisites

- Qt SDK (Qt 5/6) with the Qt Serial Port module
- Visual Studio (with MSVC toolchain) and Windows SDK

Optional:
- MSYS (if building the installer scripts)
- OpenSSL (only needed for building an installer with update-check support)
- BASS/BASSWASAPI (sound visualizer support)

## Build (Visual Studio solution)

1. Open a Developer Command Prompt (or run `vcvarsall.bat`) so `cl.exe` and `MSBuild.exe` are available.
2. Set `QTDIR` to your Qt install directory (example):

   ```bat
   set QTDIR=C:\Qt\6.6.2\msvc2019_64
   ```

3. Go to the Prismatik software folder:

   ```bat
   cd Software
   ```

4. Copy and edit build variables:

   - Start from `build-vars.prf.default`
   - Create `build-vars.prf` next to it and adjust paths/features for your machine

5. Generate the Visual Studio solution:

   ```bat
   scripts\win32\generate_sln.bat
   ```

6. Build `Lightpack.sln` in Visual Studio, or via MSBuild:

   ```bat
   MSBuild.exe Lightpack.sln /p:Configuration=Release
   ```

## Output

The built Prismatik binaries are written under `Software/bin/`.
