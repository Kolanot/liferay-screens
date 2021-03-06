﻿using Foundation;
using LiferayScreens;
using System;
using UIKit;

namespace ShowcaseiOS.ViewController
{
    public partial class ImageGalleryViewController : UIViewController, IImageGalleryScreenletDelegate
    {
        public ImageGalleryViewController(IntPtr handle) : base(handle) { }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            //FIXME: ImageGalleryScreenlet doesn't work with "default" theme (grid)
            this.imageGalleryScreenlet.FolderId = LiferayServerContext.LongPropertyForKey("imageGalleryFolderId");
            this.imageGalleryScreenlet.RepositoryId = LiferayServerContext.LongPropertyForKey("imageGalleryRepositoryId");
            this.imageGalleryScreenlet.ThemeName = LiferayServerContext.StringPropertyForKey("imageGalleryThemeName");

            this.imageGalleryScreenlet.Delegate = this;
        }

        /* IImageGalleryScreenletDelegate */

        [Export("screenlet:onImageEntriesResponse:")]
        public virtual void Screenlet(ImageGalleryScreenlet screenlet, ImageEntry[] imageEntries)
        {
            Console.WriteLine($"Image gallery entries response: {imageEntries.Length}");
        }

        [Export("screenlet:onImageEntryDeleted:")]
        public virtual void ScreenletImageDeleted(ImageGalleryScreenlet screenlet, ImageEntry imageEntry)
        {
            Console.WriteLine($"Image gallery entry deleted: {imageEntry.Attributes}");
        }

        [Export("screenlet:onImageEntryDeleteError:")]
        public virtual void ScreenletImageDeleteError(ImageGalleryScreenlet screenlet, NSError error)
        {
            Console.WriteLine($"Image gallery entry deleted error: {error.DebugDescription}");
        }

        [Export("screenlet:onImageEntriesError:")]
        public virtual void ScreenletImageEntriesError(ImageGalleryScreenlet screenlet, NSError error)
        {
            Console.WriteLine($"Image gallery entries error: {error.DebugDescription}");
        }

        [Export("screenlet:onImageEntrySelected:")]
        public virtual void ScreenletImageSelected(ImageGalleryScreenlet screenlet, ImageEntry imageEntry)
        {
            Console.WriteLine($"Image gallery entry selected: {imageEntry.Attributes}");
        }

        [Export("screenlet:onImageUploaded:")]
        public virtual void ScreenletImageUploaded(ImageGalleryScreenlet screenlet, ImageEntry image)
        {
            Console.WriteLine($"Image gallery image uploaded: {image.Attributes}");
        }

        [Export("screenlet:onImageUploadError:")]
        public virtual void ScreenletImageUploadError(ImageGalleryScreenlet screenlet, NSError error)
        {
            Console.WriteLine($"Image gallery image uploaded error: {error.DebugDescription}");
        }

        [Export("screenlet:onImageUploadProgress:totalBytesSent:totalBytesToSend:")]
        public virtual void ScreenletImageUploadProgress(ImageGalleryScreenlet screenlet, ImageEntryUpload imageEntryUpload, ulong totalBytesSent, ulong totalBytesToSend)
        {
            Console.WriteLine($"Image gallery image upload progress: {imageEntryUpload.DebugDescription}");
        }

        [Export("screenlet:onImageUploadStart:")]
        public virtual void ScreenletImageUploadStart(ImageGalleryScreenlet screenlet, ImageEntryUpload imageEntryUpload)
        {
            Console.WriteLine($"Image gallery image upload start: {imageEntryUpload.DebugDescription}");
        }
    }
}

