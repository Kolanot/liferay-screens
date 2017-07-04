﻿using System;
using ObjCRuntime;

namespace BindingLibrary
{
[Native]
public enum AuthType : nint
{
    Basic = 1,
    OAuth = 2,
    Cookie = 3
}

[Native]
public enum LiferayMediaType : nint
{
    Camera = 0,
    Video = 1,
    Image = 2,
    ImageEdited = 3
}

[Native]
public enum LiferayServerVersion : nint
{
    LiferayServerVersionV62 = 62,
    LiferayServerVersionV70 = 70
}

[Native]
public enum ProgressCloseMode : nint
{
    ManualClose = 0,
    ManualClose_TouchClosable = 1,
    Autoclose = 2,
    Autoclose_TouchClosable = 3
}

[Native]
public enum ProgressMessageType : nint
{
    Working = 0,
    Failure = 1,
    Success = 2
}

[Native]
public enum ProgressSpinnerMode : nint
{
    IndeterminateSpinner = 0,
    DeterminateSpinner = 1,
    NoSpinner = 2
}

[Native]
public enum SyncConflictResolution : nint
{
    UseRemote = 0,
    UseLocal = 1,
    Discard = 2,
    Ignore = 3
}

}

