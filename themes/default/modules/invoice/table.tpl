<!-- BEGIN: main -->
<link rel="StyleSheet" href="{NV_BASE_SITEURL}themes/{TEMPLATE_CSS}/css/invoice_pdf.css" type="text/css" />
<span style="float: right; margin-bottom: 10px"><strong>{LANG.money_unit}:</strong> {LANG.vnd}</span>
<table class="table table-striped table-bordered table-hover table-middle" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; border-collapse: collapse; border-spacing: 0; background-color: transparent; width: 100%; max-width: 100%; margin-bottom: 18px; border-width: 1px; border-style: solid; border-color: #ddd;">
    <!-- BEGIN: invoice_list -->
    <thead style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left;">
        <tr style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
            <th width="50" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; vertical-align: bottom; border-bottom-style: solid; border-bottom-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; border-bottom-width: 2px;">{LANG.number}</th>
            <th style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; vertical-align: bottom; border-bottom-style: solid; border-bottom-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; border-bottom-width: 2px;">{LANG.title}</th>
            <th width="150" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; vertical-align: bottom; border-bottom-style: solid; border-bottom-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; border-bottom-width: 2px;">{LANG.unit_price}</th>
            <th width="150" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; vertical-align: bottom; border-bottom-style: solid; border-bottom-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; border-bottom-width: 2px;">{LANG.money_unit}</th>
            <th width="80" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; vertical-align: bottom; border-bottom-style: solid; border-bottom-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; border-bottom-width: 2px;">{LANG.quantity}</th>
            <th width="150" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; vertical-align: bottom; border-bottom-style: solid; border-bottom-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; border-bottom-width: 2px;">{LANG.price_string}</th>
            <th width="150" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; vertical-align: bottom; border-bottom-style: solid; border-bottom-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; border-bottom-width: 2px;">{LANG.vat}</th>
            <th width="150" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; vertical-align: bottom; border-bottom-style: solid; border-bottom-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; border-bottom-width: 2px;">{LANG.total}</th>
        </tr>
    </thead>
    <tbody id="item-detail" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
        <!-- BEGIN: loop -->
        <tr style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; text-align: center">{ORDERS.number}</td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">
                <strong>{ORDERS.itemid}</strong><br>
                <span style="display: block; margin-top: 5px; margin-bottom: 10px; color: #737373; font-size: 13px">{ORDERS.note}</span>
            </td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ORDERS.unit_price}</td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ORDERS.money_unit}</td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; text-align: center">{ORDERS.quantity}</td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ORDERS.price} {LANG.vnd}</td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">
                <!-- BEGIN: vat -->
                {ORDERS.vat_price} ({ORDERS.vat}%)
                <!-- END: vat -->
                <!-- BEGIN: vat_empty -->
                -
                <!-- END: vat_empty -->
            </td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ORDERS.total}</td>
        </tr>
        <!-- END: loop -->
    </tbody>
    <!--  END: invoice_list -->
    <tfoot style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
        <tr style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
            <td colspan="6" class="text-right" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: right; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">
                <strong style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; font-weight: bold;">{LANG.item_total}</strong>
            </td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ROW_SEND.item_total} {LANG.vnd}</td>
        </tr>
        <tr style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
            <td colspan="6" class="text-right" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: right; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">
                <strong style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; font-weight: bold;">{LANG.vat_total}</strong>
            </td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ROW_SEND.vat_total} {LANG.vnd}</td>
        </tr>
        <!-- BEGIN: discount -->
        <tr style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
            <td colspan="6" class="text-right" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: right; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">
                <strong style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; font-weight: bold;">{LANG.discount}</strong>
            </td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ROW_SEND.discount_value} {LANG.vnd} ({ROW_SEND.discount_percent}%)</td>
        </tr>
        <!-- END: discount -->
        <tr style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
            <td colspan="6" class="text-right" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: right; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">
                <strong style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; font-weight: bold;">{LANG.grand_total}</strong>
            </td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ROW_SEND.grand_total} {LANG.vnd}</td>
        </tr>
        <tr style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
            <td colspan="6" class="text-right" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: right; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">
                <strong style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; font-weight: bold;">{LANG.grand_total_string}</strong>
            </td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ROW_SEND.grand_total_string}</td>
        </tr>
    </tfoot>
