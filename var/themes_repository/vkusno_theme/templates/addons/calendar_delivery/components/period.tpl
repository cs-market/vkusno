{if $period_step}
    {$periods = $period_start|fn_get_calendar_delivery_period:$period_finish:$period_step}

    <div id="{$date_id}" class="period-container">
        <p class="title">{__("delivery_time")}</p>
        <span class="ip5_date_update"></span>
        <div class="period-container_content">
        {foreach from=$periods item="period"}
            <div>
                <input type="radio" name="{$date_name}" id="{$date_id}_{$period.value}" value="{$period.value}" data-ca-period-hour="{$period.hour}" {if $period.value == $date_val}checked="checked"{/if}/>
                <label for="{$date_id}_{$period.value}">{$period.value}</label>

            </div>

        {/foreach}
        </div>
    </div>

    <script type="text/javascript">
        (function(_, $) {
            $.ceEvent('on', 'ce.commoninit', function(context) {
                var hidePeriod = function() {
                    var selectedDate = $('#{$datapicker_id}').datepicker('getDate');
                    if (selectedDate < new Date()) {
                        // if set today in calendar
                        var nowHour = new Date().getHours();
                        // disable past periods
                        $('#{$date_id} input[type="radio"]').each(function() {
                            if (nowHour > $(this).data('caPeriodHour')) {
                                $(this).prop('disabled', true);
                            }
                        });
                    } else {
                        // enable all options
                        $('#{$date_id} input[type="radio"]').prop('disabled', false);
                    }

                    // select first available
                    $('#{$date_id} input[type="radio"]:enabled').eq(0).prop('checked', true);
                };

                // on load
                hidePeriod();

                // on change
                $('#{$datapicker_id}').datepicker().change(function() {
                    hidePeriod();
                });
            });
        }(Tygh, Tygh.$));
    </script>
{/if}
