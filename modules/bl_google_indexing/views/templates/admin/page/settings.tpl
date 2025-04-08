{*
 * 2010-2021 Bl Modules.
 *
 * If you wish to customize this module for your needs,
 * please contact the authors first for more information.
 *
 * It's not allowed selling, reselling or other ways to share
 * this file or any other module files without author permission.
 *
 * @author    Bl Modules
 * @copyright 2010-2021 Bl Modules
 * @license
*}
<div id="indexing-api-url" style="display: none">{$APIURL|escape:'htmlall':'UTF-8'}</div>
<div class="panel">
    <div class="panel-heading">
        <i class="icon-cog"></i> {l s='Settings' mod='bl_google_indexing'}
    </div>
    <div class="row">
        <form action="{$requestUri|escape:'htmlall':'UTF-8'}" method="post">
            <div class="name_block">{l s='JSON API Key' mod='bl_google_indexing'}</div>
            <div class="info_block">
                <textarea style="width: 750px; height: 100px;" name="json_api_key">{if !empty($settings.json_api_key)}{$settings.json_api_key|escape:'htmlall':'UTF-8'}{/if}</textarea>
                <div class="cb"></div>
            </div>
            <div class="clear_block"></div>
            <hr>
            <div class="name_block">{l s='Indexing type' mod='bl_google_indexing'}</div>
            <div class="info_block">
                <label class="blmod_mt5">
                    <input type="checkbox" name="product_indexing" value="1"{if !empty($settings.product_indexing)} checked{/if}> {l s='Automatically indexing products' mod='bl_google_indexing'}
                </label>
                <div class="cb"></div>
                <label class="blmod_mt5">
                    <input type="checkbox" name="combination_indexing" value="2"{if !empty($settings.combination_indexing)} checked{/if}> {l s='Automatically indexing combinations' mod='bl_google_indexing'}
                </label>
                <div class="cb"></div>
            </div>
            <div class="clear_block"></div>
            <hr>
            <div class="name_block">{l s='Product languages' mod='bl_google_indexing'}</div>
            <div class="info_block">
                {foreach $languages as $l}
                    <label class="blmod_mt5">
                        <input type="checkbox" name="product_lang_id[]" value="{$l.id_lang|escape:'htmlall':'UTF-8'}"{if $l.id_lang|in_array:$settings.product_lang_id} checked{/if}> {$l.name|escape:'htmlall':'UTF-8'}
                    </label>
                    <div class="cb"></div>
                {/foreach}
            </div>
            <div class="clear_block"></div>
            <hr>
            <div class="name_block">{l s='Quotas' mod='bl_google_indexing'}</div>
            <div class="info_block">
                <label class="blmod_mt5">
                    <input style="width: 60px" type="text" name="requests_per_day" value="{$settings.requests_per_day|escape:'htmlall':'UTF-8'}"/> {l s='The daily quota how many requests you can send to Google Indexing service.' mod='bl_google_indexing'}
                    {l s='To view your quota, go to the' mod='bl_google_indexing'} <a href="https://console.cloud.google.com/apis/api/indexing.googleapis.com/quotas" target="_blank">{l s='Google API Console' mod='bl_google_indexing'}</a>.
                </label>
            </div>
            <div class="clear_block"></div>
            <hr>
            <br>
            <div style="text-align: center;">
                <input type="submit" name="update_settings" value="{l s='Update' mod='bl_google_indexing'}" class="btn btn-primary">
            </div>
        </form>
    </div>
</div>
<div class="panel">
    <div class="panel-heading">
        <i class="icon-external-link"></i> {l s='request Google indexing manually' mod='bl_google_indexing'}
    </div>
    <div class="row">
        <input id="indexing-page-url" style="width: 350px; margin-right: 5px;" type="text" placeholder="{l s='The page address you want index' mod='bl_google_indexing'}">
        <input id="indexing-action" type="submit" value="{l s='Send to Google' mod='bl_google_indexing'}" class="btn">
        <div class="cb"></div>
        <div id="indexing-action-ok"><div class="blmod-ajax-response"></div></div>
        <div id="indexing-action-error"><div class="blmod-ajax-response-error"></div></div>
    </div>
