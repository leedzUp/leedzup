{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{foreach $javascript.external as $js}
  <script defer src="{$js.uri}"></script>
{/foreach}

{foreach $javascript.inline as $js}
  <script>
    {$js.content nofilter}
  </script>
{/foreach}

{if isset($vars) && $vars|@count}
  <script>
    {foreach from=$vars key=var_name item=var_value}
    var {$var_name} = {$var_value|json_encode nofilter};
    {/foreach}
  </script>
{/if}
