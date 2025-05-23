import { ConfigurationConstant } from "@kit.AbilityKit";

export class ResourceConstants {

  /**
   * Common background color list.
   */
  private static commonBackgroundColor: Resource[] = [$r('app.color.common_background_1'),
    $r('app.color.common_background_2'), $r('app.color.common_background_3')];


  /**
   * Common image size list.
   */
  private static commonImgSize: Resource[] = [$r('app.float.common_image_size_1'), $r('app.float.common_image_size_2'),
    $r('app.float.common_image_size_3'), $r('app.float.common_image_size_4'), $r('app.float.common_image_size_5'),
    $r('app.float.common_image_size_6'), $r('app.float.common_image_size_7'), $r('app.float.common_image_size_8'),
    $r('app.float.common_image_size_9'), $r('app.float.common_image_size_10'), $r('app.float.common_image_size_11')];

  static getCommonBackgroundColor(): Resource[] {
    return ResourceConstants.commonBackgroundColor;
  }

  static getCommonImgSize(): Resource[] {
    return ResourceConstants.commonImgSize;
  }
}