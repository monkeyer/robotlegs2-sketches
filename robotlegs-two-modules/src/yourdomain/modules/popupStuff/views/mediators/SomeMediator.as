package yourdomain.modules.popupStuff.views.mediators
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import yourdomain.modules.popupStuff.views.components.SomeView;
	import yourdomain.modules.popupStuff.controllers.events.SomeEvent;
	
	/**
	 *
	 * @author Ondina D. F.
	 */
	public class SomeMediator extends Mediator
	{
		[Inject]
		public var view:SomeView;
		
		public function SomeMediator()
		{
			super();
		}
		
		override public function initialize():void
		{
			trace("==SomeMediator initialize");
			addViewListener(SomeEvent.DATA_PING, dispatch, SomeEvent);
			addContextListener(SomeEvent.DATA_PONG, onDataPong, SomeEvent);
		}
		
		private function onDataPong(event:SomeEvent):void
		{
			view.onDataPong(event.someData);				
		}
		
		override public function destroy():void
		{
			eventMap.unmapListeners();
			super.destroy();
			trace("SomeMediator.destroy()");
		}
	}
}
