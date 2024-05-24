import { CommonConstants } from '../constants/CommonConstants';
import { TabBarItem } from '../model/Bean';

/**
 * Binds data to components and provides interfaces.
 */
export class TabsViewModel {
  /**
   * Get item information for the tab.
   *
   * @return {Array<TabBarItem>} tabItems
   */
  getTabData(): Array<TabBarItem> {
    let tabItems: Array<TabBarItem> = [];
    for (let i = 0; i < CommonConstants.TAB_SIZE; i++) {
      let itemInfo: TabBarItem = new TabBarItem();
      itemInfo.id=i;
      itemInfo.name =CommonConstants.TAB_TITLE[i];
      itemInfo.icon = CommonConstants.TAB_ICONS[i];
      itemInfo.selectIcon = CommonConstants.TAB_ICONS_SELECTED[i];
      tabItems.push(itemInfo);
    }
    return tabItems;
  }
}

let tabsViewModel = new TabsViewModel();

export default tabsViewModel as TabsViewModel;