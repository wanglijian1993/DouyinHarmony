export class CommonConstants {

  /**
   * 首页Tab数量
   */
  static readonly TAB_SIZE: number = 4;

  static readonly TAB_TITLE:string[]=['首页','朋友','信息','我'];
  static readonly TAB_ICONS:Resource[]=[$r('app.media.ic_home_gray'),$r('app.media.ic_friend_gray'),$r('app.media.ic_msg_gray'),$r('app.media.ic_mine_gray')];
  static readonly TAB_ICONS_SELECTED:Resource[]=[$r('app.media.ic_home_blue'),$r('app.media.ic_friend_blue'),$r('app.media.ic_msg_blue'),$r('app.media.ic_mine_blue')];


  static readonly HOME_PAGE_SIZE:number=10

  /**
   * Initialize device breakpoints.
   */
  static readonly BREAKPOINTS_INITIALIZE_NAME: string = 'md';
  /**
   * Breakpoint name.
   */
  static readonly BREAKPOINT_SYSTEM_NAME: string = 'mainBreakpoint';


  /**
   * 屏幕高度
   */
  static SCREEN_HEIGHT:number=0;

  /**
   * Breakpoint sm.
   */
  static readonly BREAKPOINTS_SM_NAME: string = 'sm';

  /**
   * Breakpoint md.
   */
  static readonly BREAKPOINTS_MD_NAME: string = 'md';

  /**
   * Breakpoint lg.
   */
  static readonly BREAKPOINTS_LG_NAME: string = 'lg';

  /**
   * Breakpoint xl.
   */
  static readonly BREAKPOINTS_XL_NAME: string = 'xl';

  /**
   * The break point value of sm device.
   */
  static readonly BREAKPOINTS_SM_SIZE: number = 0;

  /**
   * The break point value of md device.
   */
  static readonly BREAKPOINTS_MD_SIZE: number = 600;

  /**
   * The break point value of lg device.
   */
  static readonly BREAKPOINTS_LG_SIZE: number = 840;

  /**
   * The break point value of xl device.
   */
  static readonly BREAKPOINTS_XL_SIZE: number = 1320;

  /**
   * Initialize device breakpoint Id.
   */
  static readonly BREAKPOINT_ID_INITIALIZE_NAME: string = 'unknown';
  /**
   * The percentage of width of flex component.
   */
  static readonly FLEX_TAB_BAR_WIDTH: string = '100%';

  /**
   * The percentage of height of flex component.
   */
  static readonly FLEX_TAB_BAR_HEIGHT: string = '100%';

  /**
   * The percentage of width of tab content.
   */
  static readonly TAB_CONTENT_WIDTH: string = '100%';

  /**
   * The percentage of height of tab content.
   */
  static readonly TAB_CONTENT_HEIGHT: string = '100%';

  static readonly HOME_CONTENT_HEIGHT:string='100%';
  static readonly HOME_CONTENT_WIDTH:string='100%';

  /**
   * The value of tab vertical in sm device.
   */
  static readonly TAB_SM_VERTICAL: boolean = false;

  /**
   * The value of tab vertical in md device.
   */
  static readonly TAB_MD_VERTICAL: boolean = false;

  /**
   * The value of tab vertical in lg device.
   */
  static readonly TAB_LG_VERTICAL: boolean = true;

  /**
   * The value of tab vertical in xl device.
   */
  static readonly TAB_XL_VERTICAL: boolean = true;

  /**
   * The percentage of width of tab bar in sm device.
   */
  static readonly TAB_SM_BAR_WIDTH: string = '100%';

  /**
   * The percentage of width of tab bar in md device.
   */
  static readonly TAB_MD_BAR_WIDTH: string = '100%';

  /**
   * The width of tab bar in lg device.
   */
  static readonly TAB_LG_BAR_WIDTH: string = '96vp';

  /**
   * The width of tab bar in xl device.
   */
  static readonly TAB_XL_BAR_WIDTH: string = '96vp';
  /**
   * The height of tab bar in sm device.
   */
  static readonly TAB_SM_BAR_HEIGHT: string = '56vp';

  /**
   * The height of tab bar in md device.
   */
  static readonly TAB_MD_BAR_HEIGHT: string = '56vp';

  /**
   * The percentage of height tab bar in lg device.
   */
  static readonly TAB_LG_BAR_HEIGHT: string = '60%';

  /**
   * The percentage of height tab bar in xl device.
   */
  static readonly TAB_XL_BAR_HEIGHT: string = '60%';
  /**
   * The value of  attribute of columnsTemplate in md device.
   */
  static readonly MD_COL_TEMPLATE: string = '1fr 1fr 1fr';

  /**
   * The value of  attribute of columnsTemplate in lg device.
   */
  static readonly LG_COL_TEMPLATE: string = '1fr 1fr 1fr 1fr';

  /**
   * The value of  attribute of columnsTemplate in xl device.
   */
  static readonly XL_COL_TEMPLATE: string = '1fr 1fr 1fr 1fr';

  /**
   * Initialization of attribute columnsTemplate.
   */
  static readonly INITIALIZE_TEMPLATE: string = '1fr 1fr';
  /**
   * The value of  attribute of columnsTemplate in sm device.
   */
  static readonly SM_COL_TEMPLATE: string = '1fr 1fr';

  /**
   *  The percentage of width of row component.
   */
  static readonly ROW_WIDTH: string = '100%';
  /**
   *  The value of aspect ratio in column component.
   */
  static readonly COLUMN_ASPECT_RATIO: number = 16 / 9;
  /**
   * Font weight of text component.
   */
  static readonly COLUMN_TEXT_FONT_WEIGHT: number = 400;

  static readonly HOME_ICON_HEIGHT:number=40;
  static readonly HOME_ICON_WIDTH:number=40;

}