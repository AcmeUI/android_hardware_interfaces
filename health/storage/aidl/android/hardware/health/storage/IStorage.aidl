/*
 * Copyright (C) 2021 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.hardware.health.storage;

import android.hardware.health.storage.IGarbageCollectCallback;

/**
 * IStorage is an interface that provides operations on underlying storage
 * devices, including flash memory.
 */
@VintfStability
interface IStorage {
    /**
     * Start garbage collection on the driver of storage devices.
     *
     * Garbage collection must be started at regular intervals when it is a good
     * time for a longer-running cleanup tasks, roughly daily.
     *
     * When garbage collection finishes or encounters an error before the
     * specified timeout, the implementation must call IGarbageCollect.finish
     * immediately with appropriate result.
     *
     * If garbage collection does not finish within the specified timeout,
     * the implementation must stop garbage collection, and must not call
     * IGarbageCollect.finish.
     *
     * @param timeoutSeconds timeout in seconds. The implementation must
     *     return after the timeout is reached.
     *
     * @param callback callback interface. Callback must be null if the client
     *     does not need to receive any callbacks.
     *
     */
    oneway void garbageCollect(in long timeoutSeconds, in IGarbageCollectCallback callback);
}