</table>
<!-- END: main -->
<!-- BEGIN: transaction -->
<table class="table table-striped table-bordered table-hover table-middle" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; border-collapse: collapse; border-spacing: 0; background-color: transparent; width: 100%; max-width: 100%; margin-bottom: 18px; border-width: 1px; border-style: solid; border-color: #ddd;">
    <!-- BEGIN: invoice_list -->
    <thead style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left;">
        <tr style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
            <th width="50" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; vertical-align: bottom; border-bottom-style: solid; border-bottom-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; border-bottom-width: 2px;">{LANG.number}</th>
            <th style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; vertical-align: bottom; border-bottom-style: solid; border-bottom-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; border-bottom-width: 2px;">{LANG.title}</th>
            <th width="150" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; vertical-align: bottom; border-bottom-style: solid; border-bottom-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; border-bottom-width: 2px;">{LANG.unit_price}</th>
            <th width="80" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; vertical-align: bottom; border-bottom-style: solid; border-bottom-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; border-bottom-width: 2px;">{LANG.quantity}</th>
            <th width="150" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; vertical-align: bottom; border-bottom-style: solid; border-bottom-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; border-bottom-width: 2px;">{LANG.price_string}</th>
            <th width="150" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; vertical-align: bottom; border-bottom-style: solid; border-bottom-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; border-bottom-width: 2px;">{LANG.vat}</th>
            <th width="150" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: left; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; vertical-align: bottom; border-bottom-style: solid; border-bottom-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; border-bottom-width: 2px;">{LANG.total}</th>
        </tr>
    </thead>
    <tbody id="item-detail" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
        <!-- BEGIN: loop -->
        <tr style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; text-align: center">{ORDERS.number}</td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">
                <strong>{ORDERS.itemid}</strong><br>
                <span style="display: block; margin-top: 5px; margin-bottom: 10px; color: #737373; font-size: 13px">{ORDERS.note}</span>
            </td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ORDERS.unit_price}</td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd; text-align: center">{ORDERS.quantity}</td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ORDERS.price} {LANG.vnd}</td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">
                <!-- BEGIN: vat -->
                {ORDERS.vat_price} ({ORDERS.vat}%)
                <!-- END: vat -->
                <!-- BEGIN: vat_empty -->
                -
                <!-- END: vat_empty -->
            </td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ORDERS.total}</td>
        </tr>
        <!-- END: loop -->
    </tbody>
    <!--  END: invoice_list -->
    <tfoot style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
        <tr style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
            <td colspan="6" class="text-right" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: right; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">
                <strong style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; font-weight: bold;">{LANG.item_total}</strong>
            </td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ROW_SEND.item_total} {LANG.vnd}</td>
        </tr>
        <tr style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
            <td colspan="6" class="text-right" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: right; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">
                <strong style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; font-weight: bold;">{LANG.vat_total}</strong>
            </td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ROW_SEND.vat_total} {LANG.vnd}</td>
        </tr>
        <!-- BEGIN: discount -->
        <tr style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
            <td colspan="6" class="text-right" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: right; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">
                <strong style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; font-weight: bold;">{LANG.discount}</strong>
            </td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ROW_SEND.discount_value} {LANG.vnd} ({ROW_SEND.discount_percent}%)</td>
        </tr>
        <!-- END: discount -->
        <tr style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
            <td colspan="6" class="text-right" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: right; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">
                <strong style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; font-weight: bold;">{LANG.grand_total}</strong>
            </td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ROW_SEND.grand_total} {LANG.vnd}</td>
        </tr>
        <tr style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">
            <td colspan="6" class="text-right" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; text-align: right; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">
                <strong style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; font-weight: bold;">{LANG.grand_total_string}</strong>
            </td>
            <td style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding-top: 8px; padding-bottom: 8px; padding-right: 8px; padding-left: 8px; line-height: 1.42857143; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #ddd; border-width: 1px; border-style: solid; border-color: #ddd;">{ROW_SEND.grand_total_string}</td>
        </tr>
    </tfoot>
</table>
<!-- END: transaction -->
