
        {block name="header_banner"}
            <div class="bg-dark text-center text-white p-2">{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}Bienvenue sur mon nouveau site ! 😊{else}Mon nouveau site ! 😊{/if}</div>
        {/block}