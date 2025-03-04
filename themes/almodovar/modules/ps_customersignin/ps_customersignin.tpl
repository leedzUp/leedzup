{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}

<div id="_desktop_user_info">
  <div class="user-info d-flex align-items-center">
    {if $customer.is_logged}
      <div class="dropdown header-block">
        <a
          href="#"
          class="dropdown-toggle header-block__action-btn"
          role="button"
          id="userMenuButton"
          data-bs-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
          aria-label="{l s='View my account (%s)' d='Shop.Theme.Customeraccount' sprintf=[$customerName]}">
          <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e3e3e3"><path d="M480-480q-66 0-113-47t-47-113q0-66 47-113t113-47q66 0 113 47t47 113q0 66-47 113t-113 47ZM160-160v-112q0-34 17.5-62.5T224-378q62-31 126-46.5T480-440q66 0 130 15.5T736-378q29 15 46.5 43.5T800-272v112H160Zm80-80h480v-32q0-11-5.5-20T700-306q-54-27-109-40.5T480-360q-56 0-111 13.5T260-306q-9 5-14.5 14t-5.5 20v32Zm240-320q33 0 56.5-23.5T560-640q0-33-23.5-56.5T480-720q-33 0-56.5 23.5T400-640q0 33 23.5 56.5T480-560Zm0-80Zm0 400Z"/></svg>          <span class="header-block__title d-lg-inline d-none">{$customerName|truncate:22:"..":true}</span>
        </a>

        <div class="dropdown-menu dropdown-menu-start" aria-labelledby="userMenuButton">
          <a class="dropdown-item" href="{$urls.pages.my_account}">
            {l s='Your account' d='Shop.Theme.Customeraccount'}
          </a>
          <div class="dropdown-divider"></div>
          <a href="{$urls.pages.identity}" title="{l s='Information' d='Shop.Theme.Customeraccount'}" class="dropdown-item" rel="nofollow">
            {l s='Information' d='Shop.Theme.Customeraccount'}
          </a>
        
          
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="{$logout_url}">
            <i class="material-icons me-2" aria-hidden="true">&#xE879;</i>
            {l s='Sign out' d='Shop.Theme.Actions'}
          </a>
        </div>
      </div>
    {else}
      <div class="header-block">
        <a
          href="{$urls.pages.authentication}?back={$urls.current_url|urlencode}"
          title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
          class="header-block__action-btn"
          rel="nofollow"
          role="button">
          <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e3e3e3"><path d="M480-480q-66 0-113-47t-47-113q0-66 47-113t113-47q66 0 113 47t47 113q0 66-47 113t-113 47ZM160-160v-112q0-34 17.5-62.5T224-378q62-31 126-46.5T480-440q66 0 130 15.5T736-378q29 15 46.5 43.5T800-272v112H160Zm80-80h480v-32q0-11-5.5-20T700-306q-54-27-109-40.5T480-360q-56 0-111 13.5T260-306q-9 5-14.5 14t-5.5 20v32Zm240-320q33 0 56.5-23.5T560-640q0-33-23.5-56.5T480-720q-33 0-56.5 23.5T400-640q0 33 23.5 56.5T480-560Zm0-80Zm0 400Z"/></svg>          <span class="d-none d-md-inline header-block__title">{l s='Sign in' d='Shop.Theme.Actions'}</span>
        </a>
      </div>
    {/if}
  </div>
</div>
