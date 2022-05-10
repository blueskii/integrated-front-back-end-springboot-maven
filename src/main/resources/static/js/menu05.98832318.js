"use strict";(self["webpackChunkfront_end_vue"]=self["webpackChunkfront_end_vue"]||[]).push([[319],{8201:function(n,o,t){t.r(o),t.d(o,{default:function(){return J}});var l=t(3396),e=t(7139);const s={class:"card"},a=(0,l._)("div",{class:"card-header"},"Setup Hook",-1),c={class:"card-body"},u=(0,l._)("hr",null,null,-1),r=(0,l._)("hr",null,null,-1);function d(n,o,t,d,i,v){return(0,l.wg)(),(0,l.iD)("div",s,[a,(0,l._)("div",c,[(0,l._)("p",null,"prop1: "+(0,e.zw)(t.prop1),1),u,(0,l._)("p",null,"count: "+(0,e.zw)(d.count),1),(0,l._)("button",{onClick:o[0]||(o[0]=n=>d.count++),class:"btn btn-info btn-sm mr-2"},"증가"),(0,l._)("button",{onClick:o[1]||(o[1]=(...n)=>d.addCount&&d.addCount(...n)),class:"btn btn-info btn-sm mr-2"},"증가"),r,(0,l._)("button",{onClick:o[2]||(o[2]=(...n)=>d.emitEvent&&d.emitEvent(...n)),class:"btn btn-info btn-sm mr-2"},"이벤트 발행")])])}var i=t(4870),v={props:["prop1"],emits:["component-event"],setup(n,o){console.log("setup() 실행"),console.log("props",n);const t=(0,i.iH)(0);function l(){t.value++}function e(){o.emit("component-event")}return{count:t,addCount:l,emitEvent:e}}},p=t(89);const _=(0,p.Z)(v,[["render",d]]);var b=_;const f={class:"card"},m=(0,l._)("div",{class:"card-header"},"Mount관련 Hook",-1),k=(0,l._)("div",{class:"card-body"}," onBeforeMount, onMounted, onBeforeUnmount, onUnmounted ",-1),h=[m,k];var g={setup(n){return(0,l.wF)((()=>{console.log("onBeforeMount Hook")})),(0,l.bv)((()=>{console.log("onMounted Hook")})),(0,l.Jd)((()=>{console.log("onBeforeUnmount Hook")})),(0,l.Ah)((()=>{console.log("onUnmounted Hook")})),(n,o)=>((0,l.wg)(),(0,l.iD)("div",f,h))}};const C=g;var H=C;const w={class:"card"},y=(0,l._)("div",{class:"card-header"},"Update관련 Hook",-1),U={class:"card-body"},D=(0,l.Uk)(" onBeforeUpdate, onUpdated "),E=(0,l._)("hr",null,null,-1);var x={setup(n){const o=(0,i.iH)(0);return(0,l.Xn)((()=>{console.log("onBeforeUpdate Hook")})),(0,l.ic)((()=>{console.log("onUpdated Hook")})),(n,t)=>((0,l.wg)(),(0,l.iD)("div",w,[y,(0,l._)("div",U,[D,E,(0,l._)("p",null,"count: "+(0,e.zw)(o.value),1),(0,l._)("button",{onClick:t[0]||(t[0]=n=>o.value++),class:"btn btn-info btn-sm mr-2"},"증가"),(0,l._)("button",{onClick:t[1]||(t[1]=n=>o.value--),class:"btn btn-info btn-sm"},"감소")])]))}};const z=x;var B=z;const M={class:"card"},W=(0,l._)("div",{class:"card-header"}," Exam01LifecycleHooks ",-1),R={class:"card-body"};var A={setup(n){function o(){console.log("handleComponentEvent()")}return(n,t)=>((0,l.wg)(),(0,l.iD)("div",M,[W,(0,l._)("div",R,[(0,l.Wm)(b,{prop1:"value1",onComponentEvent:o}),(0,l.Wm)(H,{class:"mt-3"}),(0,l.Wm)(B,{class:"mt-3"})])]))}};const F=A;var J=F},7137:function(n,o,t){t.r(o),t.d(o,{default:function(){return C}});var l=t(3396),e=t(7139),s=t(4870);const a={class:"card"},c=(0,l._)("div",{class:"card-header"},"Child",-1),u={class:"card-body"};var r={setup(n,{expose:o}){const t=(0,s.iH)(10);function r(){t.value-=1}return o({data:t,method:r}),(n,o)=>((0,l.wg)(),(0,l.iD)("div",a,[c,(0,l._)("div",u,[(0,l._)("p",null,"data: "+(0,e.zw)(t.value),1)])]))}};const d=r;var i=d;const v={class:"card"},p=(0,l._)("div",{class:"card-header"}," Exam03Ref ",-1),_={class:"card-body"},b=(0,l._)("h6",null,"[DOM 요소 참조]",-1),f={class:"d-flex"},m=(0,l._)("hr",null,null,-1),k=(0,l._)("h6",null,"[자식 컴포넌트 참조]",-1);var h={setup(n){const o=(0,s.iH)("summer"),t=(0,s.iH)(null);function a(){t.value.value=o.value}(0,l.bv)((()=>{t.value.focus()}));const c=(0,s.iH)(null);function u(){c.value.data+=1}function r(){c.value.method()}return(n,s)=>((0,l.wg)(),(0,l.iD)("div",v,[p,(0,l._)("div",_,[(0,l._)("div",null,[b,(0,l._)("p",null,"data: "+(0,e.zw)(o.value),1),(0,l._)("div",f,[(0,l._)("button",{onClick:a,class:"btn btn-info btn-sm mr-2"},"값 변경"),(0,l._)("input",{type:"text",ref_key:"inputRef",ref:t,style:{"line-height":"25px"}},null,512)])]),m,(0,l._)("div",null,[k,(0,l._)("p",null,"child data: "+(0,e.zw)(null!==c.value?c.value.data:""),1),(0,l._)("p",null,[(0,l._)("button",{onClick:u,class:"btn btn-info btn-sm mr-2"},"자식 데이터 변경"),(0,l._)("button",{onClick:r,class:"btn btn-info btn-sm mr-2"},"자식 메소드 호출")]),(0,l.Wm)(i,{ref_key:"childRef",ref:c,class:"mt-3"},null,512)])])]))}};const g=h;var C=g}}]);
//# sourceMappingURL=menu05.98832318.js.map