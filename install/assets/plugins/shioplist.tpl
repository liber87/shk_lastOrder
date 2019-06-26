//<?php
/**
 * ShiopList
 *
 * ShiopList
 *
 * @category    plugin
 * @internal    @events OnManagerWelcomeHome
 * @internal    @modx_category ShopList
 * @internal    @properties 
 * @internal    @disabled 0
 * @internal    @installset base
 */
$e = &$modx->Event;
switch($e->name){
    case 'OnManagerWelcomeHome':
                       
        
                 
        $widgets['shop'] = array(
            'menuindex' =>'1',
            'id' => 'shop',
            'cols' => 'col-sm-12',
            'icon' => 'fa-shopping-cart',
            'title' => 'Активные заказы',
            'body' => '<div class="card-body">'.$modx->runSnippet('ShopList').'</div>',
            'hide'=>'0'
        );
		
		
	$modx->event->output(serialize($widgets));
    break;
}
