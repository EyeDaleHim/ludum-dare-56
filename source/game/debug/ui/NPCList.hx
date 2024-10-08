package game.debug.ui;

import util.DataUtil;
import game.asset.AssetManager;
import feathers.controls.Header;
import feathers.layout.VerticalLayout;
import feathers.controls.LayoutGroup;
import openfl.Lib;
import feathers.controls.Label;
import feathers.layout.HorizontalLayout;
import feathers.controls.dataRenderers.LayoutGroupItemRenderer;
import feathers.utils.DisplayObjectRecycler;
import feathers.data.ArrayCollection;
import game.object.NPC;
import feathers.controls.ListView;

class NPCList extends LayoutGroup{
    private var _listView:ListView;
    private var _header:Header;
    private var _id:String;

    public function new(id:String){
        super();       

        this._id = id;
        setup();
    }

    public function setData(data:Array<NPC>){
        this._listView.dataProvider = new ArrayCollection(data);
    }

    private function setup():Void{
        var vLayout:VerticalLayout = new VerticalLayout();
        this.layout = vLayout;

        var name:String = DataUtil.getObjectByID(this._id, AssetManager.getData(CLANS).clans).name + " NPCs";
        this._header = new Header(name);
        this._header.width = (Lib.current.stage.stageWidth / 6) - 2;
        addChild(this._header);

        this._listView = new ListView();
        this._listView.itemRendererRecycler = DisplayObjectRecycler.withFunction(_renderNPC);
        this._listView.width = this._header.width;
        this._listView.height = 256;
        addChild(this._listView);
    }

    private function _renderNPC():LayoutGroupItemRenderer{
        var itemRenderer = new LayoutGroupItemRenderer();

        var layout = new HorizontalLayout(); 
        layout.gap = 6.0;
        layout.paddingTop = 4.0;
        layout.paddingBottom = 4.0;
        layout.paddingLeft = 6.0;
        layout.paddingRight = 6.0;
        itemRenderer.layout = layout;
    
        /* var icon = new AssetLoader();
        icon.name = "loader";
        itemRenderer.addChild(icon); */
    
        var label = new Label();
        label.name = "label";
        itemRenderer.addChild(label);
    
        return itemRenderer;
    }


}