</div>
<div class="panel">
    <div class="panel-heading">
        <i class="icon-external-link"></i> {l s='Demande d\'indexation Google manuelle' mod='yourmodule'}
    </div>
    <div class="row">
        <div class="col-lg-6">
            <label>{l s='ID Produit Début' mod='yourmodule'}</label>
            <input id="start-id" class="form-control" type="number" placeholder="{l s='ID de début' mod='yourmodule'}">
        </div>
        <div class="col-lg-6">
            <label>{l s='ID Produit Fin' mod='yourmodule'}</label>
            <input id="end-id" class="form-control" type="number" placeholder="{l s='ID de fin' mod='yourmodule'}">

        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <button id="send-to-google" class="btn">{l s='Envoyer en masse à Google' mod='yourmodule'}</button>
        </div>
    </div>
    <div id="indexing-action-ok" style="display:none;">
        <div class="alert alert-success">{l s='Les produits ont été envoyés avec succès à Google.' mod='yourmodule'}</div>
    </div>
    <div id="indexing-action-error" style="display:none;">
        <div class="alert alert-danger">{l s='Une erreur est survenue lors de l\'envoi des produits à Google.' mod='yourmodule'}</div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $('#send-to-google').click(function() {
            var startId = $('#start-id').val();
            var endId = $('#end-id').val();

            if (startId === '' || endId === '') {
                alert('{l s='Veuillez entrer les deux ID de produit.' mod='yourmodule'}');
                return;
            }

            $.ajax({
                url: '{$APIURL}',
                type: 'POST',
                data: {
                    start_id: startId,
                    end_id: endId,
                    action: 'index_all'
                },
                success: function(response) {
                    if (response.success) {
                        $('#indexing-action-ok').show();
                        $('#indexing-action-error').hide();
                    } else {
                        $('#indexing-action-ok').hide();
                        $('#indexing-action-error').show();
                    }
                },
                error: function() {
                    $('#indexing-action-ok').hide();
                    $('#indexing-action-error').show();
                }
            });
        });
    });
</script>


<div class="panel">
    <div class="panel-heading">
        <i class="icon-retweet"></i> {l s='Last actions log' mod='bl_google_indexing'}
    </div>
    <div class="row">
        <form action="{$requestUri|escape:'htmlall':'UTF-8'}" method="post">
            <input style="width: 350px; margin-right: 5px;" type="text" name="log_page_url" value="{$logPageUrl|escape:'htmlall':'UTF-8'}" placeholder="Page URL or part of it" class="blmod_mr10i">
            <input type="submit" value="Search" class="btn">
        </form>
        <table class="table table-clean" cellspacing="0">
            <thead>
                <tr class="nodrag nodrop">
                    <th class="">
                        <span class="title_box">{l s='No' mod='bl_google_indexing'}</span>
                    </th>
                    <th class="">
                        <span class="title_box">{l s='Page URL' mod='bl_google_indexing'}</span>
                    </th>
                    <th class="">
                        <span class="title_box">{l s='Response' mod='bl_google_indexing'} </span>
                    </th>
                    <th class="">
                        <span class="title_box">{l s='Created at' mod='bl_google_indexing'}</span>
                    </th>
                </tr>
            </thead>
            <tbody>
                {foreach $logs as $l}
                    <tr class="odd">
                        <td class="" style="min-width: 40px;  width: 50px; max-width: 70px;">{$l.id|escape:'htmlall':'UTF-8'}</td>
                        <td class="" style="">
                            {$l.url|escape:'htmlall':'UTF-8'}
                            {if !empty($l.error)}
                                <div class="order_error_message">{l s='Error:' mod='bl_google_indexing'} {$l.error|escape:'htmlall':'UTF-8'}</div>
                            {/if}
                        </td>
                        <td class="" style="min-width: 40px;  width: 110px; max-width: 150px;">{$l.response_phrase|escape:'htmlall':'UTF-8'}</td>
                        <td class="" style="min-width: 40px;  width: 135px; max-width: 135px;">{$l.created_at|escape:'htmlall':'UTF-8'}</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
        {if empty($logs)}
            <div>{l s='There is no result for this search.' mod='bl_google_indexing'}</div>
        {/if}
        {if !empty($logsRowsLimit) && !empty($logs)}
            <div style="float: right;" class="blmod_comment">{l s='Last' mod='bl_google_indexing'} {$logsRowsLimit|escape:'htmlall':'UTF-8'} {l s='actions' mod='bl_google_indexing'}</div>
            <div class="clear_block"></div>
        {/if}
    </div>
</div>