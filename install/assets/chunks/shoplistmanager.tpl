/**
 * shop.list.manager
 *
 * shop.list.manager
 *
 * @category	chunk
 * @internal	@modx_category ShopList
 * @internal	@installset base
 * @internal	@overwrite true
 */
<div class="review_block">
	<div class="status">		
		<form method="post" action="">
			<input type="hidden" name="ids" value="[+id+]">
			<select name="status" class="statuss">			
				<option value="1" selected="">Новый</option>
        		<option value="2">Принят к оплате</option>
        		<option value="3">Отправлен</option>
        		<option value="4">Выполнен</option>
        		<option value="5">Отменен</option>
        		<option value="6">Оплата получена</option>
			</select>
			<button class="btn btn-block btn-info save" style="margin:10px 0;">Сохранить</button>
		</form>
	</div>
	<h4>Заказ #[+id+] <i>([+date+])</i></h4>
	<p><b>[+name+]</b> <a href="mailto:[+email+]">[+email+]</a> <a href="tel:[+phone+]">[+phone+]</a></p>
	<p><b>Метод доставки:</b> [+payment+]</p>
	<p><b>Метод оплаты:</b> [+delivery+] [+address+]</p>
	<p id="look[+id+]"><a href="javascript:$('#look[+id+]').hide();$('#order[+id+]').slideDown();">Посмотреть заказ</a></p>
	<div id="order[+id+]" style="display:none;">
		<p><b>Состав заказа:</b></p><hr>
		<div class="table-responsive">
			<table class="table data" cellpadding="1" cellspacing="1" width="100%">
				<thead>
					<tr>
						<td class="tableHeader" width="34"></td>
						<td class="tableHeader">Артикул</td>
						<td class="tableHeader">Картинка</td>
						<td class="tableHeader">Название</td>
						<td class="tableHeader" width="72">кол-во</td>
						<td class="tableHeader">цена</td>
					</tr>
				</thead>
				<tbody>
					[+table+]		
					<tr>
						<td colspan="5" style="text-align:right;"><b>Итого: </b></td>
						<td>[+price+]</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
