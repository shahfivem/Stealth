const nf=function(){const e=document.createElement("link").relList;if(e&&e.supports&&e.supports("modulepreload"))return;for(const s of document.querySelectorAll('link[rel="modulepreload"]'))n(s);new MutationObserver(s=>{for(const r of s)if(r.type==="childList")for(const o of r.addedNodes)o.tagName==="LINK"&&o.rel==="modulepreload"&&n(o)}).observe(document,{childList:!0,subtree:!0});function t(s){const r={};return s.integrity&&(r.integrity=s.integrity),s.referrerpolicy&&(r.referrerPolicy=s.referrerpolicy),s.crossorigin==="use-credentials"?r.credentials="include":s.crossorigin==="anonymous"?r.credentials="omit":r.credentials="same-origin",r}function n(s){if(s.ep)return;s.ep=!0;const r=t(s);fetch(s.href,r)}};nf();function qt(){}const sf=i=>i;function xt(i,e){for(const t in e)i[t]=e[t];return i}function Wc(i){return i()}function ra(){return Object.create(null)}function St(i){i.forEach(Wc)}function Gs(i){return typeof i=="function"}function rt(i,e){return i!=i?e==e:i!==e||i&&typeof i=="object"||typeof i=="function"}function rf(i){return Object.keys(i).length===0}function Ho(i,...e){if(i==null)return qt;const t=i.subscribe(...e);return t.unsubscribe?()=>t.unsubscribe():t}function di(i){let e;return Ho(i,t=>e=t)(),e}function Be(i,e,t){i.$$.on_destroy.push(Ho(e,t))}function Gt(i,e,t,n){if(i){const s=jc(i,e,t,n);return i[0](s)}}function jc(i,e,t,n){return i[1]&&n?xt(t.ctx.slice(),i[1](n(e))):t.ctx}function Ht(i,e,t,n){if(i[2]&&n){const s=i[2](n(t));if(e.dirty===void 0)return s;if(typeof s=="object"){const r=[],o=Math.max(e.dirty.length,s.length);for(let a=0;a<o;a+=1)r[a]=e.dirty[a]|s[a];return r}return e.dirty|s}return e.dirty}function Vt(i,e,t,n,s,r){if(s){const o=jc(e,t,n,r);i.p(o,s)}}function Wt(i){if(i.ctx.length>32){const e=[],t=i.ctx.length/32;for(let n=0;n<t;n++)e[n]=-1;return e}return-1}function nn(i){const e={};for(const t in i)t[0]!=="$"&&(e[t]=i[t]);return e}function wr(i,e){const t={};e=new Set(e);for(const n in i)!e.has(n)&&n[0]!=="$"&&(t[n]=i[n]);return t}function oa(i){return i==null?"":i}function bt(i,e,t){return i.set(t),e}function of(i){return i&&Gs(i.destroy)?i.destroy:qt}function aa(i){const e=typeof i=="string"&&i.match(/^\s*(-?[\d.]+)([^\s]*)\s*$/);return e?[parseFloat(e[1]),e[2]||"px"]:[i,"px"]}const Xc=typeof window!="undefined";let af=Xc?()=>window.performance.now():()=>Date.now(),Vo=Xc?i=>requestAnimationFrame(i):qt;const ts=new Set;function qc(i){ts.forEach(e=>{e.c(i)||(ts.delete(e),e.f())}),ts.size!==0&&Vo(qc)}function lf(i){let e;return ts.size===0&&Vo(qc),{promise:new Promise(t=>{ts.add(e={c:i,f:t})}),abort(){ts.delete(e)}}}function E(i,e){i.appendChild(e)}function Yc(i){if(!i)return document;const e=i.getRootNode?i.getRootNode():i.ownerDocument;return e&&e.host?e:i.ownerDocument}function cf(i){const e=F("style");return uf(Yc(i),e),e.sheet}function uf(i,e){return E(i.head||i,e),e.sheet}function Me(i,e,t){i.insertBefore(e,t||null)}function _e(i){i.parentNode&&i.parentNode.removeChild(i)}function Ri(i,e){for(let t=0;t<i.length;t+=1)i[t]&&i[t].d(e)}function F(i){return document.createElement(i)}function Zc(i){return document.createElementNS("http://www.w3.org/2000/svg",i)}function qe(i){return document.createTextNode(i)}function J(){return qe(" ")}function Pn(){return qe("")}function he(i,e,t,n){return i.addEventListener(e,t,n),()=>i.removeEventListener(e,t,n)}function I(i,e,t){t==null?i.removeAttribute(e):i.getAttribute(e)!==t&&i.setAttribute(e,t)}function Er(i,e){for(const t in e)I(i,t,e[t])}function Ao(i,e,t){e in i?i[e]=typeof i[e]=="boolean"&&t===""?!0:t:I(i,e,t)}function Rs(i){return i===""?null:+i}function ff(i){return Array.from(i.childNodes)}function Bt(i,e){e=""+e,i.data!==e&&(i.data=e)}function Ft(i,e){i.value=e==null?"":e}function Ae(i,e,t,n){t==null?i.style.removeProperty(e):i.style.setProperty(e,t,n?"important":"")}let Xs;function hf(){if(Xs===void 0){Xs=!1;try{typeof window!="undefined"&&window.parent&&window.parent.document}catch{Xs=!0}}return Xs}function df(i,e){getComputedStyle(i).position==="static"&&(i.style.position="relative");const n=F("iframe");n.setAttribute("style","display: block; position: absolute; top: 0; left: 0; width: 100%; height: 100%; overflow: hidden; border: 0; opacity: 0; pointer-events: none; z-index: -1;"),n.setAttribute("aria-hidden","true"),n.tabIndex=-1;const s=hf();let r;return s?(n.src="data:text/html,<script>onresize=function(){parent.postMessage(0,'*')}<\/script>",r=he(window,"message",o=>{o.source===n.contentWindow&&e()})):(n.src="about:blank",n.onload=()=>{r=he(n.contentWindow,"resize",e),e()}),E(i,n),()=>{(s||r&&n.contentWindow)&&r(),_e(n)}}function Kc(i,e,{bubbles:t=!1,cancelable:n=!1}={}){const s=document.createEvent("CustomEvent");return s.initCustomEvent(i,t,n,e),s}const Tr=new Map;let Ar=0;function pf(i){let e=5381,t=i.length;for(;t--;)e=(e<<5)-e^i.charCodeAt(t);return e>>>0}function mf(i,e){const t={stylesheet:cf(e),rules:{}};return Tr.set(i,t),t}function la(i,e,t,n,s,r,o,a=0){const l=16.666/n;let c=`{
`;for(let m=0;m<=1;m+=l){const d=e+(t-e)*r(m);c+=m*100+`%{${o(d,1-d)}}
`}const f=c+`100% {${o(t,1-t)}}
}`,h=`__svelte_${pf(f)}_${a}`,u=Yc(i),{stylesheet:p,rules:g}=Tr.get(u)||mf(u,i);g[h]||(g[h]=!0,p.insertRule(`@keyframes ${h} ${f}`,p.cssRules.length));const v=i.style.animation||"";return i.style.animation=`${v?`${v}, `:""}${h} ${n}ms linear ${s}ms 1 both`,Ar+=1,h}function gf(i,e){const t=(i.style.animation||"").split(", "),n=t.filter(e?r=>r.indexOf(e)<0:r=>r.indexOf("__svelte")===-1),s=t.length-n.length;s&&(i.style.animation=n.join(", "),Ar-=s,Ar||_f())}function _f(){Vo(()=>{Ar||(Tr.forEach(i=>{const{ownerNode:e}=i.stylesheet;e&&_e(e)}),Tr.clear())})}let zs;function Ds(i){zs=i}function fs(){if(!zs)throw new Error("Function called outside component initialization");return zs}function Pr(i){fs().$$.on_mount.push(i)}function wt(i){fs().$$.on_destroy.push(i)}function Lr(){const i=fs();return(e,t,{cancelable:n=!1}={})=>{const s=i.$$.callbacks[e];if(s){const r=Kc(e,t,{cancelable:n});return s.slice().forEach(o=>{o.call(i,r)}),!r.defaultPrevented}return!0}}function Tn(i,e){return fs().$$.context.set(i,e),e}function Fn(i){return fs().$$.context.get(i)}function os(i,e){const t=i.$$.callbacks[e.type];t&&t.slice().forEach(n=>n.call(this,e))}const Qi=[],xn=[];let ns=[];const Co=[],Qc=Promise.resolve();let Po=!1;function Jc(){Po||(Po=!0,Qc.then($c))}function ai(){return Jc(),Qc}function Bn(i){ns.push(i)}function Hs(i){Co.push(i)}const jr=new Set;let Ii=0;function $c(){if(Ii!==0)return;const i=zs;do{try{for(;Ii<Qi.length;){const e=Qi[Ii];Ii++,Ds(e),vf(e.$$)}}catch(e){throw Qi.length=0,Ii=0,e}for(Ds(null),Qi.length=0,Ii=0;xn.length;)xn.pop()();for(let e=0;e<ns.length;e+=1){const t=ns[e];jr.has(t)||(jr.add(t),t())}ns.length=0}while(Qi.length);for(;Co.length;)Co.pop()();Po=!1,jr.clear(),Ds(i)}function vf(i){if(i.fragment!==null){i.update(),St(i.before_update);const e=i.dirty;i.dirty=[-1],i.fragment&&i.fragment.p(i.ctx,e),i.after_update.forEach(Bn)}}function bf(i){const e=[],t=[];ns.forEach(n=>i.indexOf(n)===-1?e.push(n):t.push(n)),t.forEach(n=>n()),ns=e}let bs;function Mf(){return bs||(bs=Promise.resolve(),bs.then(()=>{bs=null})),bs}function Xr(i,e,t){i.dispatchEvent(Kc(`${e?"intro":"outro"}${t}`))}const br=new Set;let Jn;function ln(){Jn={r:0,c:[],p:Jn}}function cn(){Jn.r||St(Jn.c),Jn=Jn.p}function le(i,e){i&&i.i&&(br.delete(i),i.i(e))}function ue(i,e,t,n){if(i&&i.o){if(br.has(i))return;br.add(i),Jn.c.push(()=>{br.delete(i),n&&(t&&i.d(1),n())}),i.o(e)}else n&&n()}const xf={duration:0};function Gn(i,e,t,n){const s={direction:"both"};let r=e(i,t,s),o=n?0:1,a=null,l=null,c=null;function f(){c&&gf(i,c)}function h(p,g){const v=p.b-o;return g*=Math.abs(v),{a:o,b:p.b,d:v,duration:g,start:p.start,end:p.start+g,group:p.group}}function u(p){const{delay:g=0,duration:v=300,easing:m=sf,tick:d=qt,css:M}=r||xf,b={start:af()+g,b:p};p||(b.group=Jn,Jn.r+=1),a||l?l=b:(M&&(f(),c=la(i,o,p,v,g,m,M)),p&&d(0,1),a=h(b,v),Bn(()=>Xr(i,p,"start")),lf(x=>{if(l&&x>l.start&&(a=h(l,v),l=null,Xr(i,a.b,"start"),M&&(f(),c=la(i,o,a.b,a.duration,0,m,r.css))),a){if(x>=a.end)d(o=a.b,1-o),Xr(i,a.b,"end"),l||(a.b?f():--a.group.r||St(a.group.c)),a=null;else if(x>=a.start){const y=x-a.start;o=a.a+a.d*m(y/a.duration),d(o,1-o)}}return!!(a||l)}))}return{run(p){Gs(r)?Mf().then(()=>{r=r(s),u(p)}):u(p)},end(){f(),a=l=null}}}function Sf(i,e){ue(i,1,1,()=>{e.delete(i.key)})}function yf(i,e,t,n,s,r,o,a,l,c,f,h){let u=i.length,p=r.length,g=u;const v={};for(;g--;)v[i[g].key]=g;const m=[],d=new Map,M=new Map,b=[];for(g=p;g--;){const L=h(s,r,g),w=t(L);let _=o.get(w);_?n&&b.push(()=>_.p(L,e)):(_=c(w,L),_.c()),d.set(w,m[g]=_),w in v&&M.set(w,Math.abs(g-v[w]))}const x=new Set,y=new Set;function T(L){le(L,1),L.m(a,f),o.set(L.key,L),f=L.first,p--}for(;u&&p;){const L=m[p-1],w=i[u-1],_=L.key,S=w.key;L===w?(f=L.first,u--,p--):d.has(S)?!o.has(_)||x.has(_)?T(L):y.has(S)?u--:M.get(_)>M.get(S)?(y.add(_),T(L)):(x.add(S),u--):(l(w,o),u--)}for(;u--;){const L=i[u];d.has(L.key)||l(L,o)}for(;p;)T(m[p-1]);return St(b),m}function pi(i,e){const t={},n={},s={$$scope:1};let r=i.length;for(;r--;){const o=i[r],a=e[r];if(a){for(const l in o)l in a||(n[l]=1);for(const l in a)s[l]||(t[l]=a[l],s[l]=1);i[r]=a}else for(const l in o)s[l]=1}for(const o in n)o in t||(t[o]=void 0);return t}function hs(i){return typeof i=="object"&&i!==null?i:{}}function Vs(i,e,t){const n=i.$$.props[e];n!==void 0&&(i.$$.bound[n]=t,t(i.$$.ctx[n]))}function Fe(i){i&&i.c()}function Ne(i,e,t,n){const{fragment:s,after_update:r}=i.$$;s&&s.m(e,t),n||Bn(()=>{const o=i.$$.on_mount.map(Wc).filter(Gs);i.$$.on_destroy?i.$$.on_destroy.push(...o):St(o),i.$$.on_mount=[]}),r.forEach(Bn)}function Oe(i,e){const t=i.$$;t.fragment!==null&&(bf(t.after_update),St(t.on_destroy),t.fragment&&t.fragment.d(e),t.on_destroy=t.fragment=null,t.ctx=[])}function wf(i,e){i.$$.dirty[0]===-1&&(Qi.push(i),Jc(),i.$$.dirty.fill(0)),i.$$.dirty[e/31|0]|=1<<e%31}function ot(i,e,t,n,s,r,o,a=[-1]){const l=zs;Ds(i);const c=i.$$={fragment:null,ctx:[],props:r,update:qt,not_equal:s,bound:ra(),on_mount:[],on_destroy:[],on_disconnect:[],before_update:[],after_update:[],context:new Map(e.context||(l?l.$$.context:[])),callbacks:ra(),dirty:a,skip_bound:!1,root:e.target||l.$$.root};o&&o(c.root);let f=!1;if(c.ctx=t?t(i,e.props||{},(h,u,...p)=>{const g=p.length?p[0]:u;return c.ctx&&s(c.ctx[h],c.ctx[h]=g)&&(!c.skip_bound&&c.bound[h]&&c.bound[h](g),f&&wf(i,h)),u}):[],c.update(),f=!0,St(c.before_update),c.fragment=n?n(c.ctx):!1,e.target){if(e.hydrate){const h=ff(e.target);c.fragment&&c.fragment.l(h),h.forEach(_e)}else c.fragment&&c.fragment.c();e.intro&&le(i.$$.fragment),Ne(i,e.target,e.anchor,e.customElement),$c()}Ds(l)}class at{$destroy(){Oe(this,1),this.$destroy=qt}$on(e,t){if(!Gs(t))return qt;const n=this.$$.callbacks[e]||(this.$$.callbacks[e]=[]);return n.push(t),()=>{const s=n.indexOf(t);s!==-1&&n.splice(s,1)}}$set(e){this.$$set&&!rf(e)&&(this.$$.skip_bound=!0,this.$$set(e),this.$$.skip_bound=!1)}}const Ui=[];function eu(i,e){return{subscribe:Je(i,e).subscribe}}function Je(i,e=qt){let t;const n=new Set;function s(a){if(rt(i,a)&&(i=a,t)){const l=!Ui.length;for(const c of n)c[1](),Ui.push(c,i);if(l){for(let c=0;c<Ui.length;c+=2)Ui[c][0](Ui[c+1]);Ui.length=0}}}function r(a){s(a(i))}function o(a,l=qt){const c=[a,l];return n.add(c),n.size===1&&(t=e(s)||qt),a(i),()=>{n.delete(c),n.size===0&&t&&(t(),t=null)}}return{set:s,update:r,subscribe:o}}function Ef(i,e,t){const n=!Array.isArray(i),s=n?[i]:i,r=e.length<2;return eu(t,o=>{let a=!1;const l=[];let c=0,f=qt;const h=()=>{if(c)return;f();const p=e(n?l[0]:l,o);r?o(p):f=Gs(p)?p:qt},u=s.map((p,g)=>Ho(p,v=>{l[g]=v,c&=~(1<<g),a&&h()},()=>{c|=1<<g}));return a=!0,h(),function(){St(u),f(),a=!1}})}/**
 * @license
 * Copyright 2010-2023 Three.js Authors
 * SPDX-License-Identifier: MIT
 */const Wo="151",Tf=0,ca=1,Af=2,tu=1,nu=2,Ts=3,ci=0,un=1,zn=2,li=0,is=1,ua=2,fa=3,ha=4,Cf=5,Ji=100,Pf=101,Lf=102,da=103,pa=104,Rf=200,Df=201,If=202,Uf=203,iu=204,su=205,zf=206,kf=207,Nf=208,Of=209,Ff=210,Bf=0,Gf=1,Hf=2,Lo=3,Vf=4,Wf=5,jf=6,Xf=7,ru=0,qf=1,Yf=2,Nn=0,Zf=1,Kf=2,Qf=3,ou=4,Jf=5,au=300,as=301,ls=302,Ro=303,Do=304,Rr=306,Io=1e3,An=1001,Uo=1002,$t=1003,ma=1004,qr=1005,Mn=1006,$f=1007,ks=1008,Li=1009,eh=1010,th=1011,lu=1012,nh=1013,Ai=1014,Ci=1015,Ns=1016,ih=1017,sh=1018,ss=1020,rh=1021,Cn=1023,oh=1024,ah=1025,Pi=1026,cs=1027,lh=1028,ch=1029,uh=1030,fh=1031,hh=1033,Yr=33776,Zr=33777,Kr=33778,Qr=33779,ga=35840,_a=35841,va=35842,ba=35843,dh=36196,Ma=37492,xa=37496,Sa=37808,ya=37809,wa=37810,Ea=37811,Ta=37812,Aa=37813,Ca=37814,Pa=37815,La=37816,Ra=37817,Da=37818,Ia=37819,Ua=37820,za=37821,Jr=36492,ph=36283,ka=36284,Na=36285,Oa=36286,ui=3e3,vt=3001,mh=3200,gh=3201,cu=0,_h=1,In="srgb",Os="srgb-linear",uu="display-p3",$r=7680,vh=519,Fa=35044,Ba="300 es",zo=1035;class ds{addEventListener(e,t){this._listeners===void 0&&(this._listeners={});const n=this._listeners;n[e]===void 0&&(n[e]=[]),n[e].indexOf(t)===-1&&n[e].push(t)}hasEventListener(e,t){if(this._listeners===void 0)return!1;const n=this._listeners;return n[e]!==void 0&&n[e].indexOf(t)!==-1}removeEventListener(e,t){if(this._listeners===void 0)return;const s=this._listeners[e];if(s!==void 0){const r=s.indexOf(t);r!==-1&&s.splice(r,1)}}dispatchEvent(e){if(this._listeners===void 0)return;const n=this._listeners[e.type];if(n!==void 0){e.target=this;const s=n.slice(0);for(let r=0,o=s.length;r<o;r++)s[r].call(this,e);e.target=null}}}const Yt=["00","01","02","03","04","05","06","07","08","09","0a","0b","0c","0d","0e","0f","10","11","12","13","14","15","16","17","18","19","1a","1b","1c","1d","1e","1f","20","21","22","23","24","25","26","27","28","29","2a","2b","2c","2d","2e","2f","30","31","32","33","34","35","36","37","38","39","3a","3b","3c","3d","3e","3f","40","41","42","43","44","45","46","47","48","49","4a","4b","4c","4d","4e","4f","50","51","52","53","54","55","56","57","58","59","5a","5b","5c","5d","5e","5f","60","61","62","63","64","65","66","67","68","69","6a","6b","6c","6d","6e","6f","70","71","72","73","74","75","76","77","78","79","7a","7b","7c","7d","7e","7f","80","81","82","83","84","85","86","87","88","89","8a","8b","8c","8d","8e","8f","90","91","92","93","94","95","96","97","98","99","9a","9b","9c","9d","9e","9f","a0","a1","a2","a3","a4","a5","a6","a7","a8","a9","aa","ab","ac","ad","ae","af","b0","b1","b2","b3","b4","b5","b6","b7","b8","b9","ba","bb","bc","bd","be","bf","c0","c1","c2","c3","c4","c5","c6","c7","c8","c9","ca","cb","cc","cd","ce","cf","d0","d1","d2","d3","d4","d5","d6","d7","d8","d9","da","db","dc","dd","de","df","e0","e1","e2","e3","e4","e5","e6","e7","e8","e9","ea","eb","ec","ed","ee","ef","f0","f1","f2","f3","f4","f5","f6","f7","f8","f9","fa","fb","fc","fd","fe","ff"];let Ga=1234567;const Is=Math.PI/180,Fs=180/Math.PI;function ps(){const i=Math.random()*4294967295|0,e=Math.random()*4294967295|0,t=Math.random()*4294967295|0,n=Math.random()*4294967295|0;return(Yt[i&255]+Yt[i>>8&255]+Yt[i>>16&255]+Yt[i>>24&255]+"-"+Yt[e&255]+Yt[e>>8&255]+"-"+Yt[e>>16&15|64]+Yt[e>>24&255]+"-"+Yt[t&63|128]+Yt[t>>8&255]+"-"+Yt[t>>16&255]+Yt[t>>24&255]+Yt[n&255]+Yt[n>>8&255]+Yt[n>>16&255]+Yt[n>>24&255]).toLowerCase()}function tn(i,e,t){return Math.max(e,Math.min(t,i))}function jo(i,e){return(i%e+e)%e}function bh(i,e,t,n,s){return n+(i-e)*(s-n)/(t-e)}function Mh(i,e,t){return i!==e?(t-i)/(e-i):0}function Us(i,e,t){return(1-t)*i+t*e}function xh(i,e,t,n){return Us(i,e,1-Math.exp(-t*n))}function Sh(i,e=1){return e-Math.abs(jo(i,e*2)-e)}function yh(i,e,t){return i<=e?0:i>=t?1:(i=(i-e)/(t-e),i*i*(3-2*i))}function wh(i,e,t){return i<=e?0:i>=t?1:(i=(i-e)/(t-e),i*i*i*(i*(i*6-15)+10))}function Eh(i,e){return i+Math.floor(Math.random()*(e-i+1))}function Th(i,e){return i+Math.random()*(e-i)}function Ah(i){return i*(.5-Math.random())}function Ch(i){i!==void 0&&(Ga=i);let e=Ga+=1831565813;return e=Math.imul(e^e>>>15,e|1),e^=e+Math.imul(e^e>>>7,e|61),((e^e>>>14)>>>0)/4294967296}function Ph(i){return i*Is}function Lh(i){return i*Fs}function ko(i){return(i&i-1)===0&&i!==0}function Rh(i){return Math.pow(2,Math.ceil(Math.log(i)/Math.LN2))}function fu(i){return Math.pow(2,Math.floor(Math.log(i)/Math.LN2))}function Dh(i,e,t,n,s){const r=Math.cos,o=Math.sin,a=r(t/2),l=o(t/2),c=r((e+n)/2),f=o((e+n)/2),h=r((e-n)/2),u=o((e-n)/2),p=r((n-e)/2),g=o((n-e)/2);switch(s){case"XYX":i.set(a*f,l*h,l*u,a*c);break;case"YZY":i.set(l*u,a*f,l*h,a*c);break;case"ZXZ":i.set(l*h,l*u,a*f,a*c);break;case"XZX":i.set(a*f,l*g,l*p,a*c);break;case"YXY":i.set(l*p,a*f,l*g,a*c);break;case"ZYZ":i.set(l*g,l*p,a*f,a*c);break;default:console.warn("THREE.MathUtils: .setQuaternionFromProperEuler() encountered an unknown order: "+s)}}function As(i,e){switch(e.constructor){case Float32Array:return i;case Uint16Array:return i/65535;case Uint8Array:return i/255;case Int16Array:return Math.max(i/32767,-1);case Int8Array:return Math.max(i/127,-1);default:throw new Error("Invalid component type.")}}function on(i,e){switch(e.constructor){case Float32Array:return i;case Uint16Array:return Math.round(i*65535);case Uint8Array:return Math.round(i*255);case Int16Array:return Math.round(i*32767);case Int8Array:return Math.round(i*127);default:throw new Error("Invalid component type.")}}const mt={DEG2RAD:Is,RAD2DEG:Fs,generateUUID:ps,clamp:tn,euclideanModulo:jo,mapLinear:bh,inverseLerp:Mh,lerp:Us,damp:xh,pingpong:Sh,smoothstep:yh,smootherstep:wh,randInt:Eh,randFloat:Th,randFloatSpread:Ah,seededRandom:Ch,degToRad:Ph,radToDeg:Lh,isPowerOfTwo:ko,ceilPowerOfTwo:Rh,floorPowerOfTwo:fu,setQuaternionFromProperEuler:Dh,normalize:on,denormalize:As};class st{constructor(e=0,t=0){st.prototype.isVector2=!0,this.x=e,this.y=t}get width(){return this.x}set width(e){this.x=e}get height(){return this.y}set height(e){this.y=e}set(e,t){return this.x=e,this.y=t,this}setScalar(e){return this.x=e,this.y=e,this}setX(e){return this.x=e,this}setY(e){return this.y=e,this}setComponent(e,t){switch(e){case 0:this.x=t;break;case 1:this.y=t;break;default:throw new Error("index is out of range: "+e)}return this}getComponent(e){switch(e){case 0:return this.x;case 1:return this.y;default:throw new Error("index is out of range: "+e)}}clone(){return new this.constructor(this.x,this.y)}copy(e){return this.x=e.x,this.y=e.y,this}add(e){return this.x+=e.x,this.y+=e.y,this}addScalar(e){return this.x+=e,this.y+=e,this}addVectors(e,t){return this.x=e.x+t.x,this.y=e.y+t.y,this}addScaledVector(e,t){return this.x+=e.x*t,this.y+=e.y*t,this}sub(e){return this.x-=e.x,this.y-=e.y,this}subScalar(e){return this.x-=e,this.y-=e,this}subVectors(e,t){return this.x=e.x-t.x,this.y=e.y-t.y,this}multiply(e){return this.x*=e.x,this.y*=e.y,this}multiplyScalar(e){return this.x*=e,this.y*=e,this}divide(e){return this.x/=e.x,this.y/=e.y,this}divideScalar(e){return this.multiplyScalar(1/e)}applyMatrix3(e){const t=this.x,n=this.y,s=e.elements;return this.x=s[0]*t+s[3]*n+s[6],this.y=s[1]*t+s[4]*n+s[7],this}min(e){return this.x=Math.min(this.x,e.x),this.y=Math.min(this.y,e.y),this}max(e){return this.x=Math.max(this.x,e.x),this.y=Math.max(this.y,e.y),this}clamp(e,t){return this.x=Math.max(e.x,Math.min(t.x,this.x)),this.y=Math.max(e.y,Math.min(t.y,this.y)),this}clampScalar(e,t){return this.x=Math.max(e,Math.min(t,this.x)),this.y=Math.max(e,Math.min(t,this.y)),this}clampLength(e,t){const n=this.length();return this.divideScalar(n||1).multiplyScalar(Math.max(e,Math.min(t,n)))}floor(){return this.x=Math.floor(this.x),this.y=Math.floor(this.y),this}ceil(){return this.x=Math.ceil(this.x),this.y=Math.ceil(this.y),this}round(){return this.x=Math.round(this.x),this.y=Math.round(this.y),this}roundToZero(){return this.x=this.x<0?Math.ceil(this.x):Math.floor(this.x),this.y=this.y<0?Math.ceil(this.y):Math.floor(this.y),this}negate(){return this.x=-this.x,this.y=-this.y,this}dot(e){return this.x*e.x+this.y*e.y}cross(e){return this.x*e.y-this.y*e.x}lengthSq(){return this.x*this.x+this.y*this.y}length(){return Math.sqrt(this.x*this.x+this.y*this.y)}manhattanLength(){return Math.abs(this.x)+Math.abs(this.y)}normalize(){return this.divideScalar(this.length()||1)}angle(){return Math.atan2(-this.y,-this.x)+Math.PI}angleTo(e){const t=Math.sqrt(this.lengthSq()*e.lengthSq());if(t===0)return Math.PI/2;const n=this.dot(e)/t;return Math.acos(tn(n,-1,1))}distanceTo(e){return Math.sqrt(this.distanceToSquared(e))}distanceToSquared(e){const t=this.x-e.x,n=this.y-e.y;return t*t+n*n}manhattanDistanceTo(e){return Math.abs(this.x-e.x)+Math.abs(this.y-e.y)}setLength(e){return this.normalize().multiplyScalar(e)}lerp(e,t){return this.x+=(e.x-this.x)*t,this.y+=(e.y-this.y)*t,this}lerpVectors(e,t,n){return this.x=e.x+(t.x-e.x)*n,this.y=e.y+(t.y-e.y)*n,this}equals(e){return e.x===this.x&&e.y===this.y}fromArray(e,t=0){return this.x=e[t],this.y=e[t+1],this}toArray(e=[],t=0){return e[t]=this.x,e[t+1]=this.y,e}fromBufferAttribute(e,t){return this.x=e.getX(t),this.y=e.getY(t),this}rotateAround(e,t){const n=Math.cos(t),s=Math.sin(t),r=this.x-e.x,o=this.y-e.y;return this.x=r*n-o*s+e.x,this.y=r*s+o*n+e.y,this}random(){return this.x=Math.random(),this.y=Math.random(),this}*[Symbol.iterator](){yield this.x,yield this.y}}class et{constructor(){et.prototype.isMatrix3=!0,this.elements=[1,0,0,0,1,0,0,0,1]}set(e,t,n,s,r,o,a,l,c){const f=this.elements;return f[0]=e,f[1]=s,f[2]=a,f[3]=t,f[4]=r,f[5]=l,f[6]=n,f[7]=o,f[8]=c,this}identity(){return this.set(1,0,0,0,1,0,0,0,1),this}copy(e){const t=this.elements,n=e.elements;return t[0]=n[0],t[1]=n[1],t[2]=n[2],t[3]=n[3],t[4]=n[4],t[5]=n[5],t[6]=n[6],t[7]=n[7],t[8]=n[8],this}extractBasis(e,t,n){return e.setFromMatrix3Column(this,0),t.setFromMatrix3Column(this,1),n.setFromMatrix3Column(this,2),this}setFromMatrix4(e){const t=e.elements;return this.set(t[0],t[4],t[8],t[1],t[5],t[9],t[2],t[6],t[10]),this}multiply(e){return this.multiplyMatrices(this,e)}premultiply(e){return this.multiplyMatrices(e,this)}multiplyMatrices(e,t){const n=e.elements,s=t.elements,r=this.elements,o=n[0],a=n[3],l=n[6],c=n[1],f=n[4],h=n[7],u=n[2],p=n[5],g=n[8],v=s[0],m=s[3],d=s[6],M=s[1],b=s[4],x=s[7],y=s[2],T=s[5],L=s[8];return r[0]=o*v+a*M+l*y,r[3]=o*m+a*b+l*T,r[6]=o*d+a*x+l*L,r[1]=c*v+f*M+h*y,r[4]=c*m+f*b+h*T,r[7]=c*d+f*x+h*L,r[2]=u*v+p*M+g*y,r[5]=u*m+p*b+g*T,r[8]=u*d+p*x+g*L,this}multiplyScalar(e){const t=this.elements;return t[0]*=e,t[3]*=e,t[6]*=e,t[1]*=e,t[4]*=e,t[7]*=e,t[2]*=e,t[5]*=e,t[8]*=e,this}determinant(){const e=this.elements,t=e[0],n=e[1],s=e[2],r=e[3],o=e[4],a=e[5],l=e[6],c=e[7],f=e[8];return t*o*f-t*a*c-n*r*f+n*a*l+s*r*c-s*o*l}invert(){const e=this.elements,t=e[0],n=e[1],s=e[2],r=e[3],o=e[4],a=e[5],l=e[6],c=e[7],f=e[8],h=f*o-a*c,u=a*l-f*r,p=c*r-o*l,g=t*h+n*u+s*p;if(g===0)return this.set(0,0,0,0,0,0,0,0,0);const v=1/g;return e[0]=h*v,e[1]=(s*c-f*n)*v,e[2]=(a*n-s*o)*v,e[3]=u*v,e[4]=(f*t-s*l)*v,e[5]=(s*r-a*t)*v,e[6]=p*v,e[7]=(n*l-c*t)*v,e[8]=(o*t-n*r)*v,this}transpose(){let e;const t=this.elements;return e=t[1],t[1]=t[3],t[3]=e,e=t[2],t[2]=t[6],t[6]=e,e=t[5],t[5]=t[7],t[7]=e,this}getNormalMatrix(e){return this.setFromMatrix4(e).invert().transpose()}transposeIntoArray(e){const t=this.elements;return e[0]=t[0],e[1]=t[3],e[2]=t[6],e[3]=t[1],e[4]=t[4],e[5]=t[7],e[6]=t[2],e[7]=t[5],e[8]=t[8],this}setUvTransform(e,t,n,s,r,o,a){const l=Math.cos(r),c=Math.sin(r);return this.set(n*l,n*c,-n*(l*o+c*a)+o+e,-s*c,s*l,-s*(-c*o+l*a)+a+t,0,0,1),this}scale(e,t){return this.premultiply(eo.makeScale(e,t)),this}rotate(e){return this.premultiply(eo.makeRotation(-e)),this}translate(e,t){return this.premultiply(eo.makeTranslation(e,t)),this}makeTranslation(e,t){return this.set(1,0,e,0,1,t,0,0,1),this}makeRotation(e){const t=Math.cos(e),n=Math.sin(e);return this.set(t,-n,0,n,t,0,0,0,1),this}makeScale(e,t){return this.set(e,0,0,0,t,0,0,0,1),this}equals(e){const t=this.elements,n=e.elements;for(let s=0;s<9;s++)if(t[s]!==n[s])return!1;return!0}fromArray(e,t=0){for(let n=0;n<9;n++)this.elements[n]=e[n+t];return this}toArray(e=[],t=0){const n=this.elements;return e[t]=n[0],e[t+1]=n[1],e[t+2]=n[2],e[t+3]=n[3],e[t+4]=n[4],e[t+5]=n[5],e[t+6]=n[6],e[t+7]=n[7],e[t+8]=n[8],e}clone(){return new this.constructor().fromArray(this.elements)}}const eo=new et;function hu(i){for(let e=i.length-1;e>=0;--e)if(i[e]>=65535)return!0;return!1}function Bs(i){return document.createElementNS("http://www.w3.org/1999/xhtml",i)}function rs(i){return i<.04045?i*.0773993808:Math.pow(i*.9478672986+.0521327014,2.4)}function to(i){return i<.0031308?i*12.92:1.055*Math.pow(i,.41666)-.055}const Ih=new et().fromArray([.8224621,.0331941,.0170827,.177538,.9668058,.0723974,-1e-7,1e-7,.9105199]),Uh=new et().fromArray([1.2249401,-.0420569,-.0196376,-.2249404,1.0420571,-.0786361,1e-7,0,1.0982735]);function zh(i){return i.convertSRGBToLinear().applyMatrix3(Uh)}function kh(i){return i.applyMatrix3(Ih).convertLinearToSRGB()}const Nh={[Os]:i=>i,[In]:i=>i.convertSRGBToLinear(),[uu]:zh},Oh={[Os]:i=>i,[In]:i=>i.convertLinearToSRGB(),[uu]:kh},pn={enabled:!1,get legacyMode(){return console.warn("THREE.ColorManagement: .legacyMode=false renamed to .enabled=true in r150."),!this.enabled},set legacyMode(i){console.warn("THREE.ColorManagement: .legacyMode=false renamed to .enabled=true in r150."),this.enabled=!i},get workingColorSpace(){return Os},set workingColorSpace(i){console.warn("THREE.ColorManagement: .workingColorSpace is readonly.")},convert:function(i,e,t){if(this.enabled===!1||e===t||!e||!t)return i;const n=Nh[e],s=Oh[t];if(n===void 0||s===void 0)throw new Error(`Unsupported color space conversion, "${e}" to "${t}".`);return s(n(i))},fromWorkingColorSpace:function(i,e){return this.convert(i,this.workingColorSpace,e)},toWorkingColorSpace:function(i,e){return this.convert(i,e,this.workingColorSpace)}};let zi;class du{static getDataURL(e){if(/^data:/i.test(e.src)||typeof HTMLCanvasElement=="undefined")return e.src;let t;if(e instanceof HTMLCanvasElement)t=e;else{zi===void 0&&(zi=Bs("canvas")),zi.width=e.width,zi.height=e.height;const n=zi.getContext("2d");e instanceof ImageData?n.putImageData(e,0,0):n.drawImage(e,0,0,e.width,e.height),t=zi}return t.width>2048||t.height>2048?(console.warn("THREE.ImageUtils.getDataURL: Image converted to jpg for performance reasons",e),t.toDataURL("image/jpeg",.6)):t.toDataURL("image/png")}static sRGBToLinear(e){if(typeof HTMLImageElement!="undefined"&&e instanceof HTMLImageElement||typeof HTMLCanvasElement!="undefined"&&e instanceof HTMLCanvasElement||typeof ImageBitmap!="undefined"&&e instanceof ImageBitmap){const t=Bs("canvas");t.width=e.width,t.height=e.height;const n=t.getContext("2d");n.drawImage(e,0,0,e.width,e.height);const s=n.getImageData(0,0,e.width,e.height),r=s.data;for(let o=0;o<r.length;o++)r[o]=rs(r[o]/255)*255;return n.putImageData(s,0,0),t}else if(e.data){const t=e.data.slice(0);for(let n=0;n<t.length;n++)t instanceof Uint8Array||t instanceof Uint8ClampedArray?t[n]=Math.floor(rs(t[n]/255)*255):t[n]=rs(t[n]);return{data:t,width:e.width,height:e.height}}else return console.warn("THREE.ImageUtils.sRGBToLinear(): Unsupported image type. No color space conversion applied."),e}}class pu{constructor(e=null){this.isSource=!0,this.uuid=ps(),this.data=e,this.version=0}set needsUpdate(e){e===!0&&this.version++}toJSON(e){const t=e===void 0||typeof e=="string";if(!t&&e.images[this.uuid]!==void 0)return e.images[this.uuid];const n={uuid:this.uuid,url:""},s=this.data;if(s!==null){let r;if(Array.isArray(s)){r=[];for(let o=0,a=s.length;o<a;o++)s[o].isDataTexture?r.push(no(s[o].image)):r.push(no(s[o]))}else r=no(s);n.url=r}return t||(e.images[this.uuid]=n),n}}function no(i){return typeof HTMLImageElement!="undefined"&&i instanceof HTMLImageElement||typeof HTMLCanvasElement!="undefined"&&i instanceof HTMLCanvasElement||typeof ImageBitmap!="undefined"&&i instanceof ImageBitmap?du.getDataURL(i):i.data?{data:Array.from(i.data),width:i.width,height:i.height,type:i.data.constructor.name}:(console.warn("THREE.Texture: Unable to serialize Texture."),{})}let Fh=0;class fn extends ds{constructor(e=fn.DEFAULT_IMAGE,t=fn.DEFAULT_MAPPING,n=An,s=An,r=Mn,o=ks,a=Cn,l=Li,c=fn.DEFAULT_ANISOTROPY,f=ui){super(),this.isTexture=!0,Object.defineProperty(this,"id",{value:Fh++}),this.uuid=ps(),this.name="",this.source=new pu(e),this.mipmaps=[],this.mapping=t,this.channel=0,this.wrapS=n,this.wrapT=s,this.magFilter=r,this.minFilter=o,this.anisotropy=c,this.format=a,this.internalFormat=null,this.type=l,this.offset=new st(0,0),this.repeat=new st(1,1),this.center=new st(0,0),this.rotation=0,this.matrixAutoUpdate=!0,this.matrix=new et,this.generateMipmaps=!0,this.premultiplyAlpha=!1,this.flipY=!0,this.unpackAlignment=4,this.encoding=f,this.userData={},this.version=0,this.onUpdate=null,this.isRenderTargetTexture=!1,this.needsPMREMUpdate=!1}get image(){return this.source.data}set image(e=null){this.source.data=e}updateMatrix(){this.matrix.setUvTransform(this.offset.x,this.offset.y,this.repeat.x,this.repeat.y,this.rotation,this.center.x,this.center.y)}clone(){return new this.constructor().copy(this)}copy(e){return this.name=e.name,this.source=e.source,this.mipmaps=e.mipmaps.slice(0),this.mapping=e.mapping,this.channel=e.channel,this.wrapS=e.wrapS,this.wrapT=e.wrapT,this.magFilter=e.magFilter,this.minFilter=e.minFilter,this.anisotropy=e.anisotropy,this.format=e.format,this.internalFormat=e.internalFormat,this.type=e.type,this.offset.copy(e.offset),this.repeat.copy(e.repeat),this.center.copy(e.center),this.rotation=e.rotation,this.matrixAutoUpdate=e.matrixAutoUpdate,this.matrix.copy(e.matrix),this.generateMipmaps=e.generateMipmaps,this.premultiplyAlpha=e.premultiplyAlpha,this.flipY=e.flipY,this.unpackAlignment=e.unpackAlignment,this.encoding=e.encoding,this.userData=JSON.parse(JSON.stringify(e.userData)),this.needsUpdate=!0,this}toJSON(e){const t=e===void 0||typeof e=="string";if(!t&&e.textures[this.uuid]!==void 0)return e.textures[this.uuid];const n={metadata:{version:4.5,type:"Texture",generator:"Texture.toJSON"},uuid:this.uuid,name:this.name,image:this.source.toJSON(e).uuid,mapping:this.mapping,channel:this.channel,repeat:[this.repeat.x,this.repeat.y],offset:[this.offset.x,this.offset.y],center:[this.center.x,this.center.y],rotation:this.rotation,wrap:[this.wrapS,this.wrapT],format:this.format,internalFormat:this.internalFormat,type:this.type,encoding:this.encoding,minFilter:this.minFilter,magFilter:this.magFilter,anisotropy:this.anisotropy,flipY:this.flipY,generateMipmaps:this.generateMipmaps,premultiplyAlpha:this.premultiplyAlpha,unpackAlignment:this.unpackAlignment};return Object.keys(this.userData).length>0&&(n.userData=this.userData),t||(e.textures[this.uuid]=n),n}dispose(){this.dispatchEvent({type:"dispose"})}transformUv(e){if(this.mapping!==au)return e;if(e.applyMatrix3(this.matrix),e.x<0||e.x>1)switch(this.wrapS){case Io:e.x=e.x-Math.floor(e.x);break;case An:e.x=e.x<0?0:1;break;case Uo:Math.abs(Math.floor(e.x)%2)===1?e.x=Math.ceil(e.x)-e.x:e.x=e.x-Math.floor(e.x);break}if(e.y<0||e.y>1)switch(this.wrapT){case Io:e.y=e.y-Math.floor(e.y);break;case An:e.y=e.y<0?0:1;break;case Uo:Math.abs(Math.floor(e.y)%2)===1?e.y=Math.ceil(e.y)-e.y:e.y=e.y-Math.floor(e.y);break}return this.flipY&&(e.y=1-e.y),e}set needsUpdate(e){e===!0&&(this.version++,this.source.needsUpdate=!0)}}fn.DEFAULT_IMAGE=null;fn.DEFAULT_MAPPING=au;fn.DEFAULT_ANISOTROPY=1;class Xt{constructor(e=0,t=0,n=0,s=1){Xt.prototype.isVector4=!0,this.x=e,this.y=t,this.z=n,this.w=s}get width(){return this.z}set width(e){this.z=e}get height(){return this.w}set height(e){this.w=e}set(e,t,n,s){return this.x=e,this.y=t,this.z=n,this.w=s,this}setScalar(e){return this.x=e,this.y=e,this.z=e,this.w=e,this}setX(e){return this.x=e,this}setY(e){return this.y=e,this}setZ(e){return this.z=e,this}setW(e){return this.w=e,this}setComponent(e,t){switch(e){case 0:this.x=t;break;case 1:this.y=t;break;case 2:this.z=t;break;case 3:this.w=t;break;default:throw new Error("index is out of range: "+e)}return this}getComponent(e){switch(e){case 0:return this.x;case 1:return this.y;case 2:return this.z;case 3:return this.w;default:throw new Error("index is out of range: "+e)}}clone(){return new this.constructor(this.x,this.y,this.z,this.w)}copy(e){return this.x=e.x,this.y=e.y,this.z=e.z,this.w=e.w!==void 0?e.w:1,this}add(e){return this.x+=e.x,this.y+=e.y,this.z+=e.z,this.w+=e.w,this}addScalar(e){return this.x+=e,this.y+=e,this.z+=e,this.w+=e,this}addVectors(e,t){return this.x=e.x+t.x,this.y=e.y+t.y,this.z=e.z+t.z,this.w=e.w+t.w,this}addScaledVector(e,t){return this.x+=e.x*t,this.y+=e.y*t,this.z+=e.z*t,this.w+=e.w*t,this}sub(e){return this.x-=e.x,this.y-=e.y,this.z-=e.z,this.w-=e.w,this}subScalar(e){return this.x-=e,this.y-=e,this.z-=e,this.w-=e,this}subVectors(e,t){return this.x=e.x-t.x,this.y=e.y-t.y,this.z=e.z-t.z,this.w=e.w-t.w,this}multiply(e){return this.x*=e.x,this.y*=e.y,this.z*=e.z,this.w*=e.w,this}multiplyScalar(e){return this.x*=e,this.y*=e,this.z*=e,this.w*=e,this}applyMatrix4(e){const t=this.x,n=this.y,s=this.z,r=this.w,o=e.elements;return this.x=o[0]*t+o[4]*n+o[8]*s+o[12]*r,this.y=o[1]*t+o[5]*n+o[9]*s+o[13]*r,this.z=o[2]*t+o[6]*n+o[10]*s+o[14]*r,this.w=o[3]*t+o[7]*n+o[11]*s+o[15]*r,this}divideScalar(e){return this.multiplyScalar(1/e)}setAxisAngleFromQuaternion(e){this.w=2*Math.acos(e.w);const t=Math.sqrt(1-e.w*e.w);return t<1e-4?(this.x=1,this.y=0,this.z=0):(this.x=e.x/t,this.y=e.y/t,this.z=e.z/t),this}setAxisAngleFromRotationMatrix(e){let t,n,s,r;const l=e.elements,c=l[0],f=l[4],h=l[8],u=l[1],p=l[5],g=l[9],v=l[2],m=l[6],d=l[10];if(Math.abs(f-u)<.01&&Math.abs(h-v)<.01&&Math.abs(g-m)<.01){if(Math.abs(f+u)<.1&&Math.abs(h+v)<.1&&Math.abs(g+m)<.1&&Math.abs(c+p+d-3)<.1)return this.set(1,0,0,0),this;t=Math.PI;const b=(c+1)/2,x=(p+1)/2,y=(d+1)/2,T=(f+u)/4,L=(h+v)/4,w=(g+m)/4;return b>x&&b>y?b<.01?(n=0,s=.707106781,r=.707106781):(n=Math.sqrt(b),s=T/n,r=L/n):x>y?x<.01?(n=.707106781,s=0,r=.707106781):(s=Math.sqrt(x),n=T/s,r=w/s):y<.01?(n=.707106781,s=.707106781,r=0):(r=Math.sqrt(y),n=L/r,s=w/r),this.set(n,s,r,t),this}let M=Math.sqrt((m-g)*(m-g)+(h-v)*(h-v)+(u-f)*(u-f));return Math.abs(M)<.001&&(M=1),this.x=(m-g)/M,this.y=(h-v)/M,this.z=(u-f)/M,this.w=Math.acos((c+p+d-1)/2),this}min(e){return this.x=Math.min(this.x,e.x),this.y=Math.min(this.y,e.y),this.z=Math.min(this.z,e.z),this.w=Math.min(this.w,e.w),this}max(e){return this.x=Math.max(this.x,e.x),this.y=Math.max(this.y,e.y),this.z=Math.max(this.z,e.z),this.w=Math.max(this.w,e.w),this}clamp(e,t){return this.x=Math.max(e.x,Math.min(t.x,this.x)),this.y=Math.max(e.y,Math.min(t.y,this.y)),this.z=Math.max(e.z,Math.min(t.z,this.z)),this.w=Math.max(e.w,Math.min(t.w,this.w)),this}clampScalar(e,t){return this.x=Math.max(e,Math.min(t,this.x)),this.y=Math.max(e,Math.min(t,this.y)),this.z=Math.max(e,Math.min(t,this.z)),this.w=Math.max(e,Math.min(t,this.w)),this}clampLength(e,t){const n=this.length();return this.divideScalar(n||1).multiplyScalar(Math.max(e,Math.min(t,n)))}floor(){return this.x=Math.floor(this.x),this.y=Math.floor(this.y),this.z=Math.floor(this.z),this.w=Math.floor(this.w),this}ceil(){return this.x=Math.ceil(this.x),this.y=Math.ceil(this.y),this.z=Math.ceil(this.z),this.w=Math.ceil(this.w),this}round(){return this.x=Math.round(this.x),this.y=Math.round(this.y),this.z=Math.round(this.z),this.w=Math.round(this.w),this}roundToZero(){return this.x=this.x<0?Math.ceil(this.x):Math.floor(this.x),this.y=this.y<0?Math.ceil(this.y):Math.floor(this.y),this.z=this.z<0?Math.ceil(this.z):Math.floor(this.z),this.w=this.w<0?Math.ceil(this.w):Math.floor(this.w),this}negate(){return this.x=-this.x,this.y=-this.y,this.z=-this.z,this.w=-this.w,this}dot(e){return this.x*e.x+this.y*e.y+this.z*e.z+this.w*e.w}lengthSq(){return this.x*this.x+this.y*this.y+this.z*this.z+this.w*this.w}length(){return Math.sqrt(this.x*this.x+this.y*this.y+this.z*this.z+this.w*this.w)}manhattanLength(){return Math.abs(this.x)+Math.abs(this.y)+Math.abs(this.z)+Math.abs(this.w)}normalize(){return this.divideScalar(this.length()||1)}setLength(e){return this.normalize().multiplyScalar(e)}lerp(e,t){return this.x+=(e.x-this.x)*t,this.y+=(e.y-this.y)*t,this.z+=(e.z-this.z)*t,this.w+=(e.w-this.w)*t,this}lerpVectors(e,t,n){return this.x=e.x+(t.x-e.x)*n,this.y=e.y+(t.y-e.y)*n,this.z=e.z+(t.z-e.z)*n,this.w=e.w+(t.w-e.w)*n,this}equals(e){return e.x===this.x&&e.y===this.y&&e.z===this.z&&e.w===this.w}fromArray(e,t=0){return this.x=e[t],this.y=e[t+1],this.z=e[t+2],this.w=e[t+3],this}toArray(e=[],t=0){return e[t]=this.x,e[t+1]=this.y,e[t+2]=this.z,e[t+3]=this.w,e}fromBufferAttribute(e,t){return this.x=e.getX(t),this.y=e.getY(t),this.z=e.getZ(t),this.w=e.getW(t),this}random(){return this.x=Math.random(),this.y=Math.random(),this.z=Math.random(),this.w=Math.random(),this}*[Symbol.iterator](){yield this.x,yield this.y,yield this.z,yield this.w}}class fi extends ds{constructor(e=1,t=1,n={}){super(),this.isWebGLRenderTarget=!0,this.width=e,this.height=t,this.depth=1,this.scissor=new Xt(0,0,e,t),this.scissorTest=!1,this.viewport=new Xt(0,0,e,t);const s={width:e,height:t,depth:1};this.texture=new fn(s,n.mapping,n.wrapS,n.wrapT,n.magFilter,n.minFilter,n.format,n.type,n.anisotropy,n.encoding),this.texture.isRenderTargetTexture=!0,this.texture.flipY=!1,this.texture.generateMipmaps=n.generateMipmaps!==void 0?n.generateMipmaps:!1,this.texture.internalFormat=n.internalFormat!==void 0?n.internalFormat:null,this.texture.minFilter=n.minFilter!==void 0?n.minFilter:Mn,this.depthBuffer=n.depthBuffer!==void 0?n.depthBuffer:!0,this.stencilBuffer=n.stencilBuffer!==void 0?n.stencilBuffer:!1,this.depthTexture=n.depthTexture!==void 0?n.depthTexture:null,this.samples=n.samples!==void 0?n.samples:0}setSize(e,t,n=1){(this.width!==e||this.height!==t||this.depth!==n)&&(this.width=e,this.height=t,this.depth=n,this.texture.image.width=e,this.texture.image.height=t,this.texture.image.depth=n,this.dispose()),this.viewport.set(0,0,e,t),this.scissor.set(0,0,e,t)}clone(){return new this.constructor().copy(this)}copy(e){this.width=e.width,this.height=e.height,this.depth=e.depth,this.viewport.copy(e.viewport),this.texture=e.texture.clone(),this.texture.isRenderTargetTexture=!0;const t=Object.assign({},e.texture.image);return this.texture.source=new pu(t),this.depthBuffer=e.depthBuffer,this.stencilBuffer=e.stencilBuffer,e.depthTexture!==null&&(this.depthTexture=e.depthTexture.clone()),this.samples=e.samples,this}dispose(){this.dispatchEvent({type:"dispose"})}}class mu extends fn{constructor(e=null,t=1,n=1,s=1){super(null),this.isDataArrayTexture=!0,this.image={data:e,width:t,height:n,depth:s},this.magFilter=$t,this.minFilter=$t,this.wrapR=An,this.generateMipmaps=!1,this.flipY=!1,this.unpackAlignment=1}}class Bh extends fn{constructor(e=null,t=1,n=1,s=1){super(null),this.isData3DTexture=!0,this.image={data:e,width:t,height:n,depth:s},this.magFilter=$t,this.minFilter=$t,this.wrapR=An,this.generateMipmaps=!1,this.flipY=!1,this.unpackAlignment=1}}class en{constructor(e=0,t=0,n=0,s=1){this.isQuaternion=!0,this._x=e,this._y=t,this._z=n,this._w=s}static slerpFlat(e,t,n,s,r,o,a){let l=n[s+0],c=n[s+1],f=n[s+2],h=n[s+3];const u=r[o+0],p=r[o+1],g=r[o+2],v=r[o+3];if(a===0){e[t+0]=l,e[t+1]=c,e[t+2]=f,e[t+3]=h;return}if(a===1){e[t+0]=u,e[t+1]=p,e[t+2]=g,e[t+3]=v;return}if(h!==v||l!==u||c!==p||f!==g){let m=1-a;const d=l*u+c*p+f*g+h*v,M=d>=0?1:-1,b=1-d*d;if(b>Number.EPSILON){const y=Math.sqrt(b),T=Math.atan2(y,d*M);m=Math.sin(m*T)/y,a=Math.sin(a*T)/y}const x=a*M;if(l=l*m+u*x,c=c*m+p*x,f=f*m+g*x,h=h*m+v*x,m===1-a){const y=1/Math.sqrt(l*l+c*c+f*f+h*h);l*=y,c*=y,f*=y,h*=y}}e[t]=l,e[t+1]=c,e[t+2]=f,e[t+3]=h}static multiplyQuaternionsFlat(e,t,n,s,r,o){const a=n[s],l=n[s+1],c=n[s+2],f=n[s+3],h=r[o],u=r[o+1],p=r[o+2],g=r[o+3];return e[t]=a*g+f*h+l*p-c*u,e[t+1]=l*g+f*u+c*h-a*p,e[t+2]=c*g+f*p+a*u-l*h,e[t+3]=f*g-a*h-l*u-c*p,e}get x(){return this._x}set x(e){this._x=e,this._onChangeCallback()}get y(){return this._y}set y(e){this._y=e,this._onChangeCallback()}get z(){return this._z}set z(e){this._z=e,this._onChangeCallback()}get w(){return this._w}set w(e){this._w=e,this._onChangeCallback()}set(e,t,n,s){return this._x=e,this._y=t,this._z=n,this._w=s,this._onChangeCallback(),this}clone(){return new this.constructor(this._x,this._y,this._z,this._w)}copy(e){return this._x=e.x,this._y=e.y,this._z=e.z,this._w=e.w,this._onChangeCallback(),this}setFromEuler(e,t){const n=e._x,s=e._y,r=e._z,o=e._order,a=Math.cos,l=Math.sin,c=a(n/2),f=a(s/2),h=a(r/2),u=l(n/2),p=l(s/2),g=l(r/2);switch(o){case"XYZ":this._x=u*f*h+c*p*g,this._y=c*p*h-u*f*g,this._z=c*f*g+u*p*h,this._w=c*f*h-u*p*g;break;case"YXZ":this._x=u*f*h+c*p*g,this._y=c*p*h-u*f*g,this._z=c*f*g-u*p*h,this._w=c*f*h+u*p*g;break;case"ZXY":this._x=u*f*h-c*p*g,this._y=c*p*h+u*f*g,this._z=c*f*g+u*p*h,this._w=c*f*h-u*p*g;break;case"ZYX":this._x=u*f*h-c*p*g,this._y=c*p*h+u*f*g,this._z=c*f*g-u*p*h,this._w=c*f*h+u*p*g;break;case"YZX":this._x=u*f*h+c*p*g,this._y=c*p*h+u*f*g,this._z=c*f*g-u*p*h,this._w=c*f*h-u*p*g;break;case"XZY":this._x=u*f*h-c*p*g,this._y=c*p*h-u*f*g,this._z=c*f*g+u*p*h,this._w=c*f*h+u*p*g;break;default:console.warn("THREE.Quaternion: .setFromEuler() encountered an unknown order: "+o)}return t!==!1&&this._onChangeCallback(),this}setFromAxisAngle(e,t){const n=t/2,s=Math.sin(n);return this._x=e.x*s,this._y=e.y*s,this._z=e.z*s,this._w=Math.cos(n),this._onChangeCallback(),this}setFromRotationMatrix(e){const t=e.elements,n=t[0],s=t[4],r=t[8],o=t[1],a=t[5],l=t[9],c=t[2],f=t[6],h=t[10],u=n+a+h;if(u>0){const p=.5/Math.sqrt(u+1);this._w=.25/p,this._x=(f-l)*p,this._y=(r-c)*p,this._z=(o-s)*p}else if(n>a&&n>h){const p=2*Math.sqrt(1+n-a-h);this._w=(f-l)/p,this._x=.25*p,this._y=(s+o)/p,this._z=(r+c)/p}else if(a>h){const p=2*Math.sqrt(1+a-n-h);this._w=(r-c)/p,this._x=(s+o)/p,this._y=.25*p,this._z=(l+f)/p}else{const p=2*Math.sqrt(1+h-n-a);this._w=(o-s)/p,this._x=(r+c)/p,this._y=(l+f)/p,this._z=.25*p}return this._onChangeCallback(),this}setFromUnitVectors(e,t){let n=e.dot(t)+1;return n<Number.EPSILON?(n=0,Math.abs(e.x)>Math.abs(e.z)?(this._x=-e.y,this._y=e.x,this._z=0,this._w=n):(this._x=0,this._y=-e.z,this._z=e.y,this._w=n)):(this._x=e.y*t.z-e.z*t.y,this._y=e.z*t.x-e.x*t.z,this._z=e.x*t.y-e.y*t.x,this._w=n),this.normalize()}angleTo(e){return 2*Math.acos(Math.abs(tn(this.dot(e),-1,1)))}rotateTowards(e,t){const n=this.angleTo(e);if(n===0)return this;const s=Math.min(1,t/n);return this.slerp(e,s),this}identity(){return this.set(0,0,0,1)}invert(){return this.conjugate()}conjugate(){return this._x*=-1,this._y*=-1,this._z*=-1,this._onChangeCallback(),this}dot(e){return this._x*e._x+this._y*e._y+this._z*e._z+this._w*e._w}lengthSq(){return this._x*this._x+this._y*this._y+this._z*this._z+this._w*this._w}length(){return Math.sqrt(this._x*this._x+this._y*this._y+this._z*this._z+this._w*this._w)}normalize(){let e=this.length();return e===0?(this._x=0,this._y=0,this._z=0,this._w=1):(e=1/e,this._x=this._x*e,this._y=this._y*e,this._z=this._z*e,this._w=this._w*e),this._onChangeCallback(),this}multiply(e){return this.multiplyQuaternions(this,e)}premultiply(e){return this.multiplyQuaternions(e,this)}multiplyQuaternions(e,t){const n=e._x,s=e._y,r=e._z,o=e._w,a=t._x,l=t._y,c=t._z,f=t._w;return this._x=n*f+o*a+s*c-r*l,this._y=s*f+o*l+r*a-n*c,this._z=r*f+o*c+n*l-s*a,this._w=o*f-n*a-s*l-r*c,this._onChangeCallback(),this}slerp(e,t){if(t===0)return this;if(t===1)return this.copy(e);const n=this._x,s=this._y,r=this._z,o=this._w;let a=o*e._w+n*e._x+s*e._y+r*e._z;if(a<0?(this._w=-e._w,this._x=-e._x,this._y=-e._y,this._z=-e._z,a=-a):this.copy(e),a>=1)return this._w=o,this._x=n,this._y=s,this._z=r,this;const l=1-a*a;if(l<=Number.EPSILON){const p=1-t;return this._w=p*o+t*this._w,this._x=p*n+t*this._x,this._y=p*s+t*this._y,this._z=p*r+t*this._z,this.normalize(),this._onChangeCallback(),this}const c=Math.sqrt(l),f=Math.atan2(c,a),h=Math.sin((1-t)*f)/c,u=Math.sin(t*f)/c;return this._w=o*h+this._w*u,this._x=n*h+this._x*u,this._y=s*h+this._y*u,this._z=r*h+this._z*u,this._onChangeCallback(),this}slerpQuaternions(e,t,n){return this.copy(e).slerp(t,n)}random(){const e=Math.random(),t=Math.sqrt(1-e),n=Math.sqrt(e),s=2*Math.PI*Math.random(),r=2*Math.PI*Math.random();return this.set(t*Math.cos(s),n*Math.sin(r),n*Math.cos(r),t*Math.sin(s))}equals(e){return e._x===this._x&&e._y===this._y&&e._z===this._z&&e._w===this._w}fromArray(e,t=0){return this._x=e[t],this._y=e[t+1],this._z=e[t+2],this._w=e[t+3],this._onChangeCallback(),this}toArray(e=[],t=0){return e[t]=this._x,e[t+1]=this._y,e[t+2]=this._z,e[t+3]=this._w,e}fromBufferAttribute(e,t){return this._x=e.getX(t),this._y=e.getY(t),this._z=e.getZ(t),this._w=e.getW(t),this}toJSON(){return this.toArray()}_onChange(e){return this._onChangeCallback=e,this}_onChangeCallback(){}*[Symbol.iterator](){yield this._x,yield this._y,yield this._z,yield this._w}}class G{constructor(e=0,t=0,n=0){G.prototype.isVector3=!0,this.x=e,this.y=t,this.z=n}set(e,t,n){return n===void 0&&(n=this.z),this.x=e,this.y=t,this.z=n,this}setScalar(e){return this.x=e,this.y=e,this.z=e,this}setX(e){return this.x=e,this}setY(e){return this.y=e,this}setZ(e){return this.z=e,this}setComponent(e,t){switch(e){case 0:this.x=t;break;case 1:this.y=t;break;case 2:this.z=t;break;default:throw new Error("index is out of range: "+e)}return this}getComponent(e){switch(e){case 0:return this.x;case 1:return this.y;case 2:return this.z;default:throw new Error("index is out of range: "+e)}}clone(){return new this.constructor(this.x,this.y,this.z)}copy(e){return this.x=e.x,this.y=e.y,this.z=e.z,this}add(e){return this.x+=e.x,this.y+=e.y,this.z+=e.z,this}addScalar(e){return this.x+=e,this.y+=e,this.z+=e,this}addVectors(e,t){return this.x=e.x+t.x,this.y=e.y+t.y,this.z=e.z+t.z,this}addScaledVector(e,t){return this.x+=e.x*t,this.y+=e.y*t,this.z+=e.z*t,this}sub(e){return this.x-=e.x,this.y-=e.y,this.z-=e.z,this}subScalar(e){return this.x-=e,this.y-=e,this.z-=e,this}subVectors(e,t){return this.x=e.x-t.x,this.y=e.y-t.y,this.z=e.z-t.z,this}multiply(e){return this.x*=e.x,this.y*=e.y,this.z*=e.z,this}multiplyScalar(e){return this.x*=e,this.y*=e,this.z*=e,this}multiplyVectors(e,t){return this.x=e.x*t.x,this.y=e.y*t.y,this.z=e.z*t.z,this}applyEuler(e){return this.applyQuaternion(Ha.setFromEuler(e))}applyAxisAngle(e,t){return this.applyQuaternion(Ha.setFromAxisAngle(e,t))}applyMatrix3(e){const t=this.x,n=this.y,s=this.z,r=e.elements;return this.x=r[0]*t+r[3]*n+r[6]*s,this.y=r[1]*t+r[4]*n+r[7]*s,this.z=r[2]*t+r[5]*n+r[8]*s,this}applyNormalMatrix(e){return this.applyMatrix3(e).normalize()}applyMatrix4(e){const t=this.x,n=this.y,s=this.z,r=e.elements,o=1/(r[3]*t+r[7]*n+r[11]*s+r[15]);return this.x=(r[0]*t+r[4]*n+r[8]*s+r[12])*o,this.y=(r[1]*t+r[5]*n+r[9]*s+r[13])*o,this.z=(r[2]*t+r[6]*n+r[10]*s+r[14])*o,this}applyQuaternion(e){const t=this.x,n=this.y,s=this.z,r=e.x,o=e.y,a=e.z,l=e.w,c=l*t+o*s-a*n,f=l*n+a*t-r*s,h=l*s+r*n-o*t,u=-r*t-o*n-a*s;return this.x=c*l+u*-r+f*-a-h*-o,this.y=f*l+u*-o+h*-r-c*-a,this.z=h*l+u*-a+c*-o-f*-r,this}project(e){return this.applyMatrix4(e.matrixWorldInverse).applyMatrix4(e.projectionMatrix)}unproject(e){return this.applyMatrix4(e.projectionMatrixInverse).applyMatrix4(e.matrixWorld)}transformDirection(e){const t=this.x,n=this.y,s=this.z,r=e.elements;return this.x=r[0]*t+r[4]*n+r[8]*s,this.y=r[1]*t+r[5]*n+r[9]*s,this.z=r[2]*t+r[6]*n+r[10]*s,this.normalize()}divide(e){return this.x/=e.x,this.y/=e.y,this.z/=e.z,this}divideScalar(e){return this.multiplyScalar(1/e)}min(e){return this.x=Math.min(this.x,e.x),this.y=Math.min(this.y,e.y),this.z=Math.min(this.z,e.z),this}max(e){return this.x=Math.max(this.x,e.x),this.y=Math.max(this.y,e.y),this.z=Math.max(this.z,e.z),this}clamp(e,t){return this.x=Math.max(e.x,Math.min(t.x,this.x)),this.y=Math.max(e.y,Math.min(t.y,this.y)),this.z=Math.max(e.z,Math.min(t.z,this.z)),this}clampScalar(e,t){return this.x=Math.max(e,Math.min(t,this.x)),this.y=Math.max(e,Math.min(t,this.y)),this.z=Math.max(e,Math.min(t,this.z)),this}clampLength(e,t){const n=this.length();return this.divideScalar(n||1).multiplyScalar(Math.max(e,Math.min(t,n)))}floor(){return this.x=Math.floor(this.x),this.y=Math.floor(this.y),this.z=Math.floor(this.z),this}ceil(){return this.x=Math.ceil(this.x),this.y=Math.ceil(this.y),this.z=Math.ceil(this.z),this}round(){return this.x=Math.round(this.x),this.y=Math.round(this.y),this.z=Math.round(this.z),this}roundToZero(){return this.x=this.x<0?Math.ceil(this.x):Math.floor(this.x),this.y=this.y<0?Math.ceil(this.y):Math.floor(this.y),this.z=this.z<0?Math.ceil(this.z):Math.floor(this.z),this}negate(){return this.x=-this.x,this.y=-this.y,this.z=-this.z,this}dot(e){return this.x*e.x+this.y*e.y+this.z*e.z}lengthSq(){return this.x*this.x+this.y*this.y+this.z*this.z}length(){return Math.sqrt(this.x*this.x+this.y*this.y+this.z*this.z)}manhattanLength(){return Math.abs(this.x)+Math.abs(this.y)+Math.abs(this.z)}normalize(){return this.divideScalar(this.length()||1)}setLength(e){return this.normalize().multiplyScalar(e)}lerp(e,t){return this.x+=(e.x-this.x)*t,this.y+=(e.y-this.y)*t,this.z+=(e.z-this.z)*t,this}lerpVectors(e,t,n){return this.x=e.x+(t.x-e.x)*n,this.y=e.y+(t.y-e.y)*n,this.z=e.z+(t.z-e.z)*n,this}cross(e){return this.crossVectors(this,e)}crossVectors(e,t){const n=e.x,s=e.y,r=e.z,o=t.x,a=t.y,l=t.z;return this.x=s*l-r*a,this.y=r*o-n*l,this.z=n*a-s*o,this}projectOnVector(e){const t=e.lengthSq();if(t===0)return this.set(0,0,0);const n=e.dot(this)/t;return this.copy(e).multiplyScalar(n)}projectOnPlane(e){return io.copy(this).projectOnVector(e),this.sub(io)}reflect(e){return this.sub(io.copy(e).multiplyScalar(2*this.dot(e)))}angleTo(e){const t=Math.sqrt(this.lengthSq()*e.lengthSq());if(t===0)return Math.PI/2;const n=this.dot(e)/t;return Math.acos(tn(n,-1,1))}distanceTo(e){return Math.sqrt(this.distanceToSquared(e))}distanceToSquared(e){const t=this.x-e.x,n=this.y-e.y,s=this.z-e.z;return t*t+n*n+s*s}manhattanDistanceTo(e){return Math.abs(this.x-e.x)+Math.abs(this.y-e.y)+Math.abs(this.z-e.z)}setFromSpherical(e){return this.setFromSphericalCoords(e.radius,e.phi,e.theta)}setFromSphericalCoords(e,t,n){const s=Math.sin(t)*e;return this.x=s*Math.sin(n),this.y=Math.cos(t)*e,this.z=s*Math.cos(n),this}setFromCylindrical(e){return this.setFromCylindricalCoords(e.radius,e.theta,e.y)}setFromCylindricalCoords(e,t,n){return this.x=e*Math.sin(t),this.y=n,this.z=e*Math.cos(t),this}setFromMatrixPosition(e){const t=e.elements;return this.x=t[12],this.y=t[13],this.z=t[14],this}setFromMatrixScale(e){const t=this.setFromMatrixColumn(e,0).length(),n=this.setFromMatrixColumn(e,1).length(),s=this.setFromMatrixColumn(e,2).length();return this.x=t,this.y=n,this.z=s,this}setFromMatrixColumn(e,t){return this.fromArray(e.elements,t*4)}setFromMatrix3Column(e,t){return this.fromArray(e.elements,t*3)}setFromEuler(e){return this.x=e._x,this.y=e._y,this.z=e._z,this}setFromColor(e){return this.x=e.r,this.y=e.g,this.z=e.b,this}equals(e){return e.x===this.x&&e.y===this.y&&e.z===this.z}fromArray(e,t=0){return this.x=e[t],this.y=e[t+1],this.z=e[t+2],this}toArray(e=[],t=0){return e[t]=this.x,e[t+1]=this.y,e[t+2]=this.z,e}fromBufferAttribute(e,t){return this.x=e.getX(t),this.y=e.getY(t),this.z=e.getZ(t),this}random(){return this.x=Math.random(),this.y=Math.random(),this.z=Math.random(),this}randomDirection(){const e=(Math.random()-.5)*2,t=Math.random()*Math.PI*2,n=Math.sqrt(1-e**2);return this.x=n*Math.cos(t),this.y=n*Math.sin(t),this.z=e,this}*[Symbol.iterator](){yield this.x,yield this.y,yield this.z}}const io=new G,Ha=new en;class Ws{constructor(e=new G(1/0,1/0,1/0),t=new G(-1/0,-1/0,-1/0)){this.isBox3=!0,this.min=e,this.max=t}set(e,t){return this.min.copy(e),this.max.copy(t),this}setFromArray(e){this.makeEmpty();for(let t=0,n=e.length;t<n;t+=3)this.expandByPoint(Xn.fromArray(e,t));return this}setFromBufferAttribute(e){this.makeEmpty();for(let t=0,n=e.count;t<n;t++)this.expandByPoint(Xn.fromBufferAttribute(e,t));return this}setFromPoints(e){this.makeEmpty();for(let t=0,n=e.length;t<n;t++)this.expandByPoint(e[t]);return this}setFromCenterAndSize(e,t){const n=Xn.copy(t).multiplyScalar(.5);return this.min.copy(e).sub(n),this.max.copy(e).add(n),this}setFromObject(e,t=!1){return this.makeEmpty(),this.expandByObject(e,t)}clone(){return new this.constructor().copy(this)}copy(e){return this.min.copy(e.min),this.max.copy(e.max),this}makeEmpty(){return this.min.x=this.min.y=this.min.z=1/0,this.max.x=this.max.y=this.max.z=-1/0,this}isEmpty(){return this.max.x<this.min.x||this.max.y<this.min.y||this.max.z<this.min.z}getCenter(e){return this.isEmpty()?e.set(0,0,0):e.addVectors(this.min,this.max).multiplyScalar(.5)}getSize(e){return this.isEmpty()?e.set(0,0,0):e.subVectors(this.max,this.min)}expandByPoint(e){return this.min.min(e),this.max.max(e),this}expandByVector(e){return this.min.sub(e),this.max.add(e),this}expandByScalar(e){return this.min.addScalar(-e),this.max.addScalar(e),this}expandByObject(e,t=!1){if(e.updateWorldMatrix(!1,!1),e.boundingBox!==void 0)e.boundingBox===null&&e.computeBoundingBox(),ki.copy(e.boundingBox),ki.applyMatrix4(e.matrixWorld),this.union(ki);else{const s=e.geometry;if(s!==void 0)if(t&&s.attributes!==void 0&&s.attributes.position!==void 0){const r=s.attributes.position;for(let o=0,a=r.count;o<a;o++)Xn.fromBufferAttribute(r,o).applyMatrix4(e.matrixWorld),this.expandByPoint(Xn)}else s.boundingBox===null&&s.computeBoundingBox(),ki.copy(s.boundingBox),ki.applyMatrix4(e.matrixWorld),this.union(ki)}const n=e.children;for(let s=0,r=n.length;s<r;s++)this.expandByObject(n[s],t);return this}containsPoint(e){return!(e.x<this.min.x||e.x>this.max.x||e.y<this.min.y||e.y>this.max.y||e.z<this.min.z||e.z>this.max.z)}containsBox(e){return this.min.x<=e.min.x&&e.max.x<=this.max.x&&this.min.y<=e.min.y&&e.max.y<=this.max.y&&this.min.z<=e.min.z&&e.max.z<=this.max.z}getParameter(e,t){return t.set((e.x-this.min.x)/(this.max.x-this.min.x),(e.y-this.min.y)/(this.max.y-this.min.y),(e.z-this.min.z)/(this.max.z-this.min.z))}intersectsBox(e){return!(e.max.x<this.min.x||e.min.x>this.max.x||e.max.y<this.min.y||e.min.y>this.max.y||e.max.z<this.min.z||e.min.z>this.max.z)}intersectsSphere(e){return this.clampPoint(e.center,Xn),Xn.distanceToSquared(e.center)<=e.radius*e.radius}intersectsPlane(e){let t,n;return e.normal.x>0?(t=e.normal.x*this.min.x,n=e.normal.x*this.max.x):(t=e.normal.x*this.max.x,n=e.normal.x*this.min.x),e.normal.y>0?(t+=e.normal.y*this.min.y,n+=e.normal.y*this.max.y):(t+=e.normal.y*this.max.y,n+=e.normal.y*this.min.y),e.normal.z>0?(t+=e.normal.z*this.min.z,n+=e.normal.z*this.max.z):(t+=e.normal.z*this.max.z,n+=e.normal.z*this.min.z),t<=-e.constant&&n>=-e.constant}intersectsTriangle(e){if(this.isEmpty())return!1;this.getCenter(Ms),qs.subVectors(this.max,Ms),Ni.subVectors(e.a,Ms),Oi.subVectors(e.b,Ms),Fi.subVectors(e.c,Ms),ei.subVectors(Oi,Ni),ti.subVectors(Fi,Oi),vi.subVectors(Ni,Fi);let t=[0,-ei.z,ei.y,0,-ti.z,ti.y,0,-vi.z,vi.y,ei.z,0,-ei.x,ti.z,0,-ti.x,vi.z,0,-vi.x,-ei.y,ei.x,0,-ti.y,ti.x,0,-vi.y,vi.x,0];return!so(t,Ni,Oi,Fi,qs)||(t=[1,0,0,0,1,0,0,0,1],!so(t,Ni,Oi,Fi,qs))?!1:(Ys.crossVectors(ei,ti),t=[Ys.x,Ys.y,Ys.z],so(t,Ni,Oi,Fi,qs))}clampPoint(e,t){return t.copy(e).clamp(this.min,this.max)}distanceToPoint(e){return this.clampPoint(e,Xn).distanceTo(e)}getBoundingSphere(e){return this.isEmpty()?e.makeEmpty():(this.getCenter(e.center),e.radius=this.getSize(Xn).length()*.5),e}intersect(e){return this.min.max(e.min),this.max.min(e.max),this.isEmpty()&&this.makeEmpty(),this}union(e){return this.min.min(e.min),this.max.max(e.max),this}applyMatrix4(e){return this.isEmpty()?this:(jn[0].set(this.min.x,this.min.y,this.min.z).applyMatrix4(e),jn[1].set(this.min.x,this.min.y,this.max.z).applyMatrix4(e),jn[2].set(this.min.x,this.max.y,this.min.z).applyMatrix4(e),jn[3].set(this.min.x,this.max.y,this.max.z).applyMatrix4(e),jn[4].set(this.max.x,this.min.y,this.min.z).applyMatrix4(e),jn[5].set(this.max.x,this.min.y,this.max.z).applyMatrix4(e),jn[6].set(this.max.x,this.max.y,this.min.z).applyMatrix4(e),jn[7].set(this.max.x,this.max.y,this.max.z).applyMatrix4(e),this.setFromPoints(jn),this)}translate(e){return this.min.add(e),this.max.add(e),this}equals(e){return e.min.equals(this.min)&&e.max.equals(this.max)}}const jn=[new G,new G,new G,new G,new G,new G,new G,new G],Xn=new G,ki=new Ws,Ni=new G,Oi=new G,Fi=new G,ei=new G,ti=new G,vi=new G,Ms=new G,qs=new G,Ys=new G,bi=new G;function so(i,e,t,n,s){for(let r=0,o=i.length-3;r<=o;r+=3){bi.fromArray(i,r);const a=s.x*Math.abs(bi.x)+s.y*Math.abs(bi.y)+s.z*Math.abs(bi.z),l=e.dot(bi),c=t.dot(bi),f=n.dot(bi);if(Math.max(-Math.max(l,c,f),Math.min(l,c,f))>a)return!1}return!0}const Gh=new Ws,xs=new G,ro=new G;class Dr{constructor(e=new G,t=-1){this.center=e,this.radius=t}set(e,t){return this.center.copy(e),this.radius=t,this}setFromPoints(e,t){const n=this.center;t!==void 0?n.copy(t):Gh.setFromPoints(e).getCenter(n);let s=0;for(let r=0,o=e.length;r<o;r++)s=Math.max(s,n.distanceToSquared(e[r]));return this.radius=Math.sqrt(s),this}copy(e){return this.center.copy(e.center),this.radius=e.radius,this}isEmpty(){return this.radius<0}makeEmpty(){return this.center.set(0,0,0),this.radius=-1,this}containsPoint(e){return e.distanceToSquared(this.center)<=this.radius*this.radius}distanceToPoint(e){return e.distanceTo(this.center)-this.radius}intersectsSphere(e){const t=this.radius+e.radius;return e.center.distanceToSquared(this.center)<=t*t}intersectsBox(e){return e.intersectsSphere(this)}intersectsPlane(e){return Math.abs(e.distanceToPoint(this.center))<=this.radius}clampPoint(e,t){const n=this.center.distanceToSquared(e);return t.copy(e),n>this.radius*this.radius&&(t.sub(this.center).normalize(),t.multiplyScalar(this.radius).add(this.center)),t}getBoundingBox(e){return this.isEmpty()?(e.makeEmpty(),e):(e.set(this.center,this.center),e.expandByScalar(this.radius),e)}applyMatrix4(e){return this.center.applyMatrix4(e),this.radius=this.radius*e.getMaxScaleOnAxis(),this}translate(e){return this.center.add(e),this}expandByPoint(e){if(this.isEmpty())return this.center.copy(e),this.radius=0,this;xs.subVectors(e,this.center);const t=xs.lengthSq();if(t>this.radius*this.radius){const n=Math.sqrt(t),s=(n-this.radius)*.5;this.center.addScaledVector(xs,s/n),this.radius+=s}return this}union(e){return e.isEmpty()?this:this.isEmpty()?(this.copy(e),this):(this.center.equals(e.center)===!0?this.radius=Math.max(this.radius,e.radius):(ro.subVectors(e.center,this.center).setLength(e.radius),this.expandByPoint(xs.copy(e.center).add(ro)),this.expandByPoint(xs.copy(e.center).sub(ro))),this)}equals(e){return e.center.equals(this.center)&&e.radius===this.radius}clone(){return new this.constructor().copy(this)}}const qn=new G,oo=new G,Zs=new G,ni=new G,ao=new G,Ks=new G,lo=new G;class Xo{constructor(e=new G,t=new G(0,0,-1)){this.origin=e,this.direction=t}set(e,t){return this.origin.copy(e),this.direction.copy(t),this}copy(e){return this.origin.copy(e.origin),this.direction.copy(e.direction),this}at(e,t){return t.copy(this.origin).addScaledVector(this.direction,e)}lookAt(e){return this.direction.copy(e).sub(this.origin).normalize(),this}recast(e){return this.origin.copy(this.at(e,qn)),this}closestPointToPoint(e,t){t.subVectors(e,this.origin);const n=t.dot(this.direction);return n<0?t.copy(this.origin):t.copy(this.origin).addScaledVector(this.direction,n)}distanceToPoint(e){return Math.sqrt(this.distanceSqToPoint(e))}distanceSqToPoint(e){const t=qn.subVectors(e,this.origin).dot(this.direction);return t<0?this.origin.distanceToSquared(e):(qn.copy(this.origin).addScaledVector(this.direction,t),qn.distanceToSquared(e))}distanceSqToSegment(e,t,n,s){oo.copy(e).add(t).multiplyScalar(.5),Zs.copy(t).sub(e).normalize(),ni.copy(this.origin).sub(oo);const r=e.distanceTo(t)*.5,o=-this.direction.dot(Zs),a=ni.dot(this.direction),l=-ni.dot(Zs),c=ni.lengthSq(),f=Math.abs(1-o*o);let h,u,p,g;if(f>0)if(h=o*l-a,u=o*a-l,g=r*f,h>=0)if(u>=-g)if(u<=g){const v=1/f;h*=v,u*=v,p=h*(h+o*u+2*a)+u*(o*h+u+2*l)+c}else u=r,h=Math.max(0,-(o*u+a)),p=-h*h+u*(u+2*l)+c;else u=-r,h=Math.max(0,-(o*u+a)),p=-h*h+u*(u+2*l)+c;else u<=-g?(h=Math.max(0,-(-o*r+a)),u=h>0?-r:Math.min(Math.max(-r,-l),r),p=-h*h+u*(u+2*l)+c):u<=g?(h=0,u=Math.min(Math.max(-r,-l),r),p=u*(u+2*l)+c):(h=Math.max(0,-(o*r+a)),u=h>0?r:Math.min(Math.max(-r,-l),r),p=-h*h+u*(u+2*l)+c);else u=o>0?-r:r,h=Math.max(0,-(o*u+a)),p=-h*h+u*(u+2*l)+c;return n&&n.copy(this.origin).addScaledVector(this.direction,h),s&&s.copy(oo).addScaledVector(Zs,u),p}intersectSphere(e,t){qn.subVectors(e.center,this.origin);const n=qn.dot(this.direction),s=qn.dot(qn)-n*n,r=e.radius*e.radius;if(s>r)return null;const o=Math.sqrt(r-s),a=n-o,l=n+o;return l<0?null:a<0?this.at(l,t):this.at(a,t)}intersectsSphere(e){return this.distanceSqToPoint(e.center)<=e.radius*e.radius}distanceToPlane(e){const t=e.normal.dot(this.direction);if(t===0)return e.distanceToPoint(this.origin)===0?0:null;const n=-(this.origin.dot(e.normal)+e.constant)/t;return n>=0?n:null}intersectPlane(e,t){const n=this.distanceToPlane(e);return n===null?null:this.at(n,t)}intersectsPlane(e){const t=e.distanceToPoint(this.origin);return t===0||e.normal.dot(this.direction)*t<0}intersectBox(e,t){let n,s,r,o,a,l;const c=1/this.direction.x,f=1/this.direction.y,h=1/this.direction.z,u=this.origin;return c>=0?(n=(e.min.x-u.x)*c,s=(e.max.x-u.x)*c):(n=(e.max.x-u.x)*c,s=(e.min.x-u.x)*c),f>=0?(r=(e.min.y-u.y)*f,o=(e.max.y-u.y)*f):(r=(e.max.y-u.y)*f,o=(e.min.y-u.y)*f),n>o||r>s||((r>n||isNaN(n))&&(n=r),(o<s||isNaN(s))&&(s=o),h>=0?(a=(e.min.z-u.z)*h,l=(e.max.z-u.z)*h):(a=(e.max.z-u.z)*h,l=(e.min.z-u.z)*h),n>l||a>s)||((a>n||n!==n)&&(n=a),(l<s||s!==s)&&(s=l),s<0)?null:this.at(n>=0?n:s,t)}intersectsBox(e){return this.intersectBox(e,qn)!==null}intersectTriangle(e,t,n,s,r){ao.subVectors(t,e),Ks.subVectors(n,e),lo.crossVectors(ao,Ks);let o=this.direction.dot(lo),a;if(o>0){if(s)return null;a=1}else if(o<0)a=-1,o=-o;else return null;ni.subVectors(this.origin,e);const l=a*this.direction.dot(Ks.crossVectors(ni,Ks));if(l<0)return null;const c=a*this.direction.dot(ao.cross(ni));if(c<0||l+c>o)return null;const f=-a*ni.dot(lo);return f<0?null:this.at(f/o,r)}applyMatrix4(e){return this.origin.applyMatrix4(e),this.direction.transformDirection(e),this}equals(e){return e.origin.equals(this.origin)&&e.direction.equals(this.direction)}clone(){return new this.constructor().copy(this)}}class Ct{constructor(){Ct.prototype.isMatrix4=!0,this.elements=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]}set(e,t,n,s,r,o,a,l,c,f,h,u,p,g,v,m){const d=this.elements;return d[0]=e,d[4]=t,d[8]=n,d[12]=s,d[1]=r,d[5]=o,d[9]=a,d[13]=l,d[2]=c,d[6]=f,d[10]=h,d[14]=u,d[3]=p,d[7]=g,d[11]=v,d[15]=m,this}identity(){return this.set(1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1),this}clone(){return new Ct().fromArray(this.elements)}copy(e){const t=this.elements,n=e.elements;return t[0]=n[0],t[1]=n[1],t[2]=n[2],t[3]=n[3],t[4]=n[4],t[5]=n[5],t[6]=n[6],t[7]=n[7],t[8]=n[8],t[9]=n[9],t[10]=n[10],t[11]=n[11],t[12]=n[12],t[13]=n[13],t[14]=n[14],t[15]=n[15],this}copyPosition(e){const t=this.elements,n=e.elements;return t[12]=n[12],t[13]=n[13],t[14]=n[14],this}setFromMatrix3(e){const t=e.elements;return this.set(t[0],t[3],t[6],0,t[1],t[4],t[7],0,t[2],t[5],t[8],0,0,0,0,1),this}extractBasis(e,t,n){return e.setFromMatrixColumn(this,0),t.setFromMatrixColumn(this,1),n.setFromMatrixColumn(this,2),this}makeBasis(e,t,n){return this.set(e.x,t.x,n.x,0,e.y,t.y,n.y,0,e.z,t.z,n.z,0,0,0,0,1),this}extractRotation(e){const t=this.elements,n=e.elements,s=1/Bi.setFromMatrixColumn(e,0).length(),r=1/Bi.setFromMatrixColumn(e,1).length(),o=1/Bi.setFromMatrixColumn(e,2).length();return t[0]=n[0]*s,t[1]=n[1]*s,t[2]=n[2]*s,t[3]=0,t[4]=n[4]*r,t[5]=n[5]*r,t[6]=n[6]*r,t[7]=0,t[8]=n[8]*o,t[9]=n[9]*o,t[10]=n[10]*o,t[11]=0,t[12]=0,t[13]=0,t[14]=0,t[15]=1,this}makeRotationFromEuler(e){const t=this.elements,n=e.x,s=e.y,r=e.z,o=Math.cos(n),a=Math.sin(n),l=Math.cos(s),c=Math.sin(s),f=Math.cos(r),h=Math.sin(r);if(e.order==="XYZ"){const u=o*f,p=o*h,g=a*f,v=a*h;t[0]=l*f,t[4]=-l*h,t[8]=c,t[1]=p+g*c,t[5]=u-v*c,t[9]=-a*l,t[2]=v-u*c,t[6]=g+p*c,t[10]=o*l}else if(e.order==="YXZ"){const u=l*f,p=l*h,g=c*f,v=c*h;t[0]=u+v*a,t[4]=g*a-p,t[8]=o*c,t[1]=o*h,t[5]=o*f,t[9]=-a,t[2]=p*a-g,t[6]=v+u*a,t[10]=o*l}else if(e.order==="ZXY"){const u=l*f,p=l*h,g=c*f,v=c*h;t[0]=u-v*a,t[4]=-o*h,t[8]=g+p*a,t[1]=p+g*a,t[5]=o*f,t[9]=v-u*a,t[2]=-o*c,t[6]=a,t[10]=o*l}else if(e.order==="ZYX"){const u=o*f,p=o*h,g=a*f,v=a*h;t[0]=l*f,t[4]=g*c-p,t[8]=u*c+v,t[1]=l*h,t[5]=v*c+u,t[9]=p*c-g,t[2]=-c,t[6]=a*l,t[10]=o*l}else if(e.order==="YZX"){const u=o*l,p=o*c,g=a*l,v=a*c;t[0]=l*f,t[4]=v-u*h,t[8]=g*h+p,t[1]=h,t[5]=o*f,t[9]=-a*f,t[2]=-c*f,t[6]=p*h+g,t[10]=u-v*h}else if(e.order==="XZY"){const u=o*l,p=o*c,g=a*l,v=a*c;t[0]=l*f,t[4]=-h,t[8]=c*f,t[1]=u*h+v,t[5]=o*f,t[9]=p*h-g,t[2]=g*h-p,t[6]=a*f,t[10]=v*h+u}return t[3]=0,t[7]=0,t[11]=0,t[12]=0,t[13]=0,t[14]=0,t[15]=1,this}makeRotationFromQuaternion(e){return this.compose(Hh,e,Vh)}lookAt(e,t,n){const s=this.elements;return mn.subVectors(e,t),mn.lengthSq()===0&&(mn.z=1),mn.normalize(),ii.crossVectors(n,mn),ii.lengthSq()===0&&(Math.abs(n.z)===1?mn.x+=1e-4:mn.z+=1e-4,mn.normalize(),ii.crossVectors(n,mn)),ii.normalize(),Qs.crossVectors(mn,ii),s[0]=ii.x,s[4]=Qs.x,s[8]=mn.x,s[1]=ii.y,s[5]=Qs.y,s[9]=mn.y,s[2]=ii.z,s[6]=Qs.z,s[10]=mn.z,this}multiply(e){return this.multiplyMatrices(this,e)}premultiply(e){return this.multiplyMatrices(e,this)}multiplyMatrices(e,t){const n=e.elements,s=t.elements,r=this.elements,o=n[0],a=n[4],l=n[8],c=n[12],f=n[1],h=n[5],u=n[9],p=n[13],g=n[2],v=n[6],m=n[10],d=n[14],M=n[3],b=n[7],x=n[11],y=n[15],T=s[0],L=s[4],w=s[8],_=s[12],S=s[1],B=s[5],k=s[9],C=s[13],U=s[2],N=s[6],j=s[10],D=s[14],V=s[3],W=s[7],Q=s[11],oe=s[15];return r[0]=o*T+a*S+l*U+c*V,r[4]=o*L+a*B+l*N+c*W,r[8]=o*w+a*k+l*j+c*Q,r[12]=o*_+a*C+l*D+c*oe,r[1]=f*T+h*S+u*U+p*V,r[5]=f*L+h*B+u*N+p*W,r[9]=f*w+h*k+u*j+p*Q,r[13]=f*_+h*C+u*D+p*oe,r[2]=g*T+v*S+m*U+d*V,r[6]=g*L+v*B+m*N+d*W,r[10]=g*w+v*k+m*j+d*Q,r[14]=g*_+v*C+m*D+d*oe,r[3]=M*T+b*S+x*U+y*V,r[7]=M*L+b*B+x*N+y*W,r[11]=M*w+b*k+x*j+y*Q,r[15]=M*_+b*C+x*D+y*oe,this}multiplyScalar(e){const t=this.elements;return t[0]*=e,t[4]*=e,t[8]*=e,t[12]*=e,t[1]*=e,t[5]*=e,t[9]*=e,t[13]*=e,t[2]*=e,t[6]*=e,t[10]*=e,t[14]*=e,t[3]*=e,t[7]*=e,t[11]*=e,t[15]*=e,this}determinant(){const e=this.elements,t=e[0],n=e[4],s=e[8],r=e[12],o=e[1],a=e[5],l=e[9],c=e[13],f=e[2],h=e[6],u=e[10],p=e[14],g=e[3],v=e[7],m=e[11],d=e[15];return g*(+r*l*h-s*c*h-r*a*u+n*c*u+s*a*p-n*l*p)+v*(+t*l*p-t*c*u+r*o*u-s*o*p+s*c*f-r*l*f)+m*(+t*c*h-t*a*p-r*o*h+n*o*p+r*a*f-n*c*f)+d*(-s*a*f-t*l*h+t*a*u+s*o*h-n*o*u+n*l*f)}transpose(){const e=this.elements;let t;return t=e[1],e[1]=e[4],e[4]=t,t=e[2],e[2]=e[8],e[8]=t,t=e[6],e[6]=e[9],e[9]=t,t=e[3],e[3]=e[12],e[12]=t,t=e[7],e[7]=e[13],e[13]=t,t=e[11],e[11]=e[14],e[14]=t,this}setPosition(e,t,n){const s=this.elements;return e.isVector3?(s[12]=e.x,s[13]=e.y,s[14]=e.z):(s[12]=e,s[13]=t,s[14]=n),this}invert(){const e=this.elements,t=e[0],n=e[1],s=e[2],r=e[3],o=e[4],a=e[5],l=e[6],c=e[7],f=e[8],h=e[9],u=e[10],p=e[11],g=e[12],v=e[13],m=e[14],d=e[15],M=h*m*c-v*u*c+v*l*p-a*m*p-h*l*d+a*u*d,b=g*u*c-f*m*c-g*l*p+o*m*p+f*l*d-o*u*d,x=f*v*c-g*h*c+g*a*p-o*v*p-f*a*d+o*h*d,y=g*h*l-f*v*l-g*a*u+o*v*u+f*a*m-o*h*m,T=t*M+n*b+s*x+r*y;if(T===0)return this.set(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);const L=1/T;return e[0]=M*L,e[1]=(v*u*r-h*m*r-v*s*p+n*m*p+h*s*d-n*u*d)*L,e[2]=(a*m*r-v*l*r+v*s*c-n*m*c-a*s*d+n*l*d)*L,e[3]=(h*l*r-a*u*r-h*s*c+n*u*c+a*s*p-n*l*p)*L,e[4]=b*L,e[5]=(f*m*r-g*u*r+g*s*p-t*m*p-f*s*d+t*u*d)*L,e[6]=(g*l*r-o*m*r-g*s*c+t*m*c+o*s*d-t*l*d)*L,e[7]=(o*u*r-f*l*r+f*s*c-t*u*c-o*s*p+t*l*p)*L,e[8]=x*L,e[9]=(g*h*r-f*v*r-g*n*p+t*v*p+f*n*d-t*h*d)*L,e[10]=(o*v*r-g*a*r+g*n*c-t*v*c-o*n*d+t*a*d)*L,e[11]=(f*a*r-o*h*r-f*n*c+t*h*c+o*n*p-t*a*p)*L,e[12]=y*L,e[13]=(f*v*s-g*h*s+g*n*u-t*v*u-f*n*m+t*h*m)*L,e[14]=(g*a*s-o*v*s-g*n*l+t*v*l+o*n*m-t*a*m)*L,e[15]=(o*h*s-f*a*s+f*n*l-t*h*l-o*n*u+t*a*u)*L,this}scale(e){const t=this.elements,n=e.x,s=e.y,r=e.z;return t[0]*=n,t[4]*=s,t[8]*=r,t[1]*=n,t[5]*=s,t[9]*=r,t[2]*=n,t[6]*=s,t[10]*=r,t[3]*=n,t[7]*=s,t[11]*=r,this}getMaxScaleOnAxis(){const e=this.elements,t=e[0]*e[0]+e[1]*e[1]+e[2]*e[2],n=e[4]*e[4]+e[5]*e[5]+e[6]*e[6],s=e[8]*e[8]+e[9]*e[9]+e[10]*e[10];return Math.sqrt(Math.max(t,n,s))}makeTranslation(e,t,n){return this.set(1,0,0,e,0,1,0,t,0,0,1,n,0,0,0,1),this}makeRotationX(e){const t=Math.cos(e),n=Math.sin(e);return this.set(1,0,0,0,0,t,-n,0,0,n,t,0,0,0,0,1),this}makeRotationY(e){const t=Math.cos(e),n=Math.sin(e);return this.set(t,0,n,0,0,1,0,0,-n,0,t,0,0,0,0,1),this}makeRotationZ(e){const t=Math.cos(e),n=Math.sin(e);return this.set(t,-n,0,0,n,t,0,0,0,0,1,0,0,0,0,1),this}makeRotationAxis(e,t){const n=Math.cos(t),s=Math.sin(t),r=1-n,o=e.x,a=e.y,l=e.z,c=r*o,f=r*a;return this.set(c*o+n,c*a-s*l,c*l+s*a,0,c*a+s*l,f*a+n,f*l-s*o,0,c*l-s*a,f*l+s*o,r*l*l+n,0,0,0,0,1),this}makeScale(e,t,n){return this.set(e,0,0,0,0,t,0,0,0,0,n,0,0,0,0,1),this}makeShear(e,t,n,s,r,o){return this.set(1,n,r,0,e,1,o,0,t,s,1,0,0,0,0,1),this}compose(e,t,n){const s=this.elements,r=t._x,o=t._y,a=t._z,l=t._w,c=r+r,f=o+o,h=a+a,u=r*c,p=r*f,g=r*h,v=o*f,m=o*h,d=a*h,M=l*c,b=l*f,x=l*h,y=n.x,T=n.y,L=n.z;return s[0]=(1-(v+d))*y,s[1]=(p+x)*y,s[2]=(g-b)*y,s[3]=0,s[4]=(p-x)*T,s[5]=(1-(u+d))*T,s[6]=(m+M)*T,s[7]=0,s[8]=(g+b)*L,s[9]=(m-M)*L,s[10]=(1-(u+v))*L,s[11]=0,s[12]=e.x,s[13]=e.y,s[14]=e.z,s[15]=1,this}decompose(e,t,n){const s=this.elements;let r=Bi.set(s[0],s[1],s[2]).length();const o=Bi.set(s[4],s[5],s[6]).length(),a=Bi.set(s[8],s[9],s[10]).length();this.determinant()<0&&(r=-r),e.x=s[12],e.y=s[13],e.z=s[14],Sn.copy(this);const c=1/r,f=1/o,h=1/a;return Sn.elements[0]*=c,Sn.elements[1]*=c,Sn.elements[2]*=c,Sn.elements[4]*=f,Sn.elements[5]*=f,Sn.elements[6]*=f,Sn.elements[8]*=h,Sn.elements[9]*=h,Sn.elements[10]*=h,t.setFromRotationMatrix(Sn),n.x=r,n.y=o,n.z=a,this}makePerspective(e,t,n,s,r,o){const a=this.elements,l=2*r/(t-e),c=2*r/(n-s),f=(t+e)/(t-e),h=(n+s)/(n-s),u=-(o+r)/(o-r),p=-2*o*r/(o-r);return a[0]=l,a[4]=0,a[8]=f,a[12]=0,a[1]=0,a[5]=c,a[9]=h,a[13]=0,a[2]=0,a[6]=0,a[10]=u,a[14]=p,a[3]=0,a[7]=0,a[11]=-1,a[15]=0,this}makeOrthographic(e,t,n,s,r,o){const a=this.elements,l=1/(t-e),c=1/(n-s),f=1/(o-r),h=(t+e)*l,u=(n+s)*c,p=(o+r)*f;return a[0]=2*l,a[4]=0,a[8]=0,a[12]=-h,a[1]=0,a[5]=2*c,a[9]=0,a[13]=-u,a[2]=0,a[6]=0,a[10]=-2*f,a[14]=-p,a[3]=0,a[7]=0,a[11]=0,a[15]=1,this}equals(e){const t=this.elements,n=e.elements;for(let s=0;s<16;s++)if(t[s]!==n[s])return!1;return!0}fromArray(e,t=0){for(let n=0;n<16;n++)this.elements[n]=e[n+t];return this}toArray(e=[],t=0){const n=this.elements;return e[t]=n[0],e[t+1]=n[1],e[t+2]=n[2],e[t+3]=n[3],e[t+4]=n[4],e[t+5]=n[5],e[t+6]=n[6],e[t+7]=n[7],e[t+8]=n[8],e[t+9]=n[9],e[t+10]=n[10],e[t+11]=n[11],e[t+12]=n[12],e[t+13]=n[13],e[t+14]=n[14],e[t+15]=n[15],e}}const Bi=new G,Sn=new Ct,Hh=new G(0,0,0),Vh=new G(1,1,1),ii=new G,Qs=new G,mn=new G,Va=new Ct,Wa=new en;class mi{constructor(e=0,t=0,n=0,s=mi.DEFAULT_ORDER){this.isEuler=!0,this._x=e,this._y=t,this._z=n,this._order=s}get x(){return this._x}set x(e){this._x=e,this._onChangeCallback()}get y(){return this._y}set y(e){this._y=e,this._onChangeCallback()}get z(){return this._z}set z(e){this._z=e,this._onChangeCallback()}get order(){return this._order}set order(e){this._order=e,this._onChangeCallback()}set(e,t,n,s=this._order){return this._x=e,this._y=t,this._z=n,this._order=s,this._onChangeCallback(),this}clone(){return new this.constructor(this._x,this._y,this._z,this._order)}copy(e){return this._x=e._x,this._y=e._y,this._z=e._z,this._order=e._order,this._onChangeCallback(),this}setFromRotationMatrix(e,t=this._order,n=!0){const s=e.elements,r=s[0],o=s[4],a=s[8],l=s[1],c=s[5],f=s[9],h=s[2],u=s[6],p=s[10];switch(t){case"XYZ":this._y=Math.asin(tn(a,-1,1)),Math.abs(a)<.9999999?(this._x=Math.atan2(-f,p),this._z=Math.atan2(-o,r)):(this._x=Math.atan2(u,c),this._z=0);break;case"YXZ":this._x=Math.asin(-tn(f,-1,1)),Math.abs(f)<.9999999?(this._y=Math.atan2(a,p),this._z=Math.atan2(l,c)):(this._y=Math.atan2(-h,r),this._z=0);break;case"ZXY":this._x=Math.asin(tn(u,-1,1)),Math.abs(u)<.9999999?(this._y=Math.atan2(-h,p),this._z=Math.atan2(-o,c)):(this._y=0,this._z=Math.atan2(l,r));break;case"ZYX":this._y=Math.asin(-tn(h,-1,1)),Math.abs(h)<.9999999?(this._x=Math.atan2(u,p),this._z=Math.atan2(l,r)):(this._x=0,this._z=Math.atan2(-o,c));break;case"YZX":this._z=Math.asin(tn(l,-1,1)),Math.abs(l)<.9999999?(this._x=Math.atan2(-f,c),this._y=Math.atan2(-h,r)):(this._x=0,this._y=Math.atan2(a,p));break;case"XZY":this._z=Math.asin(-tn(o,-1,1)),Math.abs(o)<.9999999?(this._x=Math.atan2(u,c),this._y=Math.atan2(a,r)):(this._x=Math.atan2(-f,p),this._y=0);break;default:console.warn("THREE.Euler: .setFromRotationMatrix() encountered an unknown order: "+t)}return this._order=t,n===!0&&this._onChangeCallback(),this}setFromQuaternion(e,t,n){return Va.makeRotationFromQuaternion(e),this.setFromRotationMatrix(Va,t,n)}setFromVector3(e,t=this._order){return this.set(e.x,e.y,e.z,t)}reorder(e){return Wa.setFromEuler(this),this.setFromQuaternion(Wa,e)}equals(e){return e._x===this._x&&e._y===this._y&&e._z===this._z&&e._order===this._order}fromArray(e){return this._x=e[0],this._y=e[1],this._z=e[2],e[3]!==void 0&&(this._order=e[3]),this._onChangeCallback(),this}toArray(e=[],t=0){return e[t]=this._x,e[t+1]=this._y,e[t+2]=this._z,e[t+3]=this._order,e}_onChange(e){return this._onChangeCallback=e,this}_onChangeCallback(){}*[Symbol.iterator](){yield this._x,yield this._y,yield this._z,yield this._order}}mi.DEFAULT_ORDER="XYZ";class qo{constructor(){this.mask=1}set(e){this.mask=(1<<e|0)>>>0}enable(e){this.mask|=1<<e|0}enableAll(){this.mask=-1}toggle(e){this.mask^=1<<e|0}disable(e){this.mask&=~(1<<e|0)}disableAll(){this.mask=0}test(e){return(this.mask&e.mask)!==0}isEnabled(e){return(this.mask&(1<<e|0))!==0}}let Wh=0;const ja=new G,Gi=new en,Yn=new Ct,Js=new G,Ss=new G,jh=new G,Xh=new en,Xa=new G(1,0,0),qa=new G(0,1,0),Ya=new G(0,0,1),qh={type:"added"},Za={type:"removed"};class Ut extends ds{constructor(){super(),this.isObject3D=!0,Object.defineProperty(this,"id",{value:Wh++}),this.uuid=ps(),this.name="",this.type="Object3D",this.parent=null,this.children=[],this.up=Ut.DEFAULT_UP.clone();const e=new G,t=new mi,n=new en,s=new G(1,1,1);function r(){n.setFromEuler(t,!1)}function o(){t.setFromQuaternion(n,void 0,!1)}t._onChange(r),n._onChange(o),Object.defineProperties(this,{position:{configurable:!0,enumerable:!0,value:e},rotation:{configurable:!0,enumerable:!0,value:t},quaternion:{configurable:!0,enumerable:!0,value:n},scale:{configurable:!0,enumerable:!0,value:s},modelViewMatrix:{value:new Ct},normalMatrix:{value:new et}}),this.matrix=new Ct,this.matrixWorld=new Ct,this.matrixAutoUpdate=Ut.DEFAULT_MATRIX_AUTO_UPDATE,this.matrixWorldNeedsUpdate=!1,this.matrixWorldAutoUpdate=Ut.DEFAULT_MATRIX_WORLD_AUTO_UPDATE,this.layers=new qo,this.visible=!0,this.castShadow=!1,this.receiveShadow=!1,this.frustumCulled=!0,this.renderOrder=0,this.animations=[],this.userData={}}onBeforeRender(){}onAfterRender(){}applyMatrix4(e){this.matrixAutoUpdate&&this.updateMatrix(),this.matrix.premultiply(e),this.matrix.decompose(this.position,this.quaternion,this.scale)}applyQuaternion(e){return this.quaternion.premultiply(e),this}setRotationFromAxisAngle(e,t){this.quaternion.setFromAxisAngle(e,t)}setRotationFromEuler(e){this.quaternion.setFromEuler(e,!0)}setRotationFromMatrix(e){this.quaternion.setFromRotationMatrix(e)}setRotationFromQuaternion(e){this.quaternion.copy(e)}rotateOnAxis(e,t){return Gi.setFromAxisAngle(e,t),this.quaternion.multiply(Gi),this}rotateOnWorldAxis(e,t){return Gi.setFromAxisAngle(e,t),this.quaternion.premultiply(Gi),this}rotateX(e){return this.rotateOnAxis(Xa,e)}rotateY(e){return this.rotateOnAxis(qa,e)}rotateZ(e){return this.rotateOnAxis(Ya,e)}translateOnAxis(e,t){return ja.copy(e).applyQuaternion(this.quaternion),this.position.add(ja.multiplyScalar(t)),this}translateX(e){return this.translateOnAxis(Xa,e)}translateY(e){return this.translateOnAxis(qa,e)}translateZ(e){return this.translateOnAxis(Ya,e)}localToWorld(e){return this.updateWorldMatrix(!0,!1),e.applyMatrix4(this.matrixWorld)}worldToLocal(e){return this.updateWorldMatrix(!0,!1),e.applyMatrix4(Yn.copy(this.matrixWorld).invert())}lookAt(e,t,n){e.isVector3?Js.copy(e):Js.set(e,t,n);const s=this.parent;this.updateWorldMatrix(!0,!1),Ss.setFromMatrixPosition(this.matrixWorld),this.isCamera||this.isLight?Yn.lookAt(Ss,Js,this.up):Yn.lookAt(Js,Ss,this.up),this.quaternion.setFromRotationMatrix(Yn),s&&(Yn.extractRotation(s.matrixWorld),Gi.setFromRotationMatrix(Yn),this.quaternion.premultiply(Gi.invert()))}add(e){if(arguments.length>1){for(let t=0;t<arguments.length;t++)this.add(arguments[t]);return this}return e===this?(console.error("THREE.Object3D.add: object can't be added as a child of itself.",e),this):(e&&e.isObject3D?(e.parent!==null&&e.parent.remove(e),e.parent=this,this.children.push(e),e.dispatchEvent(qh)):console.error("THREE.Object3D.add: object not an instance of THREE.Object3D.",e),this)}remove(e){if(arguments.length>1){for(let n=0;n<arguments.length;n++)this.remove(arguments[n]);return this}const t=this.children.indexOf(e);return t!==-1&&(e.parent=null,this.children.splice(t,1),e.dispatchEvent(Za)),this}removeFromParent(){const e=this.parent;return e!==null&&e.remove(this),this}clear(){for(let e=0;e<this.children.length;e++){const t=this.children[e];t.parent=null,t.dispatchEvent(Za)}return this.children.length=0,this}attach(e){return this.updateWorldMatrix(!0,!1),Yn.copy(this.matrixWorld).invert(),e.parent!==null&&(e.parent.updateWorldMatrix(!0,!1),Yn.multiply(e.parent.matrixWorld)),e.applyMatrix4(Yn),this.add(e),e.updateWorldMatrix(!1,!0),this}getObjectById(e){return this.getObjectByProperty("id",e)}getObjectByName(e){return this.getObjectByProperty("name",e)}getObjectByProperty(e,t){if(this[e]===t)return this;for(let n=0,s=this.children.length;n<s;n++){const o=this.children[n].getObjectByProperty(e,t);if(o!==void 0)return o}}getObjectsByProperty(e,t){let n=[];this[e]===t&&n.push(this);for(let s=0,r=this.children.length;s<r;s++){const o=this.children[s].getObjectsByProperty(e,t);o.length>0&&(n=n.concat(o))}return n}getWorldPosition(e){return this.updateWorldMatrix(!0,!1),e.setFromMatrixPosition(this.matrixWorld)}getWorldQuaternion(e){return this.updateWorldMatrix(!0,!1),this.matrixWorld.decompose(Ss,e,jh),e}getWorldScale(e){return this.updateWorldMatrix(!0,!1),this.matrixWorld.decompose(Ss,Xh,e),e}getWorldDirection(e){this.updateWorldMatrix(!0,!1);const t=this.matrixWorld.elements;return e.set(t[8],t[9],t[10]).normalize()}raycast(){}traverse(e){e(this);const t=this.children;for(let n=0,s=t.length;n<s;n++)t[n].traverse(e)}traverseVisible(e){if(this.visible===!1)return;e(this);const t=this.children;for(let n=0,s=t.length;n<s;n++)t[n].traverseVisible(e)}traverseAncestors(e){const t=this.parent;t!==null&&(e(t),t.traverseAncestors(e))}updateMatrix(){this.matrix.compose(this.position,this.quaternion,this.scale),this.matrixWorldNeedsUpdate=!0}updateMatrixWorld(e){this.matrixAutoUpdate&&this.updateMatrix(),(this.matrixWorldNeedsUpdate||e)&&(this.parent===null?this.matrixWorld.copy(this.matrix):this.matrixWorld.multiplyMatrices(this.parent.matrixWorld,this.matrix),this.matrixWorldNeedsUpdate=!1,e=!0);const t=this.children;for(let n=0,s=t.length;n<s;n++){const r=t[n];(r.matrixWorldAutoUpdate===!0||e===!0)&&r.updateMatrixWorld(e)}}updateWorldMatrix(e,t){const n=this.parent;if(e===!0&&n!==null&&n.matrixWorldAutoUpdate===!0&&n.updateWorldMatrix(!0,!1),this.matrixAutoUpdate&&this.updateMatrix(),this.parent===null?this.matrixWorld.copy(this.matrix):this.matrixWorld.multiplyMatrices(this.parent.matrixWorld,this.matrix),t===!0){const s=this.children;for(let r=0,o=s.length;r<o;r++){const a=s[r];a.matrixWorldAutoUpdate===!0&&a.updateWorldMatrix(!1,!0)}}}toJSON(e){const t=e===void 0||typeof e=="string",n={};t&&(e={geometries:{},materials:{},textures:{},images:{},shapes:{},skeletons:{},animations:{},nodes:{}},n.metadata={version:4.5,type:"Object",generator:"Object3D.toJSON"});const s={};s.uuid=this.uuid,s.type=this.type,this.name!==""&&(s.name=this.name),this.castShadow===!0&&(s.castShadow=!0),this.receiveShadow===!0&&(s.receiveShadow=!0),this.visible===!1&&(s.visible=!1),this.frustumCulled===!1&&(s.frustumCulled=!1),this.renderOrder!==0&&(s.renderOrder=this.renderOrder),Object.keys(this.userData).length>0&&(s.userData=this.userData),s.layers=this.layers.mask,s.matrix=this.matrix.toArray(),s.up=this.up.toArray(),this.matrixAutoUpdate===!1&&(s.matrixAutoUpdate=!1),this.isInstancedMesh&&(s.type="InstancedMesh",s.count=this.count,s.instanceMatrix=this.instanceMatrix.toJSON(),this.instanceColor!==null&&(s.instanceColor=this.instanceColor.toJSON()));function r(a,l){return a[l.uuid]===void 0&&(a[l.uuid]=l.toJSON(e)),l.uuid}if(this.isScene)this.background&&(this.background.isColor?s.background=this.background.toJSON():this.background.isTexture&&(s.background=this.background.toJSON(e).uuid)),this.environment&&this.environment.isTexture&&this.environment.isRenderTargetTexture!==!0&&(s.environment=this.environment.toJSON(e).uuid);else if(this.isMesh||this.isLine||this.isPoints){s.geometry=r(e.geometries,this.geometry);const a=this.geometry.parameters;if(a!==void 0&&a.shapes!==void 0){const l=a.shapes;if(Array.isArray(l))for(let c=0,f=l.length;c<f;c++){const h=l[c];r(e.shapes,h)}else r(e.shapes,l)}}if(this.isSkinnedMesh&&(s.bindMode=this.bindMode,s.bindMatrix=this.bindMatrix.toArray(),this.skeleton!==void 0&&(r(e.skeletons,this.skeleton),s.skeleton=this.skeleton.uuid)),this.material!==void 0)if(Array.isArray(this.material)){const a=[];for(let l=0,c=this.material.length;l<c;l++)a.push(r(e.materials,this.material[l]));s.material=a}else s.material=r(e.materials,this.material);if(this.children.length>0){s.children=[];for(let a=0;a<this.children.length;a++)s.children.push(this.children[a].toJSON(e).object)}if(this.animations.length>0){s.animations=[];for(let a=0;a<this.animations.length;a++){const l=this.animations[a];s.animations.push(r(e.animations,l))}}if(t){const a=o(e.geometries),l=o(e.materials),c=o(e.textures),f=o(e.images),h=o(e.shapes),u=o(e.skeletons),p=o(e.animations),g=o(e.nodes);a.length>0&&(n.geometries=a),l.length>0&&(n.materials=l),c.length>0&&(n.textures=c),f.length>0&&(n.images=f),h.length>0&&(n.shapes=h),u.length>0&&(n.skeletons=u),p.length>0&&(n.animations=p),g.length>0&&(n.nodes=g)}return n.object=s,n;function o(a){const l=[];for(const c in a){const f=a[c];delete f.metadata,l.push(f)}return l}}clone(e){return new this.constructor().copy(this,e)}copy(e,t=!0){if(this.name=e.name,this.up.copy(e.up),this.position.copy(e.position),this.rotation.order=e.rotation.order,this.quaternion.copy(e.quaternion),this.scale.copy(e.scale),this.matrix.copy(e.matrix),this.matrixWorld.copy(e.matrixWorld),this.matrixAutoUpdate=e.matrixAutoUpdate,this.matrixWorldNeedsUpdate=e.matrixWorldNeedsUpdate,this.matrixWorldAutoUpdate=e.matrixWorldAutoUpdate,this.layers.mask=e.layers.mask,this.visible=e.visible,this.castShadow=e.castShadow,this.receiveShadow=e.receiveShadow,this.frustumCulled=e.frustumCulled,this.renderOrder=e.renderOrder,this.userData=JSON.parse(JSON.stringify(e.userData)),t===!0)for(let n=0;n<e.children.length;n++){const s=e.children[n];this.add(s.clone())}return this}}Ut.DEFAULT_UP=new G(0,1,0);Ut.DEFAULT_MATRIX_AUTO_UPDATE=!0;Ut.DEFAULT_MATRIX_WORLD_AUTO_UPDATE=!0;const yn=new G,Zn=new G,co=new G,Kn=new G,Hi=new G,Vi=new G,Ka=new G,uo=new G,fo=new G,ho=new G;let $s=!1;class En{constructor(e=new G,t=new G,n=new G){this.a=e,this.b=t,this.c=n}static getNormal(e,t,n,s){s.subVectors(n,t),yn.subVectors(e,t),s.cross(yn);const r=s.lengthSq();return r>0?s.multiplyScalar(1/Math.sqrt(r)):s.set(0,0,0)}static getBarycoord(e,t,n,s,r){yn.subVectors(s,t),Zn.subVectors(n,t),co.subVectors(e,t);const o=yn.dot(yn),a=yn.dot(Zn),l=yn.dot(co),c=Zn.dot(Zn),f=Zn.dot(co),h=o*c-a*a;if(h===0)return r.set(-2,-1,-1);const u=1/h,p=(c*l-a*f)*u,g=(o*f-a*l)*u;return r.set(1-p-g,g,p)}static containsPoint(e,t,n,s){return this.getBarycoord(e,t,n,s,Kn),Kn.x>=0&&Kn.y>=0&&Kn.x+Kn.y<=1}static getUV(e,t,n,s,r,o,a,l){return $s===!1&&(console.warn("THREE.Triangle.getUV() has been renamed to THREE.Triangle.getInterpolation()."),$s=!0),this.getInterpolation(e,t,n,s,r,o,a,l)}static getInterpolation(e,t,n,s,r,o,a,l){return this.getBarycoord(e,t,n,s,Kn),l.setScalar(0),l.addScaledVector(r,Kn.x),l.addScaledVector(o,Kn.y),l.addScaledVector(a,Kn.z),l}static isFrontFacing(e,t,n,s){return yn.subVectors(n,t),Zn.subVectors(e,t),yn.cross(Zn).dot(s)<0}set(e,t,n){return this.a.copy(e),this.b.copy(t),this.c.copy(n),this}setFromPointsAndIndices(e,t,n,s){return this.a.copy(e[t]),this.b.copy(e[n]),this.c.copy(e[s]),this}setFromAttributeAndIndices(e,t,n,s){return this.a.fromBufferAttribute(e,t),this.b.fromBufferAttribute(e,n),this.c.fromBufferAttribute(e,s),this}clone(){return new this.constructor().copy(this)}copy(e){return this.a.copy(e.a),this.b.copy(e.b),this.c.copy(e.c),this}getArea(){return yn.subVectors(this.c,this.b),Zn.subVectors(this.a,this.b),yn.cross(Zn).length()*.5}getMidpoint(e){return e.addVectors(this.a,this.b).add(this.c).multiplyScalar(1/3)}getNormal(e){return En.getNormal(this.a,this.b,this.c,e)}getPlane(e){return e.setFromCoplanarPoints(this.a,this.b,this.c)}getBarycoord(e,t){return En.getBarycoord(e,this.a,this.b,this.c,t)}getUV(e,t,n,s,r){return $s===!1&&(console.warn("THREE.Triangle.getUV() has been renamed to THREE.Triangle.getInterpolation()."),$s=!0),En.getInterpolation(e,this.a,this.b,this.c,t,n,s,r)}getInterpolation(e,t,n,s,r){return En.getInterpolation(e,this.a,this.b,this.c,t,n,s,r)}containsPoint(e){return En.containsPoint(e,this.a,this.b,this.c)}isFrontFacing(e){return En.isFrontFacing(this.a,this.b,this.c,e)}intersectsBox(e){return e.intersectsTriangle(this)}closestPointToPoint(e,t){const n=this.a,s=this.b,r=this.c;let o,a;Hi.subVectors(s,n),Vi.subVectors(r,n),uo.subVectors(e,n);const l=Hi.dot(uo),c=Vi.dot(uo);if(l<=0&&c<=0)return t.copy(n);fo.subVectors(e,s);const f=Hi.dot(fo),h=Vi.dot(fo);if(f>=0&&h<=f)return t.copy(s);const u=l*h-f*c;if(u<=0&&l>=0&&f<=0)return o=l/(l-f),t.copy(n).addScaledVector(Hi,o);ho.subVectors(e,r);const p=Hi.dot(ho),g=Vi.dot(ho);if(g>=0&&p<=g)return t.copy(r);const v=p*c-l*g;if(v<=0&&c>=0&&g<=0)return a=c/(c-g),t.copy(n).addScaledVector(Vi,a);const m=f*g-p*h;if(m<=0&&h-f>=0&&p-g>=0)return Ka.subVectors(r,s),a=(h-f)/(h-f+(p-g)),t.copy(s).addScaledVector(Ka,a);const d=1/(m+v+u);return o=v*d,a=u*d,t.copy(n).addScaledVector(Hi,o).addScaledVector(Vi,a)}equals(e){return e.a.equals(this.a)&&e.b.equals(this.b)&&e.c.equals(this.c)}}let Yh=0;class ms extends ds{constructor(){super(),this.isMaterial=!0,Object.defineProperty(this,"id",{value:Yh++}),this.uuid=ps(),this.name="",this.type="Material",this.blending=is,this.side=ci,this.vertexColors=!1,this.opacity=1,this.transparent=!1,this.blendSrc=iu,this.blendDst=su,this.blendEquation=Ji,this.blendSrcAlpha=null,this.blendDstAlpha=null,this.blendEquationAlpha=null,this.depthFunc=Lo,this.depthTest=!0,this.depthWrite=!0,this.stencilWriteMask=255,this.stencilFunc=vh,this.stencilRef=0,this.stencilFuncMask=255,this.stencilFail=$r,this.stencilZFail=$r,this.stencilZPass=$r,this.stencilWrite=!1,this.clippingPlanes=null,this.clipIntersection=!1,this.clipShadows=!1,this.shadowSide=null,this.colorWrite=!0,this.precision=null,this.polygonOffset=!1,this.polygonOffsetFactor=0,this.polygonOffsetUnits=0,this.dithering=!1,this.alphaToCoverage=!1,this.premultipliedAlpha=!1,this.forceSinglePass=!1,this.visible=!0,this.toneMapped=!0,this.userData={},this.version=0,this._alphaTest=0}get alphaTest(){return this._alphaTest}set alphaTest(e){this._alphaTest>0!=e>0&&this.version++,this._alphaTest=e}onBuild(){}onBeforeRender(){}onBeforeCompile(){}customProgramCacheKey(){return this.onBeforeCompile.toString()}setValues(e){if(e!==void 0)for(const t in e){const n=e[t];if(n===void 0){console.warn(`THREE.Material: parameter '${t}' has value of undefined.`);continue}const s=this[t];if(s===void 0){console.warn(`THREE.Material: '${t}' is not a property of THREE.${this.type}.`);continue}s&&s.isColor?s.set(n):s&&s.isVector3&&n&&n.isVector3?s.copy(n):this[t]=n}}toJSON(e){const t=e===void 0||typeof e=="string";t&&(e={textures:{},images:{}});const n={metadata:{version:4.5,type:"Material",generator:"Material.toJSON"}};n.uuid=this.uuid,n.type=this.type,this.name!==""&&(n.name=this.name),this.color&&this.color.isColor&&(n.color=this.color.getHex()),this.roughness!==void 0&&(n.roughness=this.roughness),this.metalness!==void 0&&(n.metalness=this.metalness),this.sheen!==void 0&&(n.sheen=this.sheen),this.sheenColor&&this.sheenColor.isColor&&(n.sheenColor=this.sheenColor.getHex()),this.sheenRoughness!==void 0&&(n.sheenRoughness=this.sheenRoughness),this.emissive&&this.emissive.isColor&&(n.emissive=this.emissive.getHex()),this.emissiveIntensity&&this.emissiveIntensity!==1&&(n.emissiveIntensity=this.emissiveIntensity),this.specular&&this.specular.isColor&&(n.specular=this.specular.getHex()),this.specularIntensity!==void 0&&(n.specularIntensity=this.specularIntensity),this.specularColor&&this.specularColor.isColor&&(n.specularColor=this.specularColor.getHex()),this.shininess!==void 0&&(n.shininess=this.shininess),this.clearcoat!==void 0&&(n.clearcoat=this.clearcoat),this.clearcoatRoughness!==void 0&&(n.clearcoatRoughness=this.clearcoatRoughness),this.clearcoatMap&&this.clearcoatMap.isTexture&&(n.clearcoatMap=this.clearcoatMap.toJSON(e).uuid),this.clearcoatRoughnessMap&&this.clearcoatRoughnessMap.isTexture&&(n.clearcoatRoughnessMap=this.clearcoatRoughnessMap.toJSON(e).uuid),this.clearcoatNormalMap&&this.clearcoatNormalMap.isTexture&&(n.clearcoatNormalMap=this.clearcoatNormalMap.toJSON(e).uuid,n.clearcoatNormalScale=this.clearcoatNormalScale.toArray()),this.iridescence!==void 0&&(n.iridescence=this.iridescence),this.iridescenceIOR!==void 0&&(n.iridescenceIOR=this.iridescenceIOR),this.iridescenceThicknessRange!==void 0&&(n.iridescenceThicknessRange=this.iridescenceThicknessRange),this.iridescenceMap&&this.iridescenceMap.isTexture&&(n.iridescenceMap=this.iridescenceMap.toJSON(e).uuid),this.iridescenceThicknessMap&&this.iridescenceThicknessMap.isTexture&&(n.iridescenceThicknessMap=this.iridescenceThicknessMap.toJSON(e).uuid),this.map&&this.map.isTexture&&(n.map=this.map.toJSON(e).uuid),this.matcap&&this.matcap.isTexture&&(n.matcap=this.matcap.toJSON(e).uuid),this.alphaMap&&this.alphaMap.isTexture&&(n.alphaMap=this.alphaMap.toJSON(e).uuid),this.lightMap&&this.lightMap.isTexture&&(n.lightMap=this.lightMap.toJSON(e).uuid,n.lightMapIntensity=this.lightMapIntensity),this.aoMap&&this.aoMap.isTexture&&(n.aoMap=this.aoMap.toJSON(e).uuid,n.aoMapIntensity=this.aoMapIntensity),this.bumpMap&&this.bumpMap.isTexture&&(n.bumpMap=this.bumpMap.toJSON(e).uuid,n.bumpScale=this.bumpScale),this.normalMap&&this.normalMap.isTexture&&(n.normalMap=this.normalMap.toJSON(e).uuid,n.normalMapType=this.normalMapType,n.normalScale=this.normalScale.toArray()),this.displacementMap&&this.displacementMap.isTexture&&(n.displacementMap=this.displacementMap.toJSON(e).uuid,n.displacementScale=this.displacementScale,n.displacementBias=this.displacementBias),this.roughnessMap&&this.roughnessMap.isTexture&&(n.roughnessMap=this.roughnessMap.toJSON(e).uuid),this.metalnessMap&&this.metalnessMap.isTexture&&(n.metalnessMap=this.metalnessMap.toJSON(e).uuid),this.emissiveMap&&this.emissiveMap.isTexture&&(n.emissiveMap=this.emissiveMap.toJSON(e).uuid),this.specularMap&&this.specularMap.isTexture&&(n.specularMap=this.specularMap.toJSON(e).uuid),this.specularIntensityMap&&this.specularIntensityMap.isTexture&&(n.specularIntensityMap=this.specularIntensityMap.toJSON(e).uuid),this.specularColorMap&&this.specularColorMap.isTexture&&(n.specularColorMap=this.specularColorMap.toJSON(e).uuid),this.envMap&&this.envMap.isTexture&&(n.envMap=this.envMap.toJSON(e).uuid,this.combine!==void 0&&(n.combine=this.combine)),this.envMapIntensity!==void 0&&(n.envMapIntensity=this.envMapIntensity),this.reflectivity!==void 0&&(n.reflectivity=this.reflectivity),this.refractionRatio!==void 0&&(n.refractionRatio=this.refractionRatio),this.gradientMap&&this.gradientMap.isTexture&&(n.gradientMap=this.gradientMap.toJSON(e).uuid),this.transmission!==void 0&&(n.transmission=this.transmission),this.transmissionMap&&this.transmissionMap.isTexture&&(n.transmissionMap=this.transmissionMap.toJSON(e).uuid),this.thickness!==void 0&&(n.thickness=this.thickness),this.thicknessMap&&this.thicknessMap.isTexture&&(n.thicknessMap=this.thicknessMap.toJSON(e).uuid),this.attenuationDistance!==void 0&&this.attenuationDistance!==1/0&&(n.attenuationDistance=this.attenuationDistance),this.attenuationColor!==void 0&&(n.attenuationColor=this.attenuationColor.getHex()),this.size!==void 0&&(n.size=this.size),this.shadowSide!==null&&(n.shadowSide=this.shadowSide),this.sizeAttenuation!==void 0&&(n.sizeAttenuation=this.sizeAttenuation),this.blending!==is&&(n.blending=this.blending),this.side!==ci&&(n.side=this.side),this.vertexColors&&(n.vertexColors=!0),this.opacity<1&&(n.opacity=this.opacity),this.transparent===!0&&(n.transparent=this.transparent),n.depthFunc=this.depthFunc,n.depthTest=this.depthTest,n.depthWrite=this.depthWrite,n.colorWrite=this.colorWrite,n.stencilWrite=this.stencilWrite,n.stencilWriteMask=this.stencilWriteMask,n.stencilFunc=this.stencilFunc,n.stencilRef=this.stencilRef,n.stencilFuncMask=this.stencilFuncMask,n.stencilFail=this.stencilFail,n.stencilZFail=this.stencilZFail,n.stencilZPass=this.stencilZPass,this.rotation!==void 0&&this.rotation!==0&&(n.rotation=this.rotation),this.polygonOffset===!0&&(n.polygonOffset=!0),this.polygonOffsetFactor!==0&&(n.polygonOffsetFactor=this.polygonOffsetFactor),this.polygonOffsetUnits!==0&&(n.polygonOffsetUnits=this.polygonOffsetUnits),this.linewidth!==void 0&&this.linewidth!==1&&(n.linewidth=this.linewidth),this.dashSize!==void 0&&(n.dashSize=this.dashSize),this.gapSize!==void 0&&(n.gapSize=this.gapSize),this.scale!==void 0&&(n.scale=this.scale),this.dithering===!0&&(n.dithering=!0),this.alphaTest>0&&(n.alphaTest=this.alphaTest),this.alphaToCoverage===!0&&(n.alphaToCoverage=this.alphaToCoverage),this.premultipliedAlpha===!0&&(n.premultipliedAlpha=this.premultipliedAlpha),this.forceSinglePass===!0&&(n.forceSinglePass=this.forceSinglePass),this.wireframe===!0&&(n.wireframe=this.wireframe),this.wireframeLinewidth>1&&(n.wireframeLinewidth=this.wireframeLinewidth),this.wireframeLinecap!=="round"&&(n.wireframeLinecap=this.wireframeLinecap),this.wireframeLinejoin!=="round"&&(n.wireframeLinejoin=this.wireframeLinejoin),this.flatShading===!0&&(n.flatShading=this.flatShading),this.visible===!1&&(n.visible=!1),this.toneMapped===!1&&(n.toneMapped=!1),this.fog===!1&&(n.fog=!1),Object.keys(this.userData).length>0&&(n.userData=this.userData);function s(r){const o=[];for(const a in r){const l=r[a];delete l.metadata,o.push(l)}return o}if(t){const r=s(e.textures),o=s(e.images);r.length>0&&(n.textures=r),o.length>0&&(n.images=o)}return n}clone(){return new this.constructor().copy(this)}copy(e){this.name=e.name,this.blending=e.blending,this.side=e.side,this.vertexColors=e.vertexColors,this.opacity=e.opacity,this.transparent=e.transparent,this.blendSrc=e.blendSrc,this.blendDst=e.blendDst,this.blendEquation=e.blendEquation,this.blendSrcAlpha=e.blendSrcAlpha,this.blendDstAlpha=e.blendDstAlpha,this.blendEquationAlpha=e.blendEquationAlpha,this.depthFunc=e.depthFunc,this.depthTest=e.depthTest,this.depthWrite=e.depthWrite,this.stencilWriteMask=e.stencilWriteMask,this.stencilFunc=e.stencilFunc,this.stencilRef=e.stencilRef,this.stencilFuncMask=e.stencilFuncMask,this.stencilFail=e.stencilFail,this.stencilZFail=e.stencilZFail,this.stencilZPass=e.stencilZPass,this.stencilWrite=e.stencilWrite;const t=e.clippingPlanes;let n=null;if(t!==null){const s=t.length;n=new Array(s);for(let r=0;r!==s;++r)n[r]=t[r].clone()}return this.clippingPlanes=n,this.clipIntersection=e.clipIntersection,this.clipShadows=e.clipShadows,this.shadowSide=e.shadowSide,this.colorWrite=e.colorWrite,this.precision=e.precision,this.polygonOffset=e.polygonOffset,this.polygonOffsetFactor=e.polygonOffsetFactor,this.polygonOffsetUnits=e.polygonOffsetUnits,this.dithering=e.dithering,this.alphaTest=e.alphaTest,this.alphaToCoverage=e.alphaToCoverage,this.premultipliedAlpha=e.premultipliedAlpha,this.forceSinglePass=e.forceSinglePass,this.visible=e.visible,this.toneMapped=e.toneMapped,this.userData=JSON.parse(JSON.stringify(e.userData)),this}dispose(){this.dispatchEvent({type:"dispose"})}set needsUpdate(e){e===!0&&this.version++}}const gu={aliceblue:15792383,antiquewhite:16444375,aqua:65535,aquamarine:8388564,azure:15794175,beige:16119260,bisque:16770244,black:0,blanchedalmond:16772045,blue:255,blueviolet:9055202,brown:10824234,burlywood:14596231,cadetblue:6266528,chartreuse:8388352,chocolate:13789470,coral:16744272,cornflowerblue:6591981,cornsilk:16775388,crimson:14423100,cyan:65535,darkblue:139,darkcyan:35723,darkgoldenrod:12092939,darkgray:11119017,darkgreen:25600,darkgrey:11119017,darkkhaki:12433259,darkmagenta:9109643,darkolivegreen:5597999,darkorange:16747520,darkorchid:10040012,darkred:9109504,darksalmon:15308410,darkseagreen:9419919,darkslateblue:4734347,darkslategray:3100495,darkslategrey:3100495,darkturquoise:52945,darkviolet:9699539,deeppink:16716947,deepskyblue:49151,dimgray:6908265,dimgrey:6908265,dodgerblue:2003199,firebrick:11674146,floralwhite:16775920,forestgreen:2263842,fuchsia:16711935,gainsboro:14474460,ghostwhite:16316671,gold:16766720,goldenrod:14329120,gray:8421504,green:32768,greenyellow:11403055,grey:8421504,honeydew:15794160,hotpink:16738740,indianred:13458524,indigo:4915330,ivory:16777200,khaki:15787660,lavender:15132410,lavenderblush:16773365,lawngreen:8190976,lemonchiffon:16775885,lightblue:11393254,lightcoral:15761536,lightcyan:14745599,lightgoldenrodyellow:16448210,lightgray:13882323,lightgreen:9498256,lightgrey:13882323,lightpink:16758465,lightsalmon:16752762,lightseagreen:2142890,lightskyblue:8900346,lightslategray:7833753,lightslategrey:7833753,lightsteelblue:11584734,lightyellow:16777184,lime:65280,limegreen:3329330,linen:16445670,magenta:16711935,maroon:8388608,mediumaquamarine:6737322,mediumblue:205,mediumorchid:12211667,mediumpurple:9662683,mediumseagreen:3978097,mediumslateblue:8087790,mediumspringgreen:64154,mediumturquoise:4772300,mediumvioletred:13047173,midnightblue:1644912,mintcream:16121850,mistyrose:16770273,moccasin:16770229,navajowhite:16768685,navy:128,oldlace:16643558,olive:8421376,olivedrab:7048739,orange:16753920,orangered:16729344,orchid:14315734,palegoldenrod:15657130,palegreen:10025880,paleturquoise:11529966,palevioletred:14381203,papayawhip:16773077,peachpuff:16767673,peru:13468991,pink:16761035,plum:14524637,powderblue:11591910,purple:8388736,rebeccapurple:6697881,red:16711680,rosybrown:12357519,royalblue:4286945,saddlebrown:9127187,salmon:16416882,sandybrown:16032864,seagreen:3050327,seashell:16774638,sienna:10506797,silver:12632256,skyblue:8900331,slateblue:6970061,slategray:7372944,slategrey:7372944,snow:16775930,springgreen:65407,steelblue:4620980,tan:13808780,teal:32896,thistle:14204888,tomato:16737095,turquoise:4251856,violet:15631086,wheat:16113331,white:16777215,whitesmoke:16119285,yellow:16776960,yellowgreen:10145074},wn={h:0,s:0,l:0},er={h:0,s:0,l:0};function po(i,e,t){return t<0&&(t+=1),t>1&&(t-=1),t<1/6?i+(e-i)*6*t:t<1/2?e:t<2/3?i+(e-i)*6*(2/3-t):i}class ut{constructor(e,t,n){return this.isColor=!0,this.r=1,this.g=1,this.b=1,t===void 0&&n===void 0?this.set(e):this.setRGB(e,t,n)}set(e){return e&&e.isColor?this.copy(e):typeof e=="number"?this.setHex(e):typeof e=="string"&&this.setStyle(e),this}setScalar(e){return this.r=e,this.g=e,this.b=e,this}setHex(e,t=In){return e=Math.floor(e),this.r=(e>>16&255)/255,this.g=(e>>8&255)/255,this.b=(e&255)/255,pn.toWorkingColorSpace(this,t),this}setRGB(e,t,n,s=pn.workingColorSpace){return this.r=e,this.g=t,this.b=n,pn.toWorkingColorSpace(this,s),this}setHSL(e,t,n,s=pn.workingColorSpace){if(e=jo(e,1),t=tn(t,0,1),n=tn(n,0,1),t===0)this.r=this.g=this.b=n;else{const r=n<=.5?n*(1+t):n+t-n*t,o=2*n-r;this.r=po(o,r,e+1/3),this.g=po(o,r,e),this.b=po(o,r,e-1/3)}return pn.toWorkingColorSpace(this,s),this}setStyle(e,t=In){function n(r){r!==void 0&&parseFloat(r)<1&&console.warn("THREE.Color: Alpha component of "+e+" will be ignored.")}let s;if(s=/^(\w+)\(([^\)]*)\)/.exec(e)){let r;const o=s[1],a=s[2];switch(o){case"rgb":case"rgba":if(r=/^\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*(?:,\s*(\d*\.?\d+)\s*)?$/.exec(a))return this.r=Math.min(255,parseInt(r[1],10))/255,this.g=Math.min(255,parseInt(r[2],10))/255,this.b=Math.min(255,parseInt(r[3],10))/255,pn.toWorkingColorSpace(this,t),n(r[4]),this;if(r=/^\s*(\d+)\%\s*,\s*(\d+)\%\s*,\s*(\d+)\%\s*(?:,\s*(\d*\.?\d+)\s*)?$/.exec(a))return this.r=Math.min(100,parseInt(r[1],10))/100,this.g=Math.min(100,parseInt(r[2],10))/100,this.b=Math.min(100,parseInt(r[3],10))/100,pn.toWorkingColorSpace(this,t),n(r[4]),this;break;case"hsl":case"hsla":if(r=/^\s*(\d*\.?\d+)\s*,\s*(\d*\.?\d+)\%\s*,\s*(\d*\.?\d+)\%\s*(?:,\s*(\d*\.?\d+)\s*)?$/.exec(a)){const l=parseFloat(r[1])/360,c=parseFloat(r[2])/100,f=parseFloat(r[3])/100;return n(r[4]),this.setHSL(l,c,f,t)}break;default:console.warn("THREE.Color: Unknown color model "+e)}}else if(s=/^\#([A-Fa-f\d]+)$/.exec(e)){const r=s[1],o=r.length;if(o===3)return this.setRGB(parseInt(r.charAt(0),16)/15,parseInt(r.charAt(1),16)/15,parseInt(r.charAt(2),16)/15,t);if(o===6)return this.setHex(parseInt(r,16),t);console.warn("THREE.Color: Invalid hex color "+e)}else if(e&&e.length>0)return this.setColorName(e,t);return this}setColorName(e,t=In){const n=gu[e.toLowerCase()];return n!==void 0?this.setHex(n,t):console.warn("THREE.Color: Unknown color "+e),this}clone(){return new this.constructor(this.r,this.g,this.b)}copy(e){return this.r=e.r,this.g=e.g,this.b=e.b,this}copySRGBToLinear(e){return this.r=rs(e.r),this.g=rs(e.g),this.b=rs(e.b),this}copyLinearToSRGB(e){return this.r=to(e.r),this.g=to(e.g),this.b=to(e.b),this}convertSRGBToLinear(){return this.copySRGBToLinear(this),this}convertLinearToSRGB(){return this.copyLinearToSRGB(this),this}getHex(e=In){return pn.fromWorkingColorSpace(Zt.copy(this),e),tn(Zt.r*255,0,255)<<16^tn(Zt.g*255,0,255)<<8^tn(Zt.b*255,0,255)<<0}getHexString(e=In){return("000000"+this.getHex(e).toString(16)).slice(-6)}getHSL(e,t=pn.workingColorSpace){pn.fromWorkingColorSpace(Zt.copy(this),t);const n=Zt.r,s=Zt.g,r=Zt.b,o=Math.max(n,s,r),a=Math.min(n,s,r);let l,c;const f=(a+o)/2;if(a===o)l=0,c=0;else{const h=o-a;switch(c=f<=.5?h/(o+a):h/(2-o-a),o){case n:l=(s-r)/h+(s<r?6:0);break;case s:l=(r-n)/h+2;break;case r:l=(n-s)/h+4;break}l/=6}return e.h=l,e.s=c,e.l=f,e}getRGB(e,t=pn.workingColorSpace){return pn.fromWorkingColorSpace(Zt.copy(this),t),e.r=Zt.r,e.g=Zt.g,e.b=Zt.b,e}getStyle(e=In){pn.fromWorkingColorSpace(Zt.copy(this),e);const t=Zt.r,n=Zt.g,s=Zt.b;return e!==In?`color(${e} ${t.toFixed(3)} ${n.toFixed(3)} ${s.toFixed(3)})`:`rgb(${t*255|0},${n*255|0},${s*255|0})`}offsetHSL(e,t,n){return this.getHSL(wn),wn.h+=e,wn.s+=t,wn.l+=n,this.setHSL(wn.h,wn.s,wn.l),this}add(e){return this.r+=e.r,this.g+=e.g,this.b+=e.b,this}addColors(e,t){return this.r=e.r+t.r,this.g=e.g+t.g,this.b=e.b+t.b,this}addScalar(e){return this.r+=e,this.g+=e,this.b+=e,this}sub(e){return this.r=Math.max(0,this.r-e.r),this.g=Math.max(0,this.g-e.g),this.b=Math.max(0,this.b-e.b),this}multiply(e){return this.r*=e.r,this.g*=e.g,this.b*=e.b,this}multiplyScalar(e){return this.r*=e,this.g*=e,this.b*=e,this}lerp(e,t){return this.r+=(e.r-this.r)*t,this.g+=(e.g-this.g)*t,this.b+=(e.b-this.b)*t,this}lerpColors(e,t,n){return this.r=e.r+(t.r-e.r)*n,this.g=e.g+(t.g-e.g)*n,this.b=e.b+(t.b-e.b)*n,this}lerpHSL(e,t){this.getHSL(wn),e.getHSL(er);const n=Us(wn.h,er.h,t),s=Us(wn.s,er.s,t),r=Us(wn.l,er.l,t);return this.setHSL(n,s,r),this}setFromVector3(e){return this.r=e.x,this.g=e.y,this.b=e.z,this}applyMatrix3(e){const t=this.r,n=this.g,s=this.b,r=e.elements;return this.r=r[0]*t+r[3]*n+r[6]*s,this.g=r[1]*t+r[4]*n+r[7]*s,this.b=r[2]*t+r[5]*n+r[8]*s,this}equals(e){return e.r===this.r&&e.g===this.g&&e.b===this.b}fromArray(e,t=0){return this.r=e[t],this.g=e[t+1],this.b=e[t+2],this}toArray(e=[],t=0){return e[t]=this.r,e[t+1]=this.g,e[t+2]=this.b,e}fromBufferAttribute(e,t){return this.r=e.getX(t),this.g=e.getY(t),this.b=e.getZ(t),this}toJSON(){return this.getHex()}*[Symbol.iterator](){yield this.r,yield this.g,yield this.b}}const Zt=new ut;ut.NAMES=gu;class Ir extends ms{constructor(e){super(),this.isMeshBasicMaterial=!0,this.type="MeshBasicMaterial",this.color=new ut(16777215),this.map=null,this.lightMap=null,this.lightMapIntensity=1,this.aoMap=null,this.aoMapIntensity=1,this.specularMap=null,this.alphaMap=null,this.envMap=null,this.combine=ru,this.reflectivity=1,this.refractionRatio=.98,this.wireframe=!1,this.wireframeLinewidth=1,this.wireframeLinecap="round",this.wireframeLinejoin="round",this.fog=!0,this.setValues(e)}copy(e){return super.copy(e),this.color.copy(e.color),this.map=e.map,this.lightMap=e.lightMap,this.lightMapIntensity=e.lightMapIntensity,this.aoMap=e.aoMap,this.aoMapIntensity=e.aoMapIntensity,this.specularMap=e.specularMap,this.alphaMap=e.alphaMap,this.envMap=e.envMap,this.combine=e.combine,this.reflectivity=e.reflectivity,this.refractionRatio=e.refractionRatio,this.wireframe=e.wireframe,this.wireframeLinewidth=e.wireframeLinewidth,this.wireframeLinecap=e.wireframeLinecap,this.wireframeLinejoin=e.wireframeLinejoin,this.fog=e.fog,this}}const Rt=new G,tr=new st;class On{constructor(e,t,n=!1){if(Array.isArray(e))throw new TypeError("THREE.BufferAttribute: array should be a Typed Array.");this.isBufferAttribute=!0,this.name="",this.array=e,this.itemSize=t,this.count=e!==void 0?e.length/t:0,this.normalized=n,this.usage=Fa,this.updateRange={offset:0,count:-1},this.version=0}onUploadCallback(){}set needsUpdate(e){e===!0&&this.version++}setUsage(e){return this.usage=e,this}copy(e){return this.name=e.name,this.array=new e.array.constructor(e.array),this.itemSize=e.itemSize,this.count=e.count,this.normalized=e.normalized,this.usage=e.usage,this}copyAt(e,t,n){e*=this.itemSize,n*=t.itemSize;for(let s=0,r=this.itemSize;s<r;s++)this.array[e+s]=t.array[n+s];return this}copyArray(e){return this.array.set(e),this}applyMatrix3(e){if(this.itemSize===2)for(let t=0,n=this.count;t<n;t++)tr.fromBufferAttribute(this,t),tr.applyMatrix3(e),this.setXY(t,tr.x,tr.y);else if(this.itemSize===3)for(let t=0,n=this.count;t<n;t++)Rt.fromBufferAttribute(this,t),Rt.applyMatrix3(e),this.setXYZ(t,Rt.x,Rt.y,Rt.z);return this}applyMatrix4(e){for(let t=0,n=this.count;t<n;t++)Rt.fromBufferAttribute(this,t),Rt.applyMatrix4(e),this.setXYZ(t,Rt.x,Rt.y,Rt.z);return this}applyNormalMatrix(e){for(let t=0,n=this.count;t<n;t++)Rt.fromBufferAttribute(this,t),Rt.applyNormalMatrix(e),this.setXYZ(t,Rt.x,Rt.y,Rt.z);return this}transformDirection(e){for(let t=0,n=this.count;t<n;t++)Rt.fromBufferAttribute(this,t),Rt.transformDirection(e),this.setXYZ(t,Rt.x,Rt.y,Rt.z);return this}set(e,t=0){return this.array.set(e,t),this}getX(e){let t=this.array[e*this.itemSize];return this.normalized&&(t=As(t,this.array)),t}setX(e,t){return this.normalized&&(t=on(t,this.array)),this.array[e*this.itemSize]=t,this}getY(e){let t=this.array[e*this.itemSize+1];return this.normalized&&(t=As(t,this.array)),t}setY(e,t){return this.normalized&&(t=on(t,this.array)),this.array[e*this.itemSize+1]=t,this}getZ(e){let t=this.array[e*this.itemSize+2];return this.normalized&&(t=As(t,this.array)),t}setZ(e,t){return this.normalized&&(t=on(t,this.array)),this.array[e*this.itemSize+2]=t,this}getW(e){let t=this.array[e*this.itemSize+3];return this.normalized&&(t=As(t,this.array)),t}setW(e,t){return this.normalized&&(t=on(t,this.array)),this.array[e*this.itemSize+3]=t,this}setXY(e,t,n){return e*=this.itemSize,this.normalized&&(t=on(t,this.array),n=on(n,this.array)),this.array[e+0]=t,this.array[e+1]=n,this}setXYZ(e,t,n,s){return e*=this.itemSize,this.normalized&&(t=on(t,this.array),n=on(n,this.array),s=on(s,this.array)),this.array[e+0]=t,this.array[e+1]=n,this.array[e+2]=s,this}setXYZW(e,t,n,s,r){return e*=this.itemSize,this.normalized&&(t=on(t,this.array),n=on(n,this.array),s=on(s,this.array),r=on(r,this.array)),this.array[e+0]=t,this.array[e+1]=n,this.array[e+2]=s,this.array[e+3]=r,this}onUpload(e){return this.onUploadCallback=e,this}clone(){return new this.constructor(this.array,this.itemSize).copy(this)}toJSON(){const e={itemSize:this.itemSize,type:this.array.constructor.name,array:Array.from(this.array),normalized:this.normalized};return this.name!==""&&(e.name=this.name),this.usage!==Fa&&(e.usage=this.usage),(this.updateRange.offset!==0||this.updateRange.count!==-1)&&(e.updateRange=this.updateRange),e}copyColorsArray(){console.error("THREE.BufferAttribute: copyColorsArray() was removed in r144.")}copyVector2sArray(){console.error("THREE.BufferAttribute: copyVector2sArray() was removed in r144.")}copyVector3sArray(){console.error("THREE.BufferAttribute: copyVector3sArray() was removed in r144.")}copyVector4sArray(){console.error("THREE.BufferAttribute: copyVector4sArray() was removed in r144.")}}class _u extends On{constructor(e,t,n){super(new Uint16Array(e),t,n)}}class vu extends On{constructor(e,t,n){super(new Uint32Array(e),t,n)}}class Et extends On{constructor(e,t,n){super(new Float32Array(e),t,n)}}let Zh=0;const bn=new Ct,mo=new Ut,Wi=new G,gn=new Ws,ys=new Ws,Ot=new G;class sn extends ds{constructor(){super(),this.isBufferGeometry=!0,Object.defineProperty(this,"id",{value:Zh++}),this.uuid=ps(),this.name="",this.type="BufferGeometry",this.index=null,this.attributes={},this.morphAttributes={},this.morphTargetsRelative=!1,this.groups=[],this.boundingBox=null,this.boundingSphere=null,this.drawRange={start:0,count:1/0},this.userData={}}getIndex(){return this.index}setIndex(e){return Array.isArray(e)?this.index=new(hu(e)?vu:_u)(e,1):this.index=e,this}getAttribute(e){return this.attributes[e]}setAttribute(e,t){return this.attributes[e]=t,this}deleteAttribute(e){return delete this.attributes[e],this}hasAttribute(e){return this.attributes[e]!==void 0}addGroup(e,t,n=0){this.groups.push({start:e,count:t,materialIndex:n})}clearGroups(){this.groups=[]}setDrawRange(e,t){this.drawRange.start=e,this.drawRange.count=t}applyMatrix4(e){const t=this.attributes.position;t!==void 0&&(t.applyMatrix4(e),t.needsUpdate=!0);const n=this.attributes.normal;if(n!==void 0){const r=new et().getNormalMatrix(e);n.applyNormalMatrix(r),n.needsUpdate=!0}const s=this.attributes.tangent;return s!==void 0&&(s.transformDirection(e),s.needsUpdate=!0),this.boundingBox!==null&&this.computeBoundingBox(),this.boundingSphere!==null&&this.computeBoundingSphere(),this}applyQuaternion(e){return bn.makeRotationFromQuaternion(e),this.applyMatrix4(bn),this}rotateX(e){return bn.makeRotationX(e),this.applyMatrix4(bn),this}rotateY(e){return bn.makeRotationY(e),this.applyMatrix4(bn),this}rotateZ(e){return bn.makeRotationZ(e),this.applyMatrix4(bn),this}translate(e,t,n){return bn.makeTranslation(e,t,n),this.applyMatrix4(bn),this}scale(e,t,n){return bn.makeScale(e,t,n),this.applyMatrix4(bn),this}lookAt(e){return mo.lookAt(e),mo.updateMatrix(),this.applyMatrix4(mo.matrix),this}center(){return this.computeBoundingBox(),this.boundingBox.getCenter(Wi).negate(),this.translate(Wi.x,Wi.y,Wi.z),this}setFromPoints(e){const t=[];for(let n=0,s=e.length;n<s;n++){const r=e[n];t.push(r.x,r.y,r.z||0)}return this.setAttribute("position",new Et(t,3)),this}computeBoundingBox(){this.boundingBox===null&&(this.boundingBox=new Ws);const e=this.attributes.position,t=this.morphAttributes.position;if(e&&e.isGLBufferAttribute){console.error('THREE.BufferGeometry.computeBoundingBox(): GLBufferAttribute requires a manual bounding box. Alternatively set "mesh.frustumCulled" to "false".',this),this.boundingBox.set(new G(-1/0,-1/0,-1/0),new G(1/0,1/0,1/0));return}if(e!==void 0){if(this.boundingBox.setFromBufferAttribute(e),t)for(let n=0,s=t.length;n<s;n++){const r=t[n];gn.setFromBufferAttribute(r),this.morphTargetsRelative?(Ot.addVectors(this.boundingBox.min,gn.min),this.boundingBox.expandByPoint(Ot),Ot.addVectors(this.boundingBox.max,gn.max),this.boundingBox.expandByPoint(Ot)):(this.boundingBox.expandByPoint(gn.min),this.boundingBox.expandByPoint(gn.max))}}else this.boundingBox.makeEmpty();(isNaN(this.boundingBox.min.x)||isNaN(this.boundingBox.min.y)||isNaN(this.boundingBox.min.z))&&console.error('THREE.BufferGeometry.computeBoundingBox(): Computed min/max have NaN values. The "position" attribute is likely to have NaN values.',this)}computeBoundingSphere(){this.boundingSphere===null&&(this.boundingSphere=new Dr);const e=this.attributes.position,t=this.morphAttributes.position;if(e&&e.isGLBufferAttribute){console.error('THREE.BufferGeometry.computeBoundingSphere(): GLBufferAttribute requires a manual bounding sphere. Alternatively set "mesh.frustumCulled" to "false".',this),this.boundingSphere.set(new G,1/0);return}if(e){const n=this.boundingSphere.center;if(gn.setFromBufferAttribute(e),t)for(let r=0,o=t.length;r<o;r++){const a=t[r];ys.setFromBufferAttribute(a),this.morphTargetsRelative?(Ot.addVectors(gn.min,ys.min),gn.expandByPoint(Ot),Ot.addVectors(gn.max,ys.max),gn.expandByPoint(Ot)):(gn.expandByPoint(ys.min),gn.expandByPoint(ys.max))}gn.getCenter(n);let s=0;for(let r=0,o=e.count;r<o;r++)Ot.fromBufferAttribute(e,r),s=Math.max(s,n.distanceToSquared(Ot));if(t)for(let r=0,o=t.length;r<o;r++){const a=t[r],l=this.morphTargetsRelative;for(let c=0,f=a.count;c<f;c++)Ot.fromBufferAttribute(a,c),l&&(Wi.fromBufferAttribute(e,c),Ot.add(Wi)),s=Math.max(s,n.distanceToSquared(Ot))}this.boundingSphere.radius=Math.sqrt(s),isNaN(this.boundingSphere.radius)&&console.error('THREE.BufferGeometry.computeBoundingSphere(): Computed radius is NaN. The "position" attribute is likely to have NaN values.',this)}}computeTangents(){const e=this.index,t=this.attributes;if(e===null||t.position===void 0||t.normal===void 0||t.uv===void 0){console.error("THREE.BufferGeometry: .computeTangents() failed. Missing required attributes (index, position, normal or uv)");return}const n=e.array,s=t.position.array,r=t.normal.array,o=t.uv.array,a=s.length/3;this.hasAttribute("tangent")===!1&&this.setAttribute("tangent",new On(new Float32Array(4*a),4));const l=this.getAttribute("tangent").array,c=[],f=[];for(let S=0;S<a;S++)c[S]=new G,f[S]=new G;const h=new G,u=new G,p=new G,g=new st,v=new st,m=new st,d=new G,M=new G;function b(S,B,k){h.fromArray(s,S*3),u.fromArray(s,B*3),p.fromArray(s,k*3),g.fromArray(o,S*2),v.fromArray(o,B*2),m.fromArray(o,k*2),u.sub(h),p.sub(h),v.sub(g),m.sub(g);const C=1/(v.x*m.y-m.x*v.y);!isFinite(C)||(d.copy(u).multiplyScalar(m.y).addScaledVector(p,-v.y).multiplyScalar(C),M.copy(p).multiplyScalar(v.x).addScaledVector(u,-m.x).multiplyScalar(C),c[S].add(d),c[B].add(d),c[k].add(d),f[S].add(M),f[B].add(M),f[k].add(M))}let x=this.groups;x.length===0&&(x=[{start:0,count:n.length}]);for(let S=0,B=x.length;S<B;++S){const k=x[S],C=k.start,U=k.count;for(let N=C,j=C+U;N<j;N+=3)b(n[N+0],n[N+1],n[N+2])}const y=new G,T=new G,L=new G,w=new G;function _(S){L.fromArray(r,S*3),w.copy(L);const B=c[S];y.copy(B),y.sub(L.multiplyScalar(L.dot(B))).normalize(),T.crossVectors(w,B);const C=T.dot(f[S])<0?-1:1;l[S*4]=y.x,l[S*4+1]=y.y,l[S*4+2]=y.z,l[S*4+3]=C}for(let S=0,B=x.length;S<B;++S){const k=x[S],C=k.start,U=k.count;for(let N=C,j=C+U;N<j;N+=3)_(n[N+0]),_(n[N+1]),_(n[N+2])}}computeVertexNormals(){const e=this.index,t=this.getAttribute("position");if(t!==void 0){let n=this.getAttribute("normal");if(n===void 0)n=new On(new Float32Array(t.count*3),3),this.setAttribute("normal",n);else for(let u=0,p=n.count;u<p;u++)n.setXYZ(u,0,0,0);const s=new G,r=new G,o=new G,a=new G,l=new G,c=new G,f=new G,h=new G;if(e)for(let u=0,p=e.count;u<p;u+=3){const g=e.getX(u+0),v=e.getX(u+1),m=e.getX(u+2);s.fromBufferAttribute(t,g),r.fromBufferAttribute(t,v),o.fromBufferAttribute(t,m),f.subVectors(o,r),h.subVectors(s,r),f.cross(h),a.fromBufferAttribute(n,g),l.fromBufferAttribute(n,v),c.fromBufferAttribute(n,m),a.add(f),l.add(f),c.add(f),n.setXYZ(g,a.x,a.y,a.z),n.setXYZ(v,l.x,l.y,l.z),n.setXYZ(m,c.x,c.y,c.z)}else for(let u=0,p=t.count;u<p;u+=3)s.fromBufferAttribute(t,u+0),r.fromBufferAttribute(t,u+1),o.fromBufferAttribute(t,u+2),f.subVectors(o,r),h.subVectors(s,r),f.cross(h),n.setXYZ(u+0,f.x,f.y,f.z),n.setXYZ(u+1,f.x,f.y,f.z),n.setXYZ(u+2,f.x,f.y,f.z);this.normalizeNormals(),n.needsUpdate=!0}}merge(){return console.error("THREE.BufferGeometry.merge() has been removed. Use THREE.BufferGeometryUtils.mergeGeometries() instead."),this}normalizeNormals(){const e=this.attributes.normal;for(let t=0,n=e.count;t<n;t++)Ot.fromBufferAttribute(e,t),Ot.normalize(),e.setXYZ(t,Ot.x,Ot.y,Ot.z)}toNonIndexed(){function e(a,l){const c=a.array,f=a.itemSize,h=a.normalized,u=new c.constructor(l.length*f);let p=0,g=0;for(let v=0,m=l.length;v<m;v++){a.isInterleavedBufferAttribute?p=l[v]*a.data.stride+a.offset:p=l[v]*f;for(let d=0;d<f;d++)u[g++]=c[p++]}return new On(u,f,h)}if(this.index===null)return console.warn("THREE.BufferGeometry.toNonIndexed(): BufferGeometry is already non-indexed."),this;const t=new sn,n=this.index.array,s=this.attributes;for(const a in s){const l=s[a],c=e(l,n);t.setAttribute(a,c)}const r=this.morphAttributes;for(const a in r){const l=[],c=r[a];for(let f=0,h=c.length;f<h;f++){const u=c[f],p=e(u,n);l.push(p)}t.morphAttributes[a]=l}t.morphTargetsRelative=this.morphTargetsRelative;const o=this.groups;for(let a=0,l=o.length;a<l;a++){const c=o[a];t.addGroup(c.start,c.count,c.materialIndex)}return t}toJSON(){const e={metadata:{version:4.5,type:"BufferGeometry",generator:"BufferGeometry.toJSON"}};if(e.uuid=this.uuid,e.type=this.type,this.name!==""&&(e.name=this.name),Object.keys(this.userData).length>0&&(e.userData=this.userData),this.parameters!==void 0){const l=this.parameters;for(const c in l)l[c]!==void 0&&(e[c]=l[c]);return e}e.data={attributes:{}};const t=this.index;t!==null&&(e.data.index={type:t.array.constructor.name,array:Array.prototype.slice.call(t.array)});const n=this.attributes;for(const l in n){const c=n[l];e.data.attributes[l]=c.toJSON(e.data)}const s={};let r=!1;for(const l in this.morphAttributes){const c=this.morphAttributes[l],f=[];for(let h=0,u=c.length;h<u;h++){const p=c[h];f.push(p.toJSON(e.data))}f.length>0&&(s[l]=f,r=!0)}r&&(e.data.morphAttributes=s,e.data.morphTargetsRelative=this.morphTargetsRelative);const o=this.groups;o.length>0&&(e.data.groups=JSON.parse(JSON.stringify(o)));const a=this.boundingSphere;return a!==null&&(e.data.boundingSphere={center:a.center.toArray(),radius:a.radius}),e}clone(){return new this.constructor().copy(this)}copy(e){this.index=null,this.attributes={},this.morphAttributes={},this.groups=[],this.boundingBox=null,this.boundingSphere=null;const t={};this.name=e.name;const n=e.index;n!==null&&this.setIndex(n.clone(t));const s=e.attributes;for(const c in s){const f=s[c];this.setAttribute(c,f.clone(t))}const r=e.morphAttributes;for(const c in r){const f=[],h=r[c];for(let u=0,p=h.length;u<p;u++)f.push(h[u].clone(t));this.morphAttributes[c]=f}this.morphTargetsRelative=e.morphTargetsRelative;const o=e.groups;for(let c=0,f=o.length;c<f;c++){const h=o[c];this.addGroup(h.start,h.count,h.materialIndex)}const a=e.boundingBox;a!==null&&(this.boundingBox=a.clone());const l=e.boundingSphere;return l!==null&&(this.boundingSphere=l.clone()),this.drawRange.start=e.drawRange.start,this.drawRange.count=e.drawRange.count,this.userData=e.userData,this}dispose(){this.dispatchEvent({type:"dispose"})}}const Qa=new Ct,Rn=new Xo,nr=new Dr,Ja=new G,ji=new G,Xi=new G,qi=new G,go=new G,ir=new G,sr=new st,rr=new st,or=new st,$a=new G,el=new G,tl=new G,ar=new G,lr=new G;class Ee extends Ut{constructor(e=new sn,t=new Ir){super(),this.isMesh=!0,this.type="Mesh",this.geometry=e,this.material=t,this.updateMorphTargets()}copy(e,t){return super.copy(e,t),e.morphTargetInfluences!==void 0&&(this.morphTargetInfluences=e.morphTargetInfluences.slice()),e.morphTargetDictionary!==void 0&&(this.morphTargetDictionary=Object.assign({},e.morphTargetDictionary)),this.material=e.material,this.geometry=e.geometry,this}updateMorphTargets(){const t=this.geometry.morphAttributes,n=Object.keys(t);if(n.length>0){const s=t[n[0]];if(s!==void 0){this.morphTargetInfluences=[],this.morphTargetDictionary={};for(let r=0,o=s.length;r<o;r++){const a=s[r].name||String(r);this.morphTargetInfluences.push(0),this.morphTargetDictionary[a]=r}}}}getVertexPosition(e,t){const n=this.geometry,s=n.attributes.position,r=n.morphAttributes.position,o=n.morphTargetsRelative;t.fromBufferAttribute(s,e);const a=this.morphTargetInfluences;if(r&&a){ir.set(0,0,0);for(let l=0,c=r.length;l<c;l++){const f=a[l],h=r[l];f!==0&&(go.fromBufferAttribute(h,e),o?ir.addScaledVector(go,f):ir.addScaledVector(go.sub(t),f))}t.add(ir)}return this.isSkinnedMesh&&this.applyBoneTransform(e,t),t}raycast(e,t){const n=this.geometry,s=this.material,r=this.matrixWorld;if(s===void 0||(n.boundingSphere===null&&n.computeBoundingSphere(),nr.copy(n.boundingSphere),nr.applyMatrix4(r),Rn.copy(e.ray).recast(e.near),nr.containsPoint(Rn.origin)===!1&&(Rn.intersectSphere(nr,Ja)===null||Rn.origin.distanceToSquared(Ja)>(e.far-e.near)**2))||(Qa.copy(r).invert(),Rn.copy(e.ray).applyMatrix4(Qa),n.boundingBox!==null&&Rn.intersectsBox(n.boundingBox)===!1))return;let o;const a=n.index,l=n.attributes.position,c=n.attributes.uv,f=n.attributes.uv2,h=n.attributes.normal,u=n.groups,p=n.drawRange;if(a!==null)if(Array.isArray(s))for(let g=0,v=u.length;g<v;g++){const m=u[g],d=s[m.materialIndex],M=Math.max(m.start,p.start),b=Math.min(a.count,Math.min(m.start+m.count,p.start+p.count));for(let x=M,y=b;x<y;x+=3){const T=a.getX(x),L=a.getX(x+1),w=a.getX(x+2);o=cr(this,d,e,Rn,c,f,h,T,L,w),o&&(o.faceIndex=Math.floor(x/3),o.face.materialIndex=m.materialIndex,t.push(o))}}else{const g=Math.max(0,p.start),v=Math.min(a.count,p.start+p.count);for(let m=g,d=v;m<d;m+=3){const M=a.getX(m),b=a.getX(m+1),x=a.getX(m+2);o=cr(this,s,e,Rn,c,f,h,M,b,x),o&&(o.faceIndex=Math.floor(m/3),t.push(o))}}else if(l!==void 0)if(Array.isArray(s))for(let g=0,v=u.length;g<v;g++){const m=u[g],d=s[m.materialIndex],M=Math.max(m.start,p.start),b=Math.min(l.count,Math.min(m.start+m.count,p.start+p.count));for(let x=M,y=b;x<y;x+=3){const T=x,L=x+1,w=x+2;o=cr(this,d,e,Rn,c,f,h,T,L,w),o&&(o.faceIndex=Math.floor(x/3),o.face.materialIndex=m.materialIndex,t.push(o))}}else{const g=Math.max(0,p.start),v=Math.min(l.count,p.start+p.count);for(let m=g,d=v;m<d;m+=3){const M=m,b=m+1,x=m+2;o=cr(this,s,e,Rn,c,f,h,M,b,x),o&&(o.faceIndex=Math.floor(m/3),t.push(o))}}}}function Kh(i,e,t,n,s,r,o,a){let l;if(e.side===un?l=n.intersectTriangle(o,r,s,!0,a):l=n.intersectTriangle(s,r,o,e.side===ci,a),l===null)return null;lr.copy(a),lr.applyMatrix4(i.matrixWorld);const c=t.ray.origin.distanceTo(lr);return c<t.near||c>t.far?null:{distance:c,point:lr.clone(),object:i}}function cr(i,e,t,n,s,r,o,a,l,c){i.getVertexPosition(a,ji),i.getVertexPosition(l,Xi),i.getVertexPosition(c,qi);const f=Kh(i,e,t,n,ji,Xi,qi,ar);if(f){s&&(sr.fromBufferAttribute(s,a),rr.fromBufferAttribute(s,l),or.fromBufferAttribute(s,c),f.uv=En.getInterpolation(ar,ji,Xi,qi,sr,rr,or,new st)),r&&(sr.fromBufferAttribute(r,a),rr.fromBufferAttribute(r,l),or.fromBufferAttribute(r,c),f.uv2=En.getInterpolation(ar,ji,Xi,qi,sr,rr,or,new st)),o&&($a.fromBufferAttribute(o,a),el.fromBufferAttribute(o,l),tl.fromBufferAttribute(o,c),f.normal=En.getInterpolation(ar,ji,Xi,qi,$a,el,tl,new G),f.normal.dot(n.direction)>0&&f.normal.multiplyScalar(-1));const h={a,b:l,c,normal:new G,materialIndex:0};En.getNormal(ji,Xi,qi,h.normal),f.face=h}return f}class At extends sn{constructor(e=1,t=1,n=1,s=1,r=1,o=1){super(),this.type="BoxGeometry",this.parameters={width:e,height:t,depth:n,widthSegments:s,heightSegments:r,depthSegments:o};const a=this;s=Math.floor(s),r=Math.floor(r),o=Math.floor(o);const l=[],c=[],f=[],h=[];let u=0,p=0;g("z","y","x",-1,-1,n,t,e,o,r,0),g("z","y","x",1,-1,n,t,-e,o,r,1),g("x","z","y",1,1,e,n,t,s,o,2),g("x","z","y",1,-1,e,n,-t,s,o,3),g("x","y","z",1,-1,e,t,n,s,r,4),g("x","y","z",-1,-1,e,t,-n,s,r,5),this.setIndex(l),this.setAttribute("position",new Et(c,3)),this.setAttribute("normal",new Et(f,3)),this.setAttribute("uv",new Et(h,2));function g(v,m,d,M,b,x,y,T,L,w,_){const S=x/L,B=y/w,k=x/2,C=y/2,U=T/2,N=L+1,j=w+1;let D=0,V=0;const W=new G;for(let Q=0;Q<j;Q++){const oe=Q*B-C;for(let ee=0;ee<N;ee++){const z=ee*S-k;W[v]=z*M,W[m]=oe*b,W[d]=U,c.push(W.x,W.y,W.z),W[v]=0,W[m]=0,W[d]=T>0?1:-1,f.push(W.x,W.y,W.z),h.push(ee/L),h.push(1-Q/w),D+=1}}for(let Q=0;Q<w;Q++)for(let oe=0;oe<L;oe++){const ee=u+oe+N*Q,z=u+oe+N*(Q+1),K=u+(oe+1)+N*(Q+1),pe=u+(oe+1)+N*Q;l.push(ee,z,pe),l.push(z,K,pe),V+=6}a.addGroup(p,V,_),p+=V,u+=D}}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new At(e.width,e.height,e.depth,e.widthSegments,e.heightSegments,e.depthSegments)}}function us(i){const e={};for(const t in i){e[t]={};for(const n in i[t]){const s=i[t][n];s&&(s.isColor||s.isMatrix3||s.isMatrix4||s.isVector2||s.isVector3||s.isVector4||s.isTexture||s.isQuaternion)?s.isRenderTargetTexture?(console.warn("UniformsUtils: Textures of render targets cannot be cloned via cloneUniforms() or mergeUniforms()."),e[t][n]=null):e[t][n]=s.clone():Array.isArray(s)?e[t][n]=s.slice():e[t][n]=s}}return e}function Jt(i){const e={};for(let t=0;t<i.length;t++){const n=us(i[t]);for(const s in n)e[s]=n[s]}return e}function Qh(i){const e=[];for(let t=0;t<i.length;t++)e.push(i[t].clone());return e}function bu(i){return i.getRenderTarget()===null&&i.outputEncoding===vt?In:Os}const Mu={clone:us,merge:Jt};var Jh=`void main() {
	gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );
}`,$h=`void main() {
	gl_FragColor = vec4( 1.0, 0.0, 0.0, 1.0 );
}`;class $n extends ms{constructor(e){super(),this.isShaderMaterial=!0,this.type="ShaderMaterial",this.defines={},this.uniforms={},this.uniformsGroups=[],this.vertexShader=Jh,this.fragmentShader=$h,this.linewidth=1,this.wireframe=!1,this.wireframeLinewidth=1,this.fog=!1,this.lights=!1,this.clipping=!1,this.forceSinglePass=!0,this.extensions={derivatives:!1,fragDepth:!1,drawBuffers:!1,shaderTextureLOD:!1},this.defaultAttributeValues={color:[1,1,1],uv:[0,0],uv2:[0,0]},this.index0AttributeName=void 0,this.uniformsNeedUpdate=!1,this.glslVersion=null,e!==void 0&&this.setValues(e)}copy(e){return super.copy(e),this.fragmentShader=e.fragmentShader,this.vertexShader=e.vertexShader,this.uniforms=us(e.uniforms),this.uniformsGroups=Qh(e.uniformsGroups),this.defines=Object.assign({},e.defines),this.wireframe=e.wireframe,this.wireframeLinewidth=e.wireframeLinewidth,this.fog=e.fog,this.lights=e.lights,this.clipping=e.clipping,this.extensions=Object.assign({},e.extensions),this.glslVersion=e.glslVersion,this}toJSON(e){const t=super.toJSON(e);t.glslVersion=this.glslVersion,t.uniforms={};for(const s in this.uniforms){const o=this.uniforms[s].value;o&&o.isTexture?t.uniforms[s]={type:"t",value:o.toJSON(e).uuid}:o&&o.isColor?t.uniforms[s]={type:"c",value:o.getHex()}:o&&o.isVector2?t.uniforms[s]={type:"v2",value:o.toArray()}:o&&o.isVector3?t.uniforms[s]={type:"v3",value:o.toArray()}:o&&o.isVector4?t.uniforms[s]={type:"v4",value:o.toArray()}:o&&o.isMatrix3?t.uniforms[s]={type:"m3",value:o.toArray()}:o&&o.isMatrix4?t.uniforms[s]={type:"m4",value:o.toArray()}:t.uniforms[s]={value:o}}Object.keys(this.defines).length>0&&(t.defines=this.defines),t.vertexShader=this.vertexShader,t.fragmentShader=this.fragmentShader;const n={};for(const s in this.extensions)this.extensions[s]===!0&&(n[s]=!0);return Object.keys(n).length>0&&(t.extensions=n),t}}class xu extends Ut{constructor(){super(),this.isCamera=!0,this.type="Camera",this.matrixWorldInverse=new Ct,this.projectionMatrix=new Ct,this.projectionMatrixInverse=new Ct}copy(e,t){return super.copy(e,t),this.matrixWorldInverse.copy(e.matrixWorldInverse),this.projectionMatrix.copy(e.projectionMatrix),this.projectionMatrixInverse.copy(e.projectionMatrixInverse),this}getWorldDirection(e){this.updateWorldMatrix(!0,!1);const t=this.matrixWorld.elements;return e.set(-t[8],-t[9],-t[10]).normalize()}updateMatrixWorld(e){super.updateMatrixWorld(e),this.matrixWorldInverse.copy(this.matrixWorld).invert()}updateWorldMatrix(e,t){super.updateWorldMatrix(e,t),this.matrixWorldInverse.copy(this.matrixWorld).invert()}clone(){return new this.constructor().copy(this)}}class _n extends xu{constructor(e=50,t=1,n=.1,s=2e3){super(),this.isPerspectiveCamera=!0,this.type="PerspectiveCamera",this.fov=e,this.zoom=1,this.near=n,this.far=s,this.focus=10,this.aspect=t,this.view=null,this.filmGauge=35,this.filmOffset=0,this.updateProjectionMatrix()}copy(e,t){return super.copy(e,t),this.fov=e.fov,this.zoom=e.zoom,this.near=e.near,this.far=e.far,this.focus=e.focus,this.aspect=e.aspect,this.view=e.view===null?null:Object.assign({},e.view),this.filmGauge=e.filmGauge,this.filmOffset=e.filmOffset,this}setFocalLength(e){const t=.5*this.getFilmHeight()/e;this.fov=Fs*2*Math.atan(t),this.updateProjectionMatrix()}getFocalLength(){const e=Math.tan(Is*.5*this.fov);return .5*this.getFilmHeight()/e}getEffectiveFOV(){return Fs*2*Math.atan(Math.tan(Is*.5*this.fov)/this.zoom)}getFilmWidth(){return this.filmGauge*Math.min(this.aspect,1)}getFilmHeight(){return this.filmGauge/Math.max(this.aspect,1)}setViewOffset(e,t,n,s,r,o){this.aspect=e/t,this.view===null&&(this.view={enabled:!0,fullWidth:1,fullHeight:1,offsetX:0,offsetY:0,width:1,height:1}),this.view.enabled=!0,this.view.fullWidth=e,this.view.fullHeight=t,this.view.offsetX=n,this.view.offsetY=s,this.view.width=r,this.view.height=o,this.updateProjectionMatrix()}clearViewOffset(){this.view!==null&&(this.view.enabled=!1),this.updateProjectionMatrix()}updateProjectionMatrix(){const e=this.near;let t=e*Math.tan(Is*.5*this.fov)/this.zoom,n=2*t,s=this.aspect*n,r=-.5*s;const o=this.view;if(this.view!==null&&this.view.enabled){const l=o.fullWidth,c=o.fullHeight;r+=o.offsetX*s/l,t-=o.offsetY*n/c,s*=o.width/l,n*=o.height/c}const a=this.filmOffset;a!==0&&(r+=e*a/this.getFilmWidth()),this.projectionMatrix.makePerspective(r,r+s,t,t-n,e,this.far),this.projectionMatrixInverse.copy(this.projectionMatrix).invert()}toJSON(e){const t=super.toJSON(e);return t.object.fov=this.fov,t.object.zoom=this.zoom,t.object.near=this.near,t.object.far=this.far,t.object.focus=this.focus,t.object.aspect=this.aspect,this.view!==null&&(t.object.view=Object.assign({},this.view)),t.object.filmGauge=this.filmGauge,t.object.filmOffset=this.filmOffset,t}}const Yi=-90,Zi=1;class ed extends Ut{constructor(e,t,n){super(),this.type="CubeCamera",this.renderTarget=n;const s=new _n(Yi,Zi,e,t);s.layers=this.layers,s.up.set(0,1,0),s.lookAt(1,0,0),this.add(s);const r=new _n(Yi,Zi,e,t);r.layers=this.layers,r.up.set(0,1,0),r.lookAt(-1,0,0),this.add(r);const o=new _n(Yi,Zi,e,t);o.layers=this.layers,o.up.set(0,0,-1),o.lookAt(0,1,0),this.add(o);const a=new _n(Yi,Zi,e,t);a.layers=this.layers,a.up.set(0,0,1),a.lookAt(0,-1,0),this.add(a);const l=new _n(Yi,Zi,e,t);l.layers=this.layers,l.up.set(0,1,0),l.lookAt(0,0,1),this.add(l);const c=new _n(Yi,Zi,e,t);c.layers=this.layers,c.up.set(0,1,0),c.lookAt(0,0,-1),this.add(c)}update(e,t){this.parent===null&&this.updateMatrixWorld();const n=this.renderTarget,[s,r,o,a,l,c]=this.children,f=e.getRenderTarget(),h=e.toneMapping,u=e.xr.enabled;e.toneMapping=Nn,e.xr.enabled=!1;const p=n.texture.generateMipmaps;n.texture.generateMipmaps=!1,e.setRenderTarget(n,0),e.render(t,s),e.setRenderTarget(n,1),e.render(t,r),e.setRenderTarget(n,2),e.render(t,o),e.setRenderTarget(n,3),e.render(t,a),e.setRenderTarget(n,4),e.render(t,l),n.texture.generateMipmaps=p,e.setRenderTarget(n,5),e.render(t,c),e.setRenderTarget(f),e.toneMapping=h,e.xr.enabled=u,n.texture.needsPMREMUpdate=!0}}class Su extends fn{constructor(e,t,n,s,r,o,a,l,c,f){e=e!==void 0?e:[],t=t!==void 0?t:as,super(e,t,n,s,r,o,a,l,c,f),this.isCubeTexture=!0,this.flipY=!1}get images(){return this.image}set images(e){this.image=e}}class td extends fi{constructor(e=1,t={}){super(e,e,t),this.isWebGLCubeRenderTarget=!0;const n={width:e,height:e,depth:1},s=[n,n,n,n,n,n];this.texture=new Su(s,t.mapping,t.wrapS,t.wrapT,t.magFilter,t.minFilter,t.format,t.type,t.anisotropy,t.encoding),this.texture.isRenderTargetTexture=!0,this.texture.generateMipmaps=t.generateMipmaps!==void 0?t.generateMipmaps:!1,this.texture.minFilter=t.minFilter!==void 0?t.minFilter:Mn}fromEquirectangularTexture(e,t){this.texture.type=t.type,this.texture.encoding=t.encoding,this.texture.generateMipmaps=t.generateMipmaps,this.texture.minFilter=t.minFilter,this.texture.magFilter=t.magFilter;const n={uniforms:{tEquirect:{value:null}},vertexShader:`

				varying vec3 vWorldDirection;

				vec3 transformDirection( in vec3 dir, in mat4 matrix ) {

					return normalize( ( matrix * vec4( dir, 0.0 ) ).xyz );

				}

				void main() {

					vWorldDirection = transformDirection( position, modelMatrix );

					#include <begin_vertex>
					#include <project_vertex>

				}
			`,fragmentShader:`

				uniform sampler2D tEquirect;

				varying vec3 vWorldDirection;

				#include <common>

				void main() {

					vec3 direction = normalize( vWorldDirection );

					vec2 sampleUV = equirectUv( direction );

					gl_FragColor = texture2D( tEquirect, sampleUV );

				}
			`},s=new At(5,5,5),r=new $n({name:"CubemapFromEquirect",uniforms:us(n.uniforms),vertexShader:n.vertexShader,fragmentShader:n.fragmentShader,side:un,blending:li});r.uniforms.tEquirect.value=t;const o=new Ee(s,r),a=t.minFilter;return t.minFilter===ks&&(t.minFilter=Mn),new ed(1,10,this).update(e,o),t.minFilter=a,o.geometry.dispose(),o.material.dispose(),this}clear(e,t,n,s){const r=e.getRenderTarget();for(let o=0;o<6;o++)e.setRenderTarget(this,o),e.clear(t,n,s);e.setRenderTarget(r)}}const _o=new G,nd=new G,id=new et;class Si{constructor(e=new G(1,0,0),t=0){this.isPlane=!0,this.normal=e,this.constant=t}set(e,t){return this.normal.copy(e),this.constant=t,this}setComponents(e,t,n,s){return this.normal.set(e,t,n),this.constant=s,this}setFromNormalAndCoplanarPoint(e,t){return this.normal.copy(e),this.constant=-t.dot(this.normal),this}setFromCoplanarPoints(e,t,n){const s=_o.subVectors(n,t).cross(nd.subVectors(e,t)).normalize();return this.setFromNormalAndCoplanarPoint(s,e),this}copy(e){return this.normal.copy(e.normal),this.constant=e.constant,this}normalize(){const e=1/this.normal.length();return this.normal.multiplyScalar(e),this.constant*=e,this}negate(){return this.constant*=-1,this.normal.negate(),this}distanceToPoint(e){return this.normal.dot(e)+this.constant}distanceToSphere(e){return this.distanceToPoint(e.center)-e.radius}projectPoint(e,t){return t.copy(e).addScaledVector(this.normal,-this.distanceToPoint(e))}intersectLine(e,t){const n=e.delta(_o),s=this.normal.dot(n);if(s===0)return this.distanceToPoint(e.start)===0?t.copy(e.start):null;const r=-(e.start.dot(this.normal)+this.constant)/s;return r<0||r>1?null:t.copy(e.start).addScaledVector(n,r)}intersectsLine(e){const t=this.distanceToPoint(e.start),n=this.distanceToPoint(e.end);return t<0&&n>0||n<0&&t>0}intersectsBox(e){return e.intersectsPlane(this)}intersectsSphere(e){return e.intersectsPlane(this)}coplanarPoint(e){return e.copy(this.normal).multiplyScalar(-this.constant)}applyMatrix4(e,t){const n=t||id.getNormalMatrix(e),s=this.coplanarPoint(_o).applyMatrix4(e),r=this.normal.applyMatrix3(n).normalize();return this.constant=-s.dot(r),this}translate(e){return this.constant-=e.dot(this.normal),this}equals(e){return e.normal.equals(this.normal)&&e.constant===this.constant}clone(){return new this.constructor().copy(this)}}const Mi=new Dr,ur=new G;class Yo{constructor(e=new Si,t=new Si,n=new Si,s=new Si,r=new Si,o=new Si){this.planes=[e,t,n,s,r,o]}set(e,t,n,s,r,o){const a=this.planes;return a[0].copy(e),a[1].copy(t),a[2].copy(n),a[3].copy(s),a[4].copy(r),a[5].copy(o),this}copy(e){const t=this.planes;for(let n=0;n<6;n++)t[n].copy(e.planes[n]);return this}setFromProjectionMatrix(e){const t=this.planes,n=e.elements,s=n[0],r=n[1],o=n[2],a=n[3],l=n[4],c=n[5],f=n[6],h=n[7],u=n[8],p=n[9],g=n[10],v=n[11],m=n[12],d=n[13],M=n[14],b=n[15];return t[0].setComponents(a-s,h-l,v-u,b-m).normalize(),t[1].setComponents(a+s,h+l,v+u,b+m).normalize(),t[2].setComponents(a+r,h+c,v+p,b+d).normalize(),t[3].setComponents(a-r,h-c,v-p,b-d).normalize(),t[4].setComponents(a-o,h-f,v-g,b-M).normalize(),t[5].setComponents(a+o,h+f,v+g,b+M).normalize(),this}intersectsObject(e){if(e.boundingSphere!==void 0)e.boundingSphere===null&&e.computeBoundingSphere(),Mi.copy(e.boundingSphere).applyMatrix4(e.matrixWorld);else{const t=e.geometry;t.boundingSphere===null&&t.computeBoundingSphere(),Mi.copy(t.boundingSphere).applyMatrix4(e.matrixWorld)}return this.intersectsSphere(Mi)}intersectsSprite(e){return Mi.center.set(0,0,0),Mi.radius=.7071067811865476,Mi.applyMatrix4(e.matrixWorld),this.intersectsSphere(Mi)}intersectsSphere(e){const t=this.planes,n=e.center,s=-e.radius;for(let r=0;r<6;r++)if(t[r].distanceToPoint(n)<s)return!1;return!0}intersectsBox(e){const t=this.planes;for(let n=0;n<6;n++){const s=t[n];if(ur.x=s.normal.x>0?e.max.x:e.min.x,ur.y=s.normal.y>0?e.max.y:e.min.y,ur.z=s.normal.z>0?e.max.z:e.min.z,s.distanceToPoint(ur)<0)return!1}return!0}containsPoint(e){const t=this.planes;for(let n=0;n<6;n++)if(t[n].distanceToPoint(e)<0)return!1;return!0}clone(){return new this.constructor().copy(this)}}function yu(){let i=null,e=!1,t=null,n=null;function s(r,o){t(r,o),n=i.requestAnimationFrame(s)}return{start:function(){e!==!0&&t!==null&&(n=i.requestAnimationFrame(s),e=!0)},stop:function(){i.cancelAnimationFrame(n),e=!1},setAnimationLoop:function(r){t=r},setContext:function(r){i=r}}}function sd(i,e){const t=e.isWebGL2,n=new WeakMap;function s(c,f){const h=c.array,u=c.usage,p=i.createBuffer();i.bindBuffer(f,p),i.bufferData(f,h,u),c.onUploadCallback();let g;if(h instanceof Float32Array)g=5126;else if(h instanceof Uint16Array)if(c.isFloat16BufferAttribute)if(t)g=5131;else throw new Error("THREE.WebGLAttributes: Usage of Float16BufferAttribute requires WebGL2.");else g=5123;else if(h instanceof Int16Array)g=5122;else if(h instanceof Uint32Array)g=5125;else if(h instanceof Int32Array)g=5124;else if(h instanceof Int8Array)g=5120;else if(h instanceof Uint8Array)g=5121;else if(h instanceof Uint8ClampedArray)g=5121;else throw new Error("THREE.WebGLAttributes: Unsupported buffer data format: "+h);return{buffer:p,type:g,bytesPerElement:h.BYTES_PER_ELEMENT,version:c.version}}function r(c,f,h){const u=f.array,p=f.updateRange;i.bindBuffer(h,c),p.count===-1?i.bufferSubData(h,0,u):(t?i.bufferSubData(h,p.offset*u.BYTES_PER_ELEMENT,u,p.offset,p.count):i.bufferSubData(h,p.offset*u.BYTES_PER_ELEMENT,u.subarray(p.offset,p.offset+p.count)),p.count=-1),f.onUploadCallback()}function o(c){return c.isInterleavedBufferAttribute&&(c=c.data),n.get(c)}function a(c){c.isInterleavedBufferAttribute&&(c=c.data);const f=n.get(c);f&&(i.deleteBuffer(f.buffer),n.delete(c))}function l(c,f){if(c.isGLBufferAttribute){const u=n.get(c);(!u||u.version<c.version)&&n.set(c,{buffer:c.buffer,type:c.type,bytesPerElement:c.elementSize,version:c.version});return}c.isInterleavedBufferAttribute&&(c=c.data);const h=n.get(c);h===void 0?n.set(c,s(c,f)):h.version<c.version&&(r(h.buffer,c,f),h.version=c.version)}return{get:o,remove:a,update:l}}class Ur extends sn{constructor(e=1,t=1,n=1,s=1){super(),this.type="PlaneGeometry",this.parameters={width:e,height:t,widthSegments:n,heightSegments:s};const r=e/2,o=t/2,a=Math.floor(n),l=Math.floor(s),c=a+1,f=l+1,h=e/a,u=t/l,p=[],g=[],v=[],m=[];for(let d=0;d<f;d++){const M=d*u-o;for(let b=0;b<c;b++){const x=b*h-r;g.push(x,-M,0),v.push(0,0,1),m.push(b/a),m.push(1-d/l)}}for(let d=0;d<l;d++)for(let M=0;M<a;M++){const b=M+c*d,x=M+c*(d+1),y=M+1+c*(d+1),T=M+1+c*d;p.push(b,x,T),p.push(x,y,T)}this.setIndex(p),this.setAttribute("position",new Et(g,3)),this.setAttribute("normal",new Et(v,3)),this.setAttribute("uv",new Et(m,2))}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new Ur(e.width,e.height,e.widthSegments,e.heightSegments)}}var rd=`#ifdef USE_ALPHAMAP
	diffuseColor.a *= texture2D( alphaMap, vAlphaMapUv ).g;
#endif`,od=`#ifdef USE_ALPHAMAP
	uniform sampler2D alphaMap;
#endif`,ad=`#ifdef USE_ALPHATEST
	if ( diffuseColor.a < alphaTest ) discard;
#endif`,ld=`#ifdef USE_ALPHATEST
	uniform float alphaTest;
#endif`,cd=`#ifdef USE_AOMAP
	float ambientOcclusion = ( texture2D( aoMap, vAoMapUv ).r - 1.0 ) * aoMapIntensity + 1.0;
	reflectedLight.indirectDiffuse *= ambientOcclusion;
	#if defined( USE_ENVMAP ) && defined( STANDARD )
		float dotNV = saturate( dot( geometry.normal, geometry.viewDir ) );
		reflectedLight.indirectSpecular *= computeSpecularOcclusion( dotNV, ambientOcclusion, material.roughness );
	#endif
#endif`,ud=`#ifdef USE_AOMAP
	uniform sampler2D aoMap;
	uniform float aoMapIntensity;
#endif`,fd="vec3 transformed = vec3( position );",hd=`vec3 objectNormal = vec3( normal );
#ifdef USE_TANGENT
	vec3 objectTangent = vec3( tangent.xyz );
#endif`,dd=`float G_BlinnPhong_Implicit( ) {
	return 0.25;
}
float D_BlinnPhong( const in float shininess, const in float dotNH ) {
	return RECIPROCAL_PI * ( shininess * 0.5 + 1.0 ) * pow( dotNH, shininess );
}
vec3 BRDF_BlinnPhong( const in vec3 lightDir, const in vec3 viewDir, const in vec3 normal, const in vec3 specularColor, const in float shininess ) {
	vec3 halfDir = normalize( lightDir + viewDir );
	float dotNH = saturate( dot( normal, halfDir ) );
	float dotVH = saturate( dot( viewDir, halfDir ) );
	vec3 F = F_Schlick( specularColor, 1.0, dotVH );
	float G = G_BlinnPhong_Implicit( );
	float D = D_BlinnPhong( shininess, dotNH );
	return F * ( G * D );
} // validated`,pd=`#ifdef USE_IRIDESCENCE
	const mat3 XYZ_TO_REC709 = mat3(
		 3.2404542, -0.9692660,  0.0556434,
		-1.5371385,  1.8760108, -0.2040259,
		-0.4985314,  0.0415560,  1.0572252
	);
	vec3 Fresnel0ToIor( vec3 fresnel0 ) {
		vec3 sqrtF0 = sqrt( fresnel0 );
		return ( vec3( 1.0 ) + sqrtF0 ) / ( vec3( 1.0 ) - sqrtF0 );
	}
	vec3 IorToFresnel0( vec3 transmittedIor, float incidentIor ) {
		return pow2( ( transmittedIor - vec3( incidentIor ) ) / ( transmittedIor + vec3( incidentIor ) ) );
	}
	float IorToFresnel0( float transmittedIor, float incidentIor ) {
		return pow2( ( transmittedIor - incidentIor ) / ( transmittedIor + incidentIor ));
	}
	vec3 evalSensitivity( float OPD, vec3 shift ) {
		float phase = 2.0 * PI * OPD * 1.0e-9;
		vec3 val = vec3( 5.4856e-13, 4.4201e-13, 5.2481e-13 );
		vec3 pos = vec3( 1.6810e+06, 1.7953e+06, 2.2084e+06 );
		vec3 var = vec3( 4.3278e+09, 9.3046e+09, 6.6121e+09 );
		vec3 xyz = val * sqrt( 2.0 * PI * var ) * cos( pos * phase + shift ) * exp( - pow2( phase ) * var );
		xyz.x += 9.7470e-14 * sqrt( 2.0 * PI * 4.5282e+09 ) * cos( 2.2399e+06 * phase + shift[ 0 ] ) * exp( - 4.5282e+09 * pow2( phase ) );
		xyz /= 1.0685e-7;
		vec3 rgb = XYZ_TO_REC709 * xyz;
		return rgb;
	}
	vec3 evalIridescence( float outsideIOR, float eta2, float cosTheta1, float thinFilmThickness, vec3 baseF0 ) {
		vec3 I;
		float iridescenceIOR = mix( outsideIOR, eta2, smoothstep( 0.0, 0.03, thinFilmThickness ) );
		float sinTheta2Sq = pow2( outsideIOR / iridescenceIOR ) * ( 1.0 - pow2( cosTheta1 ) );
		float cosTheta2Sq = 1.0 - sinTheta2Sq;
		if ( cosTheta2Sq < 0.0 ) {
			 return vec3( 1.0 );
		}
		float cosTheta2 = sqrt( cosTheta2Sq );
		float R0 = IorToFresnel0( iridescenceIOR, outsideIOR );
		float R12 = F_Schlick( R0, 1.0, cosTheta1 );
		float R21 = R12;
		float T121 = 1.0 - R12;
		float phi12 = 0.0;
		if ( iridescenceIOR < outsideIOR ) phi12 = PI;
		float phi21 = PI - phi12;
		vec3 baseIOR = Fresnel0ToIor( clamp( baseF0, 0.0, 0.9999 ) );		vec3 R1 = IorToFresnel0( baseIOR, iridescenceIOR );
		vec3 R23 = F_Schlick( R1, 1.0, cosTheta2 );
		vec3 phi23 = vec3( 0.0 );
		if ( baseIOR[ 0 ] < iridescenceIOR ) phi23[ 0 ] = PI;
		if ( baseIOR[ 1 ] < iridescenceIOR ) phi23[ 1 ] = PI;
		if ( baseIOR[ 2 ] < iridescenceIOR ) phi23[ 2 ] = PI;
		float OPD = 2.0 * iridescenceIOR * thinFilmThickness * cosTheta2;
		vec3 phi = vec3( phi21 ) + phi23;
		vec3 R123 = clamp( R12 * R23, 1e-5, 0.9999 );
		vec3 r123 = sqrt( R123 );
		vec3 Rs = pow2( T121 ) * R23 / ( vec3( 1.0 ) - R123 );
		vec3 C0 = R12 + Rs;
		I = C0;
		vec3 Cm = Rs - T121;
		for ( int m = 1; m <= 2; ++ m ) {
			Cm *= r123;
			vec3 Sm = 2.0 * evalSensitivity( float( m ) * OPD, float( m ) * phi );
			I += Cm * Sm;
		}
		return max( I, vec3( 0.0 ) );
	}
#endif`,md=`#ifdef USE_BUMPMAP
	uniform sampler2D bumpMap;
	uniform float bumpScale;
	vec2 dHdxy_fwd() {
		vec2 dSTdx = dFdx( vBumpMapUv );
		vec2 dSTdy = dFdy( vBumpMapUv );
		float Hll = bumpScale * texture2D( bumpMap, vBumpMapUv ).x;
		float dBx = bumpScale * texture2D( bumpMap, vBumpMapUv + dSTdx ).x - Hll;
		float dBy = bumpScale * texture2D( bumpMap, vBumpMapUv + dSTdy ).x - Hll;
		return vec2( dBx, dBy );
	}
	vec3 perturbNormalArb( vec3 surf_pos, vec3 surf_norm, vec2 dHdxy, float faceDirection ) {
		vec3 vSigmaX = dFdx( surf_pos.xyz );
		vec3 vSigmaY = dFdy( surf_pos.xyz );
		vec3 vN = surf_norm;
		vec3 R1 = cross( vSigmaY, vN );
		vec3 R2 = cross( vN, vSigmaX );
		float fDet = dot( vSigmaX, R1 ) * faceDirection;
		vec3 vGrad = sign( fDet ) * ( dHdxy.x * R1 + dHdxy.y * R2 );
		return normalize( abs( fDet ) * surf_norm - vGrad );
	}
#endif`,gd=`#if NUM_CLIPPING_PLANES > 0
	vec4 plane;
	#pragma unroll_loop_start
	for ( int i = 0; i < UNION_CLIPPING_PLANES; i ++ ) {
		plane = clippingPlanes[ i ];
		if ( dot( vClipPosition, plane.xyz ) > plane.w ) discard;
	}
	#pragma unroll_loop_end
	#if UNION_CLIPPING_PLANES < NUM_CLIPPING_PLANES
		bool clipped = true;
		#pragma unroll_loop_start
		for ( int i = UNION_CLIPPING_PLANES; i < NUM_CLIPPING_PLANES; i ++ ) {
			plane = clippingPlanes[ i ];
			clipped = ( dot( vClipPosition, plane.xyz ) > plane.w ) && clipped;
		}
		#pragma unroll_loop_end
		if ( clipped ) discard;
	#endif
#endif`,_d=`#if NUM_CLIPPING_PLANES > 0
	varying vec3 vClipPosition;
	uniform vec4 clippingPlanes[ NUM_CLIPPING_PLANES ];
#endif`,vd=`#if NUM_CLIPPING_PLANES > 0
	varying vec3 vClipPosition;
#endif`,bd=`#if NUM_CLIPPING_PLANES > 0
	vClipPosition = - mvPosition.xyz;
#endif`,Md=`#if defined( USE_COLOR_ALPHA )
	diffuseColor *= vColor;
#elif defined( USE_COLOR )
	diffuseColor.rgb *= vColor;
#endif`,xd=`#if defined( USE_COLOR_ALPHA )
	varying vec4 vColor;
#elif defined( USE_COLOR )
	varying vec3 vColor;
#endif`,Sd=`#if defined( USE_COLOR_ALPHA )
	varying vec4 vColor;
#elif defined( USE_COLOR ) || defined( USE_INSTANCING_COLOR )
	varying vec3 vColor;
#endif`,yd=`#if defined( USE_COLOR_ALPHA )
	vColor = vec4( 1.0 );
#elif defined( USE_COLOR ) || defined( USE_INSTANCING_COLOR )
	vColor = vec3( 1.0 );
#endif
#ifdef USE_COLOR
	vColor *= color;
#endif
#ifdef USE_INSTANCING_COLOR
	vColor.xyz *= instanceColor.xyz;
#endif`,wd=`#define PI 3.141592653589793
#define PI2 6.283185307179586
#define PI_HALF 1.5707963267948966
#define RECIPROCAL_PI 0.3183098861837907
#define RECIPROCAL_PI2 0.15915494309189535
#define EPSILON 1e-6
#ifndef saturate
#define saturate( a ) clamp( a, 0.0, 1.0 )
#endif
#define whiteComplement( a ) ( 1.0 - saturate( a ) )
float pow2( const in float x ) { return x*x; }
vec3 pow2( const in vec3 x ) { return x*x; }
float pow3( const in float x ) { return x*x*x; }
float pow4( const in float x ) { float x2 = x*x; return x2*x2; }
float max3( const in vec3 v ) { return max( max( v.x, v.y ), v.z ); }
float average( const in vec3 v ) { return dot( v, vec3( 0.3333333 ) ); }
highp float rand( const in vec2 uv ) {
	const highp float a = 12.9898, b = 78.233, c = 43758.5453;
	highp float dt = dot( uv.xy, vec2( a,b ) ), sn = mod( dt, PI );
	return fract( sin( sn ) * c );
}
#ifdef HIGH_PRECISION
	float precisionSafeLength( vec3 v ) { return length( v ); }
#else
	float precisionSafeLength( vec3 v ) {
		float maxComponent = max3( abs( v ) );
		return length( v / maxComponent ) * maxComponent;
	}
#endif
struct IncidentLight {
	vec3 color;
	vec3 direction;
	bool visible;
};
struct ReflectedLight {
	vec3 directDiffuse;
	vec3 directSpecular;
	vec3 indirectDiffuse;
	vec3 indirectSpecular;
};
struct GeometricContext {
	vec3 position;
	vec3 normal;
	vec3 viewDir;
#ifdef USE_CLEARCOAT
	vec3 clearcoatNormal;
#endif
};
vec3 transformDirection( in vec3 dir, in mat4 matrix ) {
	return normalize( ( matrix * vec4( dir, 0.0 ) ).xyz );
}
vec3 inverseTransformDirection( in vec3 dir, in mat4 matrix ) {
	return normalize( ( vec4( dir, 0.0 ) * matrix ).xyz );
}
mat3 transposeMat3( const in mat3 m ) {
	mat3 tmp;
	tmp[ 0 ] = vec3( m[ 0 ].x, m[ 1 ].x, m[ 2 ].x );
	tmp[ 1 ] = vec3( m[ 0 ].y, m[ 1 ].y, m[ 2 ].y );
	tmp[ 2 ] = vec3( m[ 0 ].z, m[ 1 ].z, m[ 2 ].z );
	return tmp;
}
float luminance( const in vec3 rgb ) {
	const vec3 weights = vec3( 0.2126729, 0.7151522, 0.0721750 );
	return dot( weights, rgb );
}
bool isPerspectiveMatrix( mat4 m ) {
	return m[ 2 ][ 3 ] == - 1.0;
}
vec2 equirectUv( in vec3 dir ) {
	float u = atan( dir.z, dir.x ) * RECIPROCAL_PI2 + 0.5;
	float v = asin( clamp( dir.y, - 1.0, 1.0 ) ) * RECIPROCAL_PI + 0.5;
	return vec2( u, v );
}
vec3 BRDF_Lambert( const in vec3 diffuseColor ) {
	return RECIPROCAL_PI * diffuseColor;
}
vec3 F_Schlick( const in vec3 f0, const in float f90, const in float dotVH ) {
	float fresnel = exp2( ( - 5.55473 * dotVH - 6.98316 ) * dotVH );
	return f0 * ( 1.0 - fresnel ) + ( f90 * fresnel );
}
float F_Schlick( const in float f0, const in float f90, const in float dotVH ) {
	float fresnel = exp2( ( - 5.55473 * dotVH - 6.98316 ) * dotVH );
	return f0 * ( 1.0 - fresnel ) + ( f90 * fresnel );
} // validated`,Ed=`#ifdef ENVMAP_TYPE_CUBE_UV
	#define cubeUV_minMipLevel 4.0
	#define cubeUV_minTileSize 16.0
	float getFace( vec3 direction ) {
		vec3 absDirection = abs( direction );
		float face = - 1.0;
		if ( absDirection.x > absDirection.z ) {
			if ( absDirection.x > absDirection.y )
				face = direction.x > 0.0 ? 0.0 : 3.0;
			else
				face = direction.y > 0.0 ? 1.0 : 4.0;
		} else {
			if ( absDirection.z > absDirection.y )
				face = direction.z > 0.0 ? 2.0 : 5.0;
			else
				face = direction.y > 0.0 ? 1.0 : 4.0;
		}
		return face;
	}
	vec2 getUV( vec3 direction, float face ) {
		vec2 uv;
		if ( face == 0.0 ) {
			uv = vec2( direction.z, direction.y ) / abs( direction.x );
		} else if ( face == 1.0 ) {
			uv = vec2( - direction.x, - direction.z ) / abs( direction.y );
		} else if ( face == 2.0 ) {
			uv = vec2( - direction.x, direction.y ) / abs( direction.z );
		} else if ( face == 3.0 ) {
			uv = vec2( - direction.z, direction.y ) / abs( direction.x );
		} else if ( face == 4.0 ) {
			uv = vec2( - direction.x, direction.z ) / abs( direction.y );
		} else {
			uv = vec2( direction.x, direction.y ) / abs( direction.z );
		}
		return 0.5 * ( uv + 1.0 );
	}
	vec3 bilinearCubeUV( sampler2D envMap, vec3 direction, float mipInt ) {
		float face = getFace( direction );
		float filterInt = max( cubeUV_minMipLevel - mipInt, 0.0 );
		mipInt = max( mipInt, cubeUV_minMipLevel );
		float faceSize = exp2( mipInt );
		highp vec2 uv = getUV( direction, face ) * ( faceSize - 2.0 ) + 1.0;
		if ( face > 2.0 ) {
			uv.y += faceSize;
			face -= 3.0;
		}
		uv.x += face * faceSize;
		uv.x += filterInt * 3.0 * cubeUV_minTileSize;
		uv.y += 4.0 * ( exp2( CUBEUV_MAX_MIP ) - faceSize );
		uv.x *= CUBEUV_TEXEL_WIDTH;
		uv.y *= CUBEUV_TEXEL_HEIGHT;
		#ifdef texture2DGradEXT
			return texture2DGradEXT( envMap, uv, vec2( 0.0 ), vec2( 0.0 ) ).rgb;
		#else
			return texture2D( envMap, uv ).rgb;
		#endif
	}
	#define cubeUV_r0 1.0
	#define cubeUV_v0 0.339
	#define cubeUV_m0 - 2.0
	#define cubeUV_r1 0.8
	#define cubeUV_v1 0.276
	#define cubeUV_m1 - 1.0
	#define cubeUV_r4 0.4
	#define cubeUV_v4 0.046
	#define cubeUV_m4 2.0
	#define cubeUV_r5 0.305
	#define cubeUV_v5 0.016
	#define cubeUV_m5 3.0
	#define cubeUV_r6 0.21
	#define cubeUV_v6 0.0038
	#define cubeUV_m6 4.0
	float roughnessToMip( float roughness ) {
		float mip = 0.0;
		if ( roughness >= cubeUV_r1 ) {
			mip = ( cubeUV_r0 - roughness ) * ( cubeUV_m1 - cubeUV_m0 ) / ( cubeUV_r0 - cubeUV_r1 ) + cubeUV_m0;
		} else if ( roughness >= cubeUV_r4 ) {
			mip = ( cubeUV_r1 - roughness ) * ( cubeUV_m4 - cubeUV_m1 ) / ( cubeUV_r1 - cubeUV_r4 ) + cubeUV_m1;
		} else if ( roughness >= cubeUV_r5 ) {
			mip = ( cubeUV_r4 - roughness ) * ( cubeUV_m5 - cubeUV_m4 ) / ( cubeUV_r4 - cubeUV_r5 ) + cubeUV_m4;
		} else if ( roughness >= cubeUV_r6 ) {
			mip = ( cubeUV_r5 - roughness ) * ( cubeUV_m6 - cubeUV_m5 ) / ( cubeUV_r5 - cubeUV_r6 ) + cubeUV_m5;
		} else {
			mip = - 2.0 * log2( 1.16 * roughness );		}
		return mip;
	}
	vec4 textureCubeUV( sampler2D envMap, vec3 sampleDir, float roughness ) {
		float mip = clamp( roughnessToMip( roughness ), cubeUV_m0, CUBEUV_MAX_MIP );
		float mipF = fract( mip );
		float mipInt = floor( mip );
		vec3 color0 = bilinearCubeUV( envMap, sampleDir, mipInt );
		if ( mipF == 0.0 ) {
			return vec4( color0, 1.0 );
		} else {
			vec3 color1 = bilinearCubeUV( envMap, sampleDir, mipInt + 1.0 );
			return vec4( mix( color0, color1, mipF ), 1.0 );
		}
	}
#endif`,Td=`vec3 transformedNormal = objectNormal;
#ifdef USE_INSTANCING
	mat3 m = mat3( instanceMatrix );
	transformedNormal /= vec3( dot( m[ 0 ], m[ 0 ] ), dot( m[ 1 ], m[ 1 ] ), dot( m[ 2 ], m[ 2 ] ) );
	transformedNormal = m * transformedNormal;
#endif
transformedNormal = normalMatrix * transformedNormal;
#ifdef FLIP_SIDED
	transformedNormal = - transformedNormal;
#endif
#ifdef USE_TANGENT
	vec3 transformedTangent = ( modelViewMatrix * vec4( objectTangent, 0.0 ) ).xyz;
	#ifdef FLIP_SIDED
		transformedTangent = - transformedTangent;
	#endif
#endif`,Ad=`#ifdef USE_DISPLACEMENTMAP
	uniform sampler2D displacementMap;
	uniform float displacementScale;
	uniform float displacementBias;
#endif`,Cd=`#ifdef USE_DISPLACEMENTMAP
	transformed += normalize( objectNormal ) * ( texture2D( displacementMap, vDisplacementMapUv ).x * displacementScale + displacementBias );
#endif`,Pd=`#ifdef USE_EMISSIVEMAP
	vec4 emissiveColor = texture2D( emissiveMap, vEmissiveMapUv );
	totalEmissiveRadiance *= emissiveColor.rgb;
#endif`,Ld=`#ifdef USE_EMISSIVEMAP
	uniform sampler2D emissiveMap;
#endif`,Rd="gl_FragColor = linearToOutputTexel( gl_FragColor );",Dd=`vec4 LinearToLinear( in vec4 value ) {
	return value;
}
vec4 LinearTosRGB( in vec4 value ) {
	return vec4( mix( pow( value.rgb, vec3( 0.41666 ) ) * 1.055 - vec3( 0.055 ), value.rgb * 12.92, vec3( lessThanEqual( value.rgb, vec3( 0.0031308 ) ) ) ), value.a );
}`,Id=`#ifdef USE_ENVMAP
	#ifdef ENV_WORLDPOS
		vec3 cameraToFrag;
		if ( isOrthographic ) {
			cameraToFrag = normalize( vec3( - viewMatrix[ 0 ][ 2 ], - viewMatrix[ 1 ][ 2 ], - viewMatrix[ 2 ][ 2 ] ) );
		} else {
			cameraToFrag = normalize( vWorldPosition - cameraPosition );
		}
		vec3 worldNormal = inverseTransformDirection( normal, viewMatrix );
		#ifdef ENVMAP_MODE_REFLECTION
			vec3 reflectVec = reflect( cameraToFrag, worldNormal );
		#else
			vec3 reflectVec = refract( cameraToFrag, worldNormal, refractionRatio );
		#endif
	#else
		vec3 reflectVec = vReflect;
	#endif
	#ifdef ENVMAP_TYPE_CUBE
		vec4 envColor = textureCube( envMap, vec3( flipEnvMap * reflectVec.x, reflectVec.yz ) );
	#else
		vec4 envColor = vec4( 0.0 );
	#endif
	#ifdef ENVMAP_BLENDING_MULTIPLY
		outgoingLight = mix( outgoingLight, outgoingLight * envColor.xyz, specularStrength * reflectivity );
	#elif defined( ENVMAP_BLENDING_MIX )
		outgoingLight = mix( outgoingLight, envColor.xyz, specularStrength * reflectivity );
	#elif defined( ENVMAP_BLENDING_ADD )
		outgoingLight += envColor.xyz * specularStrength * reflectivity;
	#endif
#endif`,Ud=`#ifdef USE_ENVMAP
	uniform float envMapIntensity;
	uniform float flipEnvMap;
	#ifdef ENVMAP_TYPE_CUBE
		uniform samplerCube envMap;
	#else
		uniform sampler2D envMap;
	#endif
	
#endif`,zd=`#ifdef USE_ENVMAP
	uniform float reflectivity;
	#if defined( USE_BUMPMAP ) || defined( USE_NORMALMAP ) || defined( PHONG ) || defined( LAMBERT )
		#define ENV_WORLDPOS
	#endif
	#ifdef ENV_WORLDPOS
		varying vec3 vWorldPosition;
		uniform float refractionRatio;
	#else
		varying vec3 vReflect;
	#endif
#endif`,kd=`#ifdef USE_ENVMAP
	#if defined( USE_BUMPMAP ) || defined( USE_NORMALMAP ) || defined( PHONG ) || defined( LAMBERT )
		#define ENV_WORLDPOS
	#endif
	#ifdef ENV_WORLDPOS
		
		varying vec3 vWorldPosition;
	#else
		varying vec3 vReflect;
		uniform float refractionRatio;
	#endif
#endif`,Nd=`#ifdef USE_ENVMAP
	#ifdef ENV_WORLDPOS
		vWorldPosition = worldPosition.xyz;
	#else
		vec3 cameraToVertex;
		if ( isOrthographic ) {
			cameraToVertex = normalize( vec3( - viewMatrix[ 0 ][ 2 ], - viewMatrix[ 1 ][ 2 ], - viewMatrix[ 2 ][ 2 ] ) );
		} else {
			cameraToVertex = normalize( worldPosition.xyz - cameraPosition );
		}
		vec3 worldNormal = inverseTransformDirection( transformedNormal, viewMatrix );
		#ifdef ENVMAP_MODE_REFLECTION
			vReflect = reflect( cameraToVertex, worldNormal );
		#else
			vReflect = refract( cameraToVertex, worldNormal, refractionRatio );
		#endif
	#endif
#endif`,Od=`#ifdef USE_FOG
	vFogDepth = - mvPosition.z;
#endif`,Fd=`#ifdef USE_FOG
	varying float vFogDepth;
#endif`,Bd=`#ifdef USE_FOG
	#ifdef FOG_EXP2
		float fogFactor = 1.0 - exp( - fogDensity * fogDensity * vFogDepth * vFogDepth );
	#else
		float fogFactor = smoothstep( fogNear, fogFar, vFogDepth );
	#endif
	gl_FragColor.rgb = mix( gl_FragColor.rgb, fogColor, fogFactor );
#endif`,Gd=`#ifdef USE_FOG
	uniform vec3 fogColor;
	varying float vFogDepth;
	#ifdef FOG_EXP2
		uniform float fogDensity;
	#else
		uniform float fogNear;
		uniform float fogFar;
	#endif
#endif`,Hd=`#ifdef USE_GRADIENTMAP
	uniform sampler2D gradientMap;
#endif
vec3 getGradientIrradiance( vec3 normal, vec3 lightDirection ) {
	float dotNL = dot( normal, lightDirection );
	vec2 coord = vec2( dotNL * 0.5 + 0.5, 0.0 );
	#ifdef USE_GRADIENTMAP
		return vec3( texture2D( gradientMap, coord ).r );
	#else
		vec2 fw = fwidth( coord ) * 0.5;
		return mix( vec3( 0.7 ), vec3( 1.0 ), smoothstep( 0.7 - fw.x, 0.7 + fw.x, coord.x ) );
	#endif
}`,Vd=`#ifdef USE_LIGHTMAP
	vec4 lightMapTexel = texture2D( lightMap, vLightMapUv );
	vec3 lightMapIrradiance = lightMapTexel.rgb * lightMapIntensity;
	reflectedLight.indirectDiffuse += lightMapIrradiance;
#endif`,Wd=`#ifdef USE_LIGHTMAP
	uniform sampler2D lightMap;
	uniform float lightMapIntensity;
#endif`,jd=`LambertMaterial material;
material.diffuseColor = diffuseColor.rgb;
material.specularStrength = specularStrength;`,Xd=`varying vec3 vViewPosition;
struct LambertMaterial {
	vec3 diffuseColor;
	float specularStrength;
};
void RE_Direct_Lambert( const in IncidentLight directLight, const in GeometricContext geometry, const in LambertMaterial material, inout ReflectedLight reflectedLight ) {
	float dotNL = saturate( dot( geometry.normal, directLight.direction ) );
	vec3 irradiance = dotNL * directLight.color;
	reflectedLight.directDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
void RE_IndirectDiffuse_Lambert( const in vec3 irradiance, const in GeometricContext geometry, const in LambertMaterial material, inout ReflectedLight reflectedLight ) {
	reflectedLight.indirectDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
#define RE_Direct				RE_Direct_Lambert
#define RE_IndirectDiffuse		RE_IndirectDiffuse_Lambert`,qd=`uniform bool receiveShadow;
uniform vec3 ambientLightColor;
uniform vec3 lightProbe[ 9 ];
vec3 shGetIrradianceAt( in vec3 normal, in vec3 shCoefficients[ 9 ] ) {
	float x = normal.x, y = normal.y, z = normal.z;
	vec3 result = shCoefficients[ 0 ] * 0.886227;
	result += shCoefficients[ 1 ] * 2.0 * 0.511664 * y;
	result += shCoefficients[ 2 ] * 2.0 * 0.511664 * z;
	result += shCoefficients[ 3 ] * 2.0 * 0.511664 * x;
	result += shCoefficients[ 4 ] * 2.0 * 0.429043 * x * y;
	result += shCoefficients[ 5 ] * 2.0 * 0.429043 * y * z;
	result += shCoefficients[ 6 ] * ( 0.743125 * z * z - 0.247708 );
	result += shCoefficients[ 7 ] * 2.0 * 0.429043 * x * z;
	result += shCoefficients[ 8 ] * 0.429043 * ( x * x - y * y );
	return result;
}
vec3 getLightProbeIrradiance( const in vec3 lightProbe[ 9 ], const in vec3 normal ) {
	vec3 worldNormal = inverseTransformDirection( normal, viewMatrix );
	vec3 irradiance = shGetIrradianceAt( worldNormal, lightProbe );
	return irradiance;
}
vec3 getAmbientLightIrradiance( const in vec3 ambientLightColor ) {
	vec3 irradiance = ambientLightColor;
	return irradiance;
}
float getDistanceAttenuation( const in float lightDistance, const in float cutoffDistance, const in float decayExponent ) {
	#if defined ( LEGACY_LIGHTS )
		if ( cutoffDistance > 0.0 && decayExponent > 0.0 ) {
			return pow( saturate( - lightDistance / cutoffDistance + 1.0 ), decayExponent );
		}
		return 1.0;
	#else
		float distanceFalloff = 1.0 / max( pow( lightDistance, decayExponent ), 0.01 );
		if ( cutoffDistance > 0.0 ) {
			distanceFalloff *= pow2( saturate( 1.0 - pow4( lightDistance / cutoffDistance ) ) );
		}
		return distanceFalloff;
	#endif
}
float getSpotAttenuation( const in float coneCosine, const in float penumbraCosine, const in float angleCosine ) {
	return smoothstep( coneCosine, penumbraCosine, angleCosine );
}
#if NUM_DIR_LIGHTS > 0
	struct DirectionalLight {
		vec3 direction;
		vec3 color;
	};
	uniform DirectionalLight directionalLights[ NUM_DIR_LIGHTS ];
	void getDirectionalLightInfo( const in DirectionalLight directionalLight, const in GeometricContext geometry, out IncidentLight light ) {
		light.color = directionalLight.color;
		light.direction = directionalLight.direction;
		light.visible = true;
	}
#endif
#if NUM_POINT_LIGHTS > 0
	struct PointLight {
		vec3 position;
		vec3 color;
		float distance;
		float decay;
	};
	uniform PointLight pointLights[ NUM_POINT_LIGHTS ];
	void getPointLightInfo( const in PointLight pointLight, const in GeometricContext geometry, out IncidentLight light ) {
		vec3 lVector = pointLight.position - geometry.position;
		light.direction = normalize( lVector );
		float lightDistance = length( lVector );
		light.color = pointLight.color;
		light.color *= getDistanceAttenuation( lightDistance, pointLight.distance, pointLight.decay );
		light.visible = ( light.color != vec3( 0.0 ) );
	}
#endif
#if NUM_SPOT_LIGHTS > 0
	struct SpotLight {
		vec3 position;
		vec3 direction;
		vec3 color;
		float distance;
		float decay;
		float coneCos;
		float penumbraCos;
	};
	uniform SpotLight spotLights[ NUM_SPOT_LIGHTS ];
	void getSpotLightInfo( const in SpotLight spotLight, const in GeometricContext geometry, out IncidentLight light ) {
		vec3 lVector = spotLight.position - geometry.position;
		light.direction = normalize( lVector );
		float angleCos = dot( light.direction, spotLight.direction );
		float spotAttenuation = getSpotAttenuation( spotLight.coneCos, spotLight.penumbraCos, angleCos );
		if ( spotAttenuation > 0.0 ) {
			float lightDistance = length( lVector );
			light.color = spotLight.color * spotAttenuation;
			light.color *= getDistanceAttenuation( lightDistance, spotLight.distance, spotLight.decay );
			light.visible = ( light.color != vec3( 0.0 ) );
		} else {
			light.color = vec3( 0.0 );
			light.visible = false;
		}
	}
#endif
#if NUM_RECT_AREA_LIGHTS > 0
	struct RectAreaLight {
		vec3 color;
		vec3 position;
		vec3 halfWidth;
		vec3 halfHeight;
	};
	uniform sampler2D ltc_1;	uniform sampler2D ltc_2;
	uniform RectAreaLight rectAreaLights[ NUM_RECT_AREA_LIGHTS ];
#endif
#if NUM_HEMI_LIGHTS > 0
	struct HemisphereLight {
		vec3 direction;
		vec3 skyColor;
		vec3 groundColor;
	};
	uniform HemisphereLight hemisphereLights[ NUM_HEMI_LIGHTS ];
	vec3 getHemisphereLightIrradiance( const in HemisphereLight hemiLight, const in vec3 normal ) {
		float dotNL = dot( normal, hemiLight.direction );
		float hemiDiffuseWeight = 0.5 * dotNL + 0.5;
		vec3 irradiance = mix( hemiLight.groundColor, hemiLight.skyColor, hemiDiffuseWeight );
		return irradiance;
	}
#endif`,Yd=`#if defined( USE_ENVMAP )
	vec3 getIBLIrradiance( const in vec3 normal ) {
		#if defined( ENVMAP_TYPE_CUBE_UV )
			vec3 worldNormal = inverseTransformDirection( normal, viewMatrix );
			vec4 envMapColor = textureCubeUV( envMap, worldNormal, 1.0 );
			return PI * envMapColor.rgb * envMapIntensity;
		#else
			return vec3( 0.0 );
		#endif
	}
	vec3 getIBLRadiance( const in vec3 viewDir, const in vec3 normal, const in float roughness ) {
		#if defined( ENVMAP_TYPE_CUBE_UV )
			vec3 reflectVec = reflect( - viewDir, normal );
			reflectVec = normalize( mix( reflectVec, normal, roughness * roughness) );
			reflectVec = inverseTransformDirection( reflectVec, viewMatrix );
			vec4 envMapColor = textureCubeUV( envMap, reflectVec, roughness );
			return envMapColor.rgb * envMapIntensity;
		#else
			return vec3( 0.0 );
		#endif
	}
#endif`,Zd=`ToonMaterial material;
material.diffuseColor = diffuseColor.rgb;`,Kd=`varying vec3 vViewPosition;
struct ToonMaterial {
	vec3 diffuseColor;
};
void RE_Direct_Toon( const in IncidentLight directLight, const in GeometricContext geometry, const in ToonMaterial material, inout ReflectedLight reflectedLight ) {
	vec3 irradiance = getGradientIrradiance( geometry.normal, directLight.direction ) * directLight.color;
	reflectedLight.directDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
void RE_IndirectDiffuse_Toon( const in vec3 irradiance, const in GeometricContext geometry, const in ToonMaterial material, inout ReflectedLight reflectedLight ) {
	reflectedLight.indirectDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
#define RE_Direct				RE_Direct_Toon
#define RE_IndirectDiffuse		RE_IndirectDiffuse_Toon`,Qd=`BlinnPhongMaterial material;
material.diffuseColor = diffuseColor.rgb;
material.specularColor = specular;
material.specularShininess = shininess;
material.specularStrength = specularStrength;`,Jd=`varying vec3 vViewPosition;
struct BlinnPhongMaterial {
	vec3 diffuseColor;
	vec3 specularColor;
	float specularShininess;
	float specularStrength;
};
void RE_Direct_BlinnPhong( const in IncidentLight directLight, const in GeometricContext geometry, const in BlinnPhongMaterial material, inout ReflectedLight reflectedLight ) {
	float dotNL = saturate( dot( geometry.normal, directLight.direction ) );
	vec3 irradiance = dotNL * directLight.color;
	reflectedLight.directDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
	reflectedLight.directSpecular += irradiance * BRDF_BlinnPhong( directLight.direction, geometry.viewDir, geometry.normal, material.specularColor, material.specularShininess ) * material.specularStrength;
}
void RE_IndirectDiffuse_BlinnPhong( const in vec3 irradiance, const in GeometricContext geometry, const in BlinnPhongMaterial material, inout ReflectedLight reflectedLight ) {
	reflectedLight.indirectDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
#define RE_Direct				RE_Direct_BlinnPhong
#define RE_IndirectDiffuse		RE_IndirectDiffuse_BlinnPhong`,$d=`PhysicalMaterial material;
material.diffuseColor = diffuseColor.rgb * ( 1.0 - metalnessFactor );
vec3 dxy = max( abs( dFdx( geometryNormal ) ), abs( dFdy( geometryNormal ) ) );
float geometryRoughness = max( max( dxy.x, dxy.y ), dxy.z );
material.roughness = max( roughnessFactor, 0.0525 );material.roughness += geometryRoughness;
material.roughness = min( material.roughness, 1.0 );
#ifdef IOR
	material.ior = ior;
	#ifdef USE_SPECULAR
		float specularIntensityFactor = specularIntensity;
		vec3 specularColorFactor = specularColor;
		#ifdef USE_SPECULAR_COLORMAP
			specularColorFactor *= texture2D( specularColorMap, vSpecularColorMapUv ).rgb;
		#endif
		#ifdef USE_SPECULAR_INTENSITYMAP
			specularIntensityFactor *= texture2D( specularIntensityMap, vSpecularIntensityMapUv ).a;
		#endif
		material.specularF90 = mix( specularIntensityFactor, 1.0, metalnessFactor );
	#else
		float specularIntensityFactor = 1.0;
		vec3 specularColorFactor = vec3( 1.0 );
		material.specularF90 = 1.0;
	#endif
	material.specularColor = mix( min( pow2( ( material.ior - 1.0 ) / ( material.ior + 1.0 ) ) * specularColorFactor, vec3( 1.0 ) ) * specularIntensityFactor, diffuseColor.rgb, metalnessFactor );
#else
	material.specularColor = mix( vec3( 0.04 ), diffuseColor.rgb, metalnessFactor );
	material.specularF90 = 1.0;
#endif
#ifdef USE_CLEARCOAT
	material.clearcoat = clearcoat;
	material.clearcoatRoughness = clearcoatRoughness;
	material.clearcoatF0 = vec3( 0.04 );
	material.clearcoatF90 = 1.0;
	#ifdef USE_CLEARCOATMAP
		material.clearcoat *= texture2D( clearcoatMap, vClearcoatMapUv ).x;
	#endif
	#ifdef USE_CLEARCOAT_ROUGHNESSMAP
		material.clearcoatRoughness *= texture2D( clearcoatRoughnessMap, vClearcoatRoughnessMapUv ).y;
	#endif
	material.clearcoat = saturate( material.clearcoat );	material.clearcoatRoughness = max( material.clearcoatRoughness, 0.0525 );
	material.clearcoatRoughness += geometryRoughness;
	material.clearcoatRoughness = min( material.clearcoatRoughness, 1.0 );
#endif
#ifdef USE_IRIDESCENCE
	material.iridescence = iridescence;
	material.iridescenceIOR = iridescenceIOR;
	#ifdef USE_IRIDESCENCEMAP
		material.iridescence *= texture2D( iridescenceMap, vIridescenceMapUv ).r;
	#endif
	#ifdef USE_IRIDESCENCE_THICKNESSMAP
		material.iridescenceThickness = (iridescenceThicknessMaximum - iridescenceThicknessMinimum) * texture2D( iridescenceThicknessMap, vIridescenceThicknessMapUv ).g + iridescenceThicknessMinimum;
	#else
		material.iridescenceThickness = iridescenceThicknessMaximum;
	#endif
#endif
#ifdef USE_SHEEN
	material.sheenColor = sheenColor;
	#ifdef USE_SHEEN_COLORMAP
		material.sheenColor *= texture2D( sheenColorMap, vSheenColorMapUv ).rgb;
	#endif
	material.sheenRoughness = clamp( sheenRoughness, 0.07, 1.0 );
	#ifdef USE_SHEEN_ROUGHNESSMAP
		material.sheenRoughness *= texture2D( sheenRoughnessMap, vSheenRoughnessMapUv ).a;
	#endif
#endif`,ep=`struct PhysicalMaterial {
	vec3 diffuseColor;
	float roughness;
	vec3 specularColor;
	float specularF90;
	#ifdef USE_CLEARCOAT
		float clearcoat;
		float clearcoatRoughness;
		vec3 clearcoatF0;
		float clearcoatF90;
	#endif
	#ifdef USE_IRIDESCENCE
		float iridescence;
		float iridescenceIOR;
		float iridescenceThickness;
		vec3 iridescenceFresnel;
		vec3 iridescenceF0;
	#endif
	#ifdef USE_SHEEN
		vec3 sheenColor;
		float sheenRoughness;
	#endif
	#ifdef IOR
		float ior;
	#endif
	#ifdef USE_TRANSMISSION
		float transmission;
		float transmissionAlpha;
		float thickness;
		float attenuationDistance;
		vec3 attenuationColor;
	#endif
};
vec3 clearcoatSpecular = vec3( 0.0 );
vec3 sheenSpecular = vec3( 0.0 );
vec3 Schlick_to_F0( const in vec3 f, const in float f90, const in float dotVH ) {
    float x = clamp( 1.0 - dotVH, 0.0, 1.0 );
    float x2 = x * x;
    float x5 = clamp( x * x2 * x2, 0.0, 0.9999 );
    return ( f - vec3( f90 ) * x5 ) / ( 1.0 - x5 );
}
float V_GGX_SmithCorrelated( const in float alpha, const in float dotNL, const in float dotNV ) {
	float a2 = pow2( alpha );
	float gv = dotNL * sqrt( a2 + ( 1.0 - a2 ) * pow2( dotNV ) );
	float gl = dotNV * sqrt( a2 + ( 1.0 - a2 ) * pow2( dotNL ) );
	return 0.5 / max( gv + gl, EPSILON );
}
float D_GGX( const in float alpha, const in float dotNH ) {
	float a2 = pow2( alpha );
	float denom = pow2( dotNH ) * ( a2 - 1.0 ) + 1.0;
	return RECIPROCAL_PI * a2 / pow2( denom );
}
#ifdef USE_CLEARCOAT
	vec3 BRDF_GGX_Clearcoat( const in vec3 lightDir, const in vec3 viewDir, const in vec3 normal, const in PhysicalMaterial material) {
		vec3 f0 = material.clearcoatF0;
		float f90 = material.clearcoatF90;
		float roughness = material.clearcoatRoughness;
		float alpha = pow2( roughness );
		vec3 halfDir = normalize( lightDir + viewDir );
		float dotNL = saturate( dot( normal, lightDir ) );
		float dotNV = saturate( dot( normal, viewDir ) );
		float dotNH = saturate( dot( normal, halfDir ) );
		float dotVH = saturate( dot( viewDir, halfDir ) );
		vec3 F = F_Schlick( f0, f90, dotVH );
		float V = V_GGX_SmithCorrelated( alpha, dotNL, dotNV );
		float D = D_GGX( alpha, dotNH );
		return F * ( V * D );
	}
#endif
vec3 BRDF_GGX( const in vec3 lightDir, const in vec3 viewDir, const in vec3 normal, const in PhysicalMaterial material ) {
	vec3 f0 = material.specularColor;
	float f90 = material.specularF90;
	float roughness = material.roughness;
	float alpha = pow2( roughness );
	vec3 halfDir = normalize( lightDir + viewDir );
	float dotNL = saturate( dot( normal, lightDir ) );
	float dotNV = saturate( dot( normal, viewDir ) );
	float dotNH = saturate( dot( normal, halfDir ) );
	float dotVH = saturate( dot( viewDir, halfDir ) );
	vec3 F = F_Schlick( f0, f90, dotVH );
	#ifdef USE_IRIDESCENCE
		F = mix( F, material.iridescenceFresnel, material.iridescence );
	#endif
	float V = V_GGX_SmithCorrelated( alpha, dotNL, dotNV );
	float D = D_GGX( alpha, dotNH );
	return F * ( V * D );
}
vec2 LTC_Uv( const in vec3 N, const in vec3 V, const in float roughness ) {
	const float LUT_SIZE = 64.0;
	const float LUT_SCALE = ( LUT_SIZE - 1.0 ) / LUT_SIZE;
	const float LUT_BIAS = 0.5 / LUT_SIZE;
	float dotNV = saturate( dot( N, V ) );
	vec2 uv = vec2( roughness, sqrt( 1.0 - dotNV ) );
	uv = uv * LUT_SCALE + LUT_BIAS;
	return uv;
}
float LTC_ClippedSphereFormFactor( const in vec3 f ) {
	float l = length( f );
	return max( ( l * l + f.z ) / ( l + 1.0 ), 0.0 );
}
vec3 LTC_EdgeVectorFormFactor( const in vec3 v1, const in vec3 v2 ) {
	float x = dot( v1, v2 );
	float y = abs( x );
	float a = 0.8543985 + ( 0.4965155 + 0.0145206 * y ) * y;
	float b = 3.4175940 + ( 4.1616724 + y ) * y;
	float v = a / b;
	float theta_sintheta = ( x > 0.0 ) ? v : 0.5 * inversesqrt( max( 1.0 - x * x, 1e-7 ) ) - v;
	return cross( v1, v2 ) * theta_sintheta;
}
vec3 LTC_Evaluate( const in vec3 N, const in vec3 V, const in vec3 P, const in mat3 mInv, const in vec3 rectCoords[ 4 ] ) {
	vec3 v1 = rectCoords[ 1 ] - rectCoords[ 0 ];
	vec3 v2 = rectCoords[ 3 ] - rectCoords[ 0 ];
	vec3 lightNormal = cross( v1, v2 );
	if( dot( lightNormal, P - rectCoords[ 0 ] ) < 0.0 ) return vec3( 0.0 );
	vec3 T1, T2;
	T1 = normalize( V - N * dot( V, N ) );
	T2 = - cross( N, T1 );
	mat3 mat = mInv * transposeMat3( mat3( T1, T2, N ) );
	vec3 coords[ 4 ];
	coords[ 0 ] = mat * ( rectCoords[ 0 ] - P );
	coords[ 1 ] = mat * ( rectCoords[ 1 ] - P );
	coords[ 2 ] = mat * ( rectCoords[ 2 ] - P );
	coords[ 3 ] = mat * ( rectCoords[ 3 ] - P );
	coords[ 0 ] = normalize( coords[ 0 ] );
	coords[ 1 ] = normalize( coords[ 1 ] );
	coords[ 2 ] = normalize( coords[ 2 ] );
	coords[ 3 ] = normalize( coords[ 3 ] );
	vec3 vectorFormFactor = vec3( 0.0 );
	vectorFormFactor += LTC_EdgeVectorFormFactor( coords[ 0 ], coords[ 1 ] );
	vectorFormFactor += LTC_EdgeVectorFormFactor( coords[ 1 ], coords[ 2 ] );
	vectorFormFactor += LTC_EdgeVectorFormFactor( coords[ 2 ], coords[ 3 ] );
	vectorFormFactor += LTC_EdgeVectorFormFactor( coords[ 3 ], coords[ 0 ] );
	float result = LTC_ClippedSphereFormFactor( vectorFormFactor );
	return vec3( result );
}
#if defined( USE_SHEEN )
float D_Charlie( float roughness, float dotNH ) {
	float alpha = pow2( roughness );
	float invAlpha = 1.0 / alpha;
	float cos2h = dotNH * dotNH;
	float sin2h = max( 1.0 - cos2h, 0.0078125 );
	return ( 2.0 + invAlpha ) * pow( sin2h, invAlpha * 0.5 ) / ( 2.0 * PI );
}
float V_Neubelt( float dotNV, float dotNL ) {
	return saturate( 1.0 / ( 4.0 * ( dotNL + dotNV - dotNL * dotNV ) ) );
}
vec3 BRDF_Sheen( const in vec3 lightDir, const in vec3 viewDir, const in vec3 normal, vec3 sheenColor, const in float sheenRoughness ) {
	vec3 halfDir = normalize( lightDir + viewDir );
	float dotNL = saturate( dot( normal, lightDir ) );
	float dotNV = saturate( dot( normal, viewDir ) );
	float dotNH = saturate( dot( normal, halfDir ) );
	float D = D_Charlie( sheenRoughness, dotNH );
	float V = V_Neubelt( dotNV, dotNL );
	return sheenColor * ( D * V );
}
#endif
float IBLSheenBRDF( const in vec3 normal, const in vec3 viewDir, const in float roughness ) {
	float dotNV = saturate( dot( normal, viewDir ) );
	float r2 = roughness * roughness;
	float a = roughness < 0.25 ? -339.2 * r2 + 161.4 * roughness - 25.9 : -8.48 * r2 + 14.3 * roughness - 9.95;
	float b = roughness < 0.25 ? 44.0 * r2 - 23.7 * roughness + 3.26 : 1.97 * r2 - 3.27 * roughness + 0.72;
	float DG = exp( a * dotNV + b ) + ( roughness < 0.25 ? 0.0 : 0.1 * ( roughness - 0.25 ) );
	return saturate( DG * RECIPROCAL_PI );
}
vec2 DFGApprox( const in vec3 normal, const in vec3 viewDir, const in float roughness ) {
	float dotNV = saturate( dot( normal, viewDir ) );
	const vec4 c0 = vec4( - 1, - 0.0275, - 0.572, 0.022 );
	const vec4 c1 = vec4( 1, 0.0425, 1.04, - 0.04 );
	vec4 r = roughness * c0 + c1;
	float a004 = min( r.x * r.x, exp2( - 9.28 * dotNV ) ) * r.x + r.y;
	vec2 fab = vec2( - 1.04, 1.04 ) * a004 + r.zw;
	return fab;
}
vec3 EnvironmentBRDF( const in vec3 normal, const in vec3 viewDir, const in vec3 specularColor, const in float specularF90, const in float roughness ) {
	vec2 fab = DFGApprox( normal, viewDir, roughness );
	return specularColor * fab.x + specularF90 * fab.y;
}
#ifdef USE_IRIDESCENCE
void computeMultiscatteringIridescence( const in vec3 normal, const in vec3 viewDir, const in vec3 specularColor, const in float specularF90, const in float iridescence, const in vec3 iridescenceF0, const in float roughness, inout vec3 singleScatter, inout vec3 multiScatter ) {
#else
void computeMultiscattering( const in vec3 normal, const in vec3 viewDir, const in vec3 specularColor, const in float specularF90, const in float roughness, inout vec3 singleScatter, inout vec3 multiScatter ) {
#endif
	vec2 fab = DFGApprox( normal, viewDir, roughness );
	#ifdef USE_IRIDESCENCE
		vec3 Fr = mix( specularColor, iridescenceF0, iridescence );
	#else
		vec3 Fr = specularColor;
	#endif
	vec3 FssEss = Fr * fab.x + specularF90 * fab.y;
	float Ess = fab.x + fab.y;
	float Ems = 1.0 - Ess;
	vec3 Favg = Fr + ( 1.0 - Fr ) * 0.047619;	vec3 Fms = FssEss * Favg / ( 1.0 - Ems * Favg );
	singleScatter += FssEss;
	multiScatter += Fms * Ems;
}
#if NUM_RECT_AREA_LIGHTS > 0
	void RE_Direct_RectArea_Physical( const in RectAreaLight rectAreaLight, const in GeometricContext geometry, const in PhysicalMaterial material, inout ReflectedLight reflectedLight ) {
		vec3 normal = geometry.normal;
		vec3 viewDir = geometry.viewDir;
		vec3 position = geometry.position;
		vec3 lightPos = rectAreaLight.position;
		vec3 halfWidth = rectAreaLight.halfWidth;
		vec3 halfHeight = rectAreaLight.halfHeight;
		vec3 lightColor = rectAreaLight.color;
		float roughness = material.roughness;
		vec3 rectCoords[ 4 ];
		rectCoords[ 0 ] = lightPos + halfWidth - halfHeight;		rectCoords[ 1 ] = lightPos - halfWidth - halfHeight;
		rectCoords[ 2 ] = lightPos - halfWidth + halfHeight;
		rectCoords[ 3 ] = lightPos + halfWidth + halfHeight;
		vec2 uv = LTC_Uv( normal, viewDir, roughness );
		vec4 t1 = texture2D( ltc_1, uv );
		vec4 t2 = texture2D( ltc_2, uv );
		mat3 mInv = mat3(
			vec3( t1.x, 0, t1.y ),
			vec3(    0, 1,    0 ),
			vec3( t1.z, 0, t1.w )
		);
		vec3 fresnel = ( material.specularColor * t2.x + ( vec3( 1.0 ) - material.specularColor ) * t2.y );
		reflectedLight.directSpecular += lightColor * fresnel * LTC_Evaluate( normal, viewDir, position, mInv, rectCoords );
		reflectedLight.directDiffuse += lightColor * material.diffuseColor * LTC_Evaluate( normal, viewDir, position, mat3( 1.0 ), rectCoords );
	}
#endif
void RE_Direct_Physical( const in IncidentLight directLight, const in GeometricContext geometry, const in PhysicalMaterial material, inout ReflectedLight reflectedLight ) {
	float dotNL = saturate( dot( geometry.normal, directLight.direction ) );
	vec3 irradiance = dotNL * directLight.color;
	#ifdef USE_CLEARCOAT
		float dotNLcc = saturate( dot( geometry.clearcoatNormal, directLight.direction ) );
		vec3 ccIrradiance = dotNLcc * directLight.color;
		clearcoatSpecular += ccIrradiance * BRDF_GGX_Clearcoat( directLight.direction, geometry.viewDir, geometry.clearcoatNormal, material );
	#endif
	#ifdef USE_SHEEN
		sheenSpecular += irradiance * BRDF_Sheen( directLight.direction, geometry.viewDir, geometry.normal, material.sheenColor, material.sheenRoughness );
	#endif
	reflectedLight.directSpecular += irradiance * BRDF_GGX( directLight.direction, geometry.viewDir, geometry.normal, material );
	reflectedLight.directDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
void RE_IndirectDiffuse_Physical( const in vec3 irradiance, const in GeometricContext geometry, const in PhysicalMaterial material, inout ReflectedLight reflectedLight ) {
	reflectedLight.indirectDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
void RE_IndirectSpecular_Physical( const in vec3 radiance, const in vec3 irradiance, const in vec3 clearcoatRadiance, const in GeometricContext geometry, const in PhysicalMaterial material, inout ReflectedLight reflectedLight) {
	#ifdef USE_CLEARCOAT
		clearcoatSpecular += clearcoatRadiance * EnvironmentBRDF( geometry.clearcoatNormal, geometry.viewDir, material.clearcoatF0, material.clearcoatF90, material.clearcoatRoughness );
	#endif
	#ifdef USE_SHEEN
		sheenSpecular += irradiance * material.sheenColor * IBLSheenBRDF( geometry.normal, geometry.viewDir, material.sheenRoughness );
	#endif
	vec3 singleScattering = vec3( 0.0 );
	vec3 multiScattering = vec3( 0.0 );
	vec3 cosineWeightedIrradiance = irradiance * RECIPROCAL_PI;
	#ifdef USE_IRIDESCENCE
		computeMultiscatteringIridescence( geometry.normal, geometry.viewDir, material.specularColor, material.specularF90, material.iridescence, material.iridescenceFresnel, material.roughness, singleScattering, multiScattering );
	#else
		computeMultiscattering( geometry.normal, geometry.viewDir, material.specularColor, material.specularF90, material.roughness, singleScattering, multiScattering );
	#endif
	vec3 totalScattering = singleScattering + multiScattering;
	vec3 diffuse = material.diffuseColor * ( 1.0 - max( max( totalScattering.r, totalScattering.g ), totalScattering.b ) );
	reflectedLight.indirectSpecular += radiance * singleScattering;
	reflectedLight.indirectSpecular += multiScattering * cosineWeightedIrradiance;
	reflectedLight.indirectDiffuse += diffuse * cosineWeightedIrradiance;
}
#define RE_Direct				RE_Direct_Physical
#define RE_Direct_RectArea		RE_Direct_RectArea_Physical
#define RE_IndirectDiffuse		RE_IndirectDiffuse_Physical
#define RE_IndirectSpecular		RE_IndirectSpecular_Physical
float computeSpecularOcclusion( const in float dotNV, const in float ambientOcclusion, const in float roughness ) {
	return saturate( pow( dotNV + ambientOcclusion, exp2( - 16.0 * roughness - 1.0 ) ) - 1.0 + ambientOcclusion );
}`,tp=`
GeometricContext geometry;
geometry.position = - vViewPosition;
geometry.normal = normal;
geometry.viewDir = ( isOrthographic ) ? vec3( 0, 0, 1 ) : normalize( vViewPosition );
#ifdef USE_CLEARCOAT
	geometry.clearcoatNormal = clearcoatNormal;
#endif
#ifdef USE_IRIDESCENCE
	float dotNVi = saturate( dot( normal, geometry.viewDir ) );
	if ( material.iridescenceThickness == 0.0 ) {
		material.iridescence = 0.0;
	} else {
		material.iridescence = saturate( material.iridescence );
	}
	if ( material.iridescence > 0.0 ) {
		material.iridescenceFresnel = evalIridescence( 1.0, material.iridescenceIOR, dotNVi, material.iridescenceThickness, material.specularColor );
		material.iridescenceF0 = Schlick_to_F0( material.iridescenceFresnel, 1.0, dotNVi );
	}
#endif
IncidentLight directLight;
#if ( NUM_POINT_LIGHTS > 0 ) && defined( RE_Direct )
	PointLight pointLight;
	#if defined( USE_SHADOWMAP ) && NUM_POINT_LIGHT_SHADOWS > 0
	PointLightShadow pointLightShadow;
	#endif
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_POINT_LIGHTS; i ++ ) {
		pointLight = pointLights[ i ];
		getPointLightInfo( pointLight, geometry, directLight );
		#if defined( USE_SHADOWMAP ) && ( UNROLLED_LOOP_INDEX < NUM_POINT_LIGHT_SHADOWS )
		pointLightShadow = pointLightShadows[ i ];
		directLight.color *= ( directLight.visible && receiveShadow ) ? getPointShadow( pointShadowMap[ i ], pointLightShadow.shadowMapSize, pointLightShadow.shadowBias, pointLightShadow.shadowRadius, vPointShadowCoord[ i ], pointLightShadow.shadowCameraNear, pointLightShadow.shadowCameraFar ) : 1.0;
		#endif
		RE_Direct( directLight, geometry, material, reflectedLight );
	}
	#pragma unroll_loop_end
#endif
#if ( NUM_SPOT_LIGHTS > 0 ) && defined( RE_Direct )
	SpotLight spotLight;
	vec4 spotColor;
	vec3 spotLightCoord;
	bool inSpotLightMap;
	#if defined( USE_SHADOWMAP ) && NUM_SPOT_LIGHT_SHADOWS > 0
	SpotLightShadow spotLightShadow;
	#endif
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_SPOT_LIGHTS; i ++ ) {
		spotLight = spotLights[ i ];
		getSpotLightInfo( spotLight, geometry, directLight );
		#if ( UNROLLED_LOOP_INDEX < NUM_SPOT_LIGHT_SHADOWS_WITH_MAPS )
		#define SPOT_LIGHT_MAP_INDEX UNROLLED_LOOP_INDEX
		#elif ( UNROLLED_LOOP_INDEX < NUM_SPOT_LIGHT_SHADOWS )
		#define SPOT_LIGHT_MAP_INDEX NUM_SPOT_LIGHT_MAPS
		#else
		#define SPOT_LIGHT_MAP_INDEX ( UNROLLED_LOOP_INDEX - NUM_SPOT_LIGHT_SHADOWS + NUM_SPOT_LIGHT_SHADOWS_WITH_MAPS )
		#endif
		#if ( SPOT_LIGHT_MAP_INDEX < NUM_SPOT_LIGHT_MAPS )
			spotLightCoord = vSpotLightCoord[ i ].xyz / vSpotLightCoord[ i ].w;
			inSpotLightMap = all( lessThan( abs( spotLightCoord * 2. - 1. ), vec3( 1.0 ) ) );
			spotColor = texture2D( spotLightMap[ SPOT_LIGHT_MAP_INDEX ], spotLightCoord.xy );
			directLight.color = inSpotLightMap ? directLight.color * spotColor.rgb : directLight.color;
		#endif
		#undef SPOT_LIGHT_MAP_INDEX
		#if defined( USE_SHADOWMAP ) && ( UNROLLED_LOOP_INDEX < NUM_SPOT_LIGHT_SHADOWS )
		spotLightShadow = spotLightShadows[ i ];
		directLight.color *= ( directLight.visible && receiveShadow ) ? getShadow( spotShadowMap[ i ], spotLightShadow.shadowMapSize, spotLightShadow.shadowBias, spotLightShadow.shadowRadius, vSpotLightCoord[ i ] ) : 1.0;
		#endif
		RE_Direct( directLight, geometry, material, reflectedLight );
	}
	#pragma unroll_loop_end
#endif
#if ( NUM_DIR_LIGHTS > 0 ) && defined( RE_Direct )
	DirectionalLight directionalLight;
	#if defined( USE_SHADOWMAP ) && NUM_DIR_LIGHT_SHADOWS > 0
	DirectionalLightShadow directionalLightShadow;
	#endif
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_DIR_LIGHTS; i ++ ) {
		directionalLight = directionalLights[ i ];
		getDirectionalLightInfo( directionalLight, geometry, directLight );
		#if defined( USE_SHADOWMAP ) && ( UNROLLED_LOOP_INDEX < NUM_DIR_LIGHT_SHADOWS )
		directionalLightShadow = directionalLightShadows[ i ];
		directLight.color *= ( directLight.visible && receiveShadow ) ? getShadow( directionalShadowMap[ i ], directionalLightShadow.shadowMapSize, directionalLightShadow.shadowBias, directionalLightShadow.shadowRadius, vDirectionalShadowCoord[ i ] ) : 1.0;
		#endif
		RE_Direct( directLight, geometry, material, reflectedLight );
	}
	#pragma unroll_loop_end
#endif
#if ( NUM_RECT_AREA_LIGHTS > 0 ) && defined( RE_Direct_RectArea )
	RectAreaLight rectAreaLight;
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_RECT_AREA_LIGHTS; i ++ ) {
		rectAreaLight = rectAreaLights[ i ];
		RE_Direct_RectArea( rectAreaLight, geometry, material, reflectedLight );
	}
	#pragma unroll_loop_end
#endif
#if defined( RE_IndirectDiffuse )
	vec3 iblIrradiance = vec3( 0.0 );
	vec3 irradiance = getAmbientLightIrradiance( ambientLightColor );
	irradiance += getLightProbeIrradiance( lightProbe, geometry.normal );
	#if ( NUM_HEMI_LIGHTS > 0 )
		#pragma unroll_loop_start
		for ( int i = 0; i < NUM_HEMI_LIGHTS; i ++ ) {
			irradiance += getHemisphereLightIrradiance( hemisphereLights[ i ], geometry.normal );
		}
		#pragma unroll_loop_end
	#endif
#endif
#if defined( RE_IndirectSpecular )
	vec3 radiance = vec3( 0.0 );
	vec3 clearcoatRadiance = vec3( 0.0 );
#endif`,np=`#if defined( RE_IndirectDiffuse )
	#ifdef USE_LIGHTMAP
		vec4 lightMapTexel = texture2D( lightMap, vLightMapUv );
		vec3 lightMapIrradiance = lightMapTexel.rgb * lightMapIntensity;
		irradiance += lightMapIrradiance;
	#endif
	#if defined( USE_ENVMAP ) && defined( STANDARD ) && defined( ENVMAP_TYPE_CUBE_UV )
		iblIrradiance += getIBLIrradiance( geometry.normal );
	#endif
#endif
#if defined( USE_ENVMAP ) && defined( RE_IndirectSpecular )
	radiance += getIBLRadiance( geometry.viewDir, geometry.normal, material.roughness );
	#ifdef USE_CLEARCOAT
		clearcoatRadiance += getIBLRadiance( geometry.viewDir, geometry.clearcoatNormal, material.clearcoatRoughness );
	#endif
#endif`,ip=`#if defined( RE_IndirectDiffuse )
	RE_IndirectDiffuse( irradiance, geometry, material, reflectedLight );
#endif
#if defined( RE_IndirectSpecular )
	RE_IndirectSpecular( radiance, iblIrradiance, clearcoatRadiance, geometry, material, reflectedLight );
#endif`,sp=`#if defined( USE_LOGDEPTHBUF ) && defined( USE_LOGDEPTHBUF_EXT )
	gl_FragDepthEXT = vIsPerspective == 0.0 ? gl_FragCoord.z : log2( vFragDepth ) * logDepthBufFC * 0.5;
#endif`,rp=`#if defined( USE_LOGDEPTHBUF ) && defined( USE_LOGDEPTHBUF_EXT )
	uniform float logDepthBufFC;
	varying float vFragDepth;
	varying float vIsPerspective;
#endif`,op=`#ifdef USE_LOGDEPTHBUF
	#ifdef USE_LOGDEPTHBUF_EXT
		varying float vFragDepth;
		varying float vIsPerspective;
	#else
		uniform float logDepthBufFC;
	#endif
#endif`,ap=`#ifdef USE_LOGDEPTHBUF
	#ifdef USE_LOGDEPTHBUF_EXT
		vFragDepth = 1.0 + gl_Position.w;
		vIsPerspective = float( isPerspectiveMatrix( projectionMatrix ) );
	#else
		if ( isPerspectiveMatrix( projectionMatrix ) ) {
			gl_Position.z = log2( max( EPSILON, gl_Position.w + 1.0 ) ) * logDepthBufFC - 1.0;
			gl_Position.z *= gl_Position.w;
		}
	#endif
#endif`,lp=`#ifdef USE_MAP
	vec4 sampledDiffuseColor = texture2D( map, vMapUv );
	#ifdef DECODE_VIDEO_TEXTURE
		sampledDiffuseColor = vec4( mix( pow( sampledDiffuseColor.rgb * 0.9478672986 + vec3( 0.0521327014 ), vec3( 2.4 ) ), sampledDiffuseColor.rgb * 0.0773993808, vec3( lessThanEqual( sampledDiffuseColor.rgb, vec3( 0.04045 ) ) ) ), sampledDiffuseColor.w );
	#endif
	diffuseColor *= sampledDiffuseColor;
#endif`,cp=`#ifdef USE_MAP
	uniform sampler2D map;
#endif`,up=`#if defined( USE_MAP ) || defined( USE_ALPHAMAP )
	#if defined( USE_POINTS_UV )
		vec2 uv = vUv;
	#else
		vec2 uv = ( uvTransform * vec3( gl_PointCoord.x, 1.0 - gl_PointCoord.y, 1 ) ).xy;
	#endif
#endif
#ifdef USE_MAP
	diffuseColor *= texture2D( map, uv );
#endif
#ifdef USE_ALPHAMAP
	diffuseColor.a *= texture2D( alphaMap, uv ).g;
#endif`,fp=`#if defined( USE_POINTS_UV )
	varying vec2 vUv;
#else
	#if defined( USE_MAP ) || defined( USE_ALPHAMAP )
		uniform mat3 uvTransform;
	#endif
#endif
#ifdef USE_MAP
	uniform sampler2D map;
#endif
#ifdef USE_ALPHAMAP
	uniform sampler2D alphaMap;
#endif`,hp=`float metalnessFactor = metalness;
#ifdef USE_METALNESSMAP
	vec4 texelMetalness = texture2D( metalnessMap, vMetalnessMapUv );
	metalnessFactor *= texelMetalness.b;
#endif`,dp=`#ifdef USE_METALNESSMAP
	uniform sampler2D metalnessMap;
#endif`,pp=`#if defined( USE_MORPHCOLORS ) && defined( MORPHTARGETS_TEXTURE )
	vColor *= morphTargetBaseInfluence;
	for ( int i = 0; i < MORPHTARGETS_COUNT; i ++ ) {
		#if defined( USE_COLOR_ALPHA )
			if ( morphTargetInfluences[ i ] != 0.0 ) vColor += getMorph( gl_VertexID, i, 2 ) * morphTargetInfluences[ i ];
		#elif defined( USE_COLOR )
			if ( morphTargetInfluences[ i ] != 0.0 ) vColor += getMorph( gl_VertexID, i, 2 ).rgb * morphTargetInfluences[ i ];
		#endif
	}
#endif`,mp=`#ifdef USE_MORPHNORMALS
	objectNormal *= morphTargetBaseInfluence;
	#ifdef MORPHTARGETS_TEXTURE
		for ( int i = 0; i < MORPHTARGETS_COUNT; i ++ ) {
			if ( morphTargetInfluences[ i ] != 0.0 ) objectNormal += getMorph( gl_VertexID, i, 1 ).xyz * morphTargetInfluences[ i ];
		}
	#else
		objectNormal += morphNormal0 * morphTargetInfluences[ 0 ];
		objectNormal += morphNormal1 * morphTargetInfluences[ 1 ];
		objectNormal += morphNormal2 * morphTargetInfluences[ 2 ];
		objectNormal += morphNormal3 * morphTargetInfluences[ 3 ];
	#endif
#endif`,gp=`#ifdef USE_MORPHTARGETS
	uniform float morphTargetBaseInfluence;
	#ifdef MORPHTARGETS_TEXTURE
		uniform float morphTargetInfluences[ MORPHTARGETS_COUNT ];
		uniform sampler2DArray morphTargetsTexture;
		uniform ivec2 morphTargetsTextureSize;
		vec4 getMorph( const in int vertexIndex, const in int morphTargetIndex, const in int offset ) {
			int texelIndex = vertexIndex * MORPHTARGETS_TEXTURE_STRIDE + offset;
			int y = texelIndex / morphTargetsTextureSize.x;
			int x = texelIndex - y * morphTargetsTextureSize.x;
			ivec3 morphUV = ivec3( x, y, morphTargetIndex );
			return texelFetch( morphTargetsTexture, morphUV, 0 );
		}
	#else
		#ifndef USE_MORPHNORMALS
			uniform float morphTargetInfluences[ 8 ];
		#else
			uniform float morphTargetInfluences[ 4 ];
		#endif
	#endif
#endif`,_p=`#ifdef USE_MORPHTARGETS
	transformed *= morphTargetBaseInfluence;
	#ifdef MORPHTARGETS_TEXTURE
		for ( int i = 0; i < MORPHTARGETS_COUNT; i ++ ) {
			if ( morphTargetInfluences[ i ] != 0.0 ) transformed += getMorph( gl_VertexID, i, 0 ).xyz * morphTargetInfluences[ i ];
		}
	#else
		transformed += morphTarget0 * morphTargetInfluences[ 0 ];
		transformed += morphTarget1 * morphTargetInfluences[ 1 ];
		transformed += morphTarget2 * morphTargetInfluences[ 2 ];
		transformed += morphTarget3 * morphTargetInfluences[ 3 ];
		#ifndef USE_MORPHNORMALS
			transformed += morphTarget4 * morphTargetInfluences[ 4 ];
			transformed += morphTarget5 * morphTargetInfluences[ 5 ];
			transformed += morphTarget6 * morphTargetInfluences[ 6 ];
			transformed += morphTarget7 * morphTargetInfluences[ 7 ];
		#endif
	#endif
#endif`,vp=`float faceDirection = gl_FrontFacing ? 1.0 : - 1.0;
#ifdef FLAT_SHADED
	vec3 fdx = dFdx( vViewPosition );
	vec3 fdy = dFdy( vViewPosition );
	vec3 normal = normalize( cross( fdx, fdy ) );
#else
	vec3 normal = normalize( vNormal );
	#ifdef DOUBLE_SIDED
		normal *= faceDirection;
	#endif
#endif
#ifdef USE_NORMALMAP_TANGENTSPACE
	#ifdef USE_TANGENT
		mat3 tbn = mat3( normalize( vTangent ), normalize( vBitangent ), normal );
	#else
		mat3 tbn = getTangentFrame( - vViewPosition, normal, vNormalMapUv );
	#endif
	#if defined( DOUBLE_SIDED ) && ! defined( FLAT_SHADED )
		tbn[0] *= faceDirection;
		tbn[1] *= faceDirection;
	#endif
#endif
#ifdef USE_CLEARCOAT_NORMALMAP
	#ifdef USE_TANGENT
		mat3 tbn2 = mat3( normalize( vTangent ), normalize( vBitangent ), normal );
	#else
		mat3 tbn2 = getTangentFrame( - vViewPosition, normal, vClearcoatNormalMapUv );
	#endif
	#if defined( DOUBLE_SIDED ) && ! defined( FLAT_SHADED )
		tbn2[0] *= faceDirection;
		tbn2[1] *= faceDirection;
	#endif
#endif
vec3 geometryNormal = normal;`,bp=`#ifdef USE_NORMALMAP_OBJECTSPACE
	normal = texture2D( normalMap, vNormalMapUv ).xyz * 2.0 - 1.0;
	#ifdef FLIP_SIDED
		normal = - normal;
	#endif
	#ifdef DOUBLE_SIDED
		normal = normal * faceDirection;
	#endif
	normal = normalize( normalMatrix * normal );
#elif defined( USE_NORMALMAP_TANGENTSPACE )
	vec3 mapN = texture2D( normalMap, vNormalMapUv ).xyz * 2.0 - 1.0;
	mapN.xy *= normalScale;
	normal = normalize( tbn * mapN );
#elif defined( USE_BUMPMAP )
	normal = perturbNormalArb( - vViewPosition, normal, dHdxy_fwd(), faceDirection );
#endif`,Mp=`#ifndef FLAT_SHADED
	varying vec3 vNormal;
	#ifdef USE_TANGENT
		varying vec3 vTangent;
		varying vec3 vBitangent;
	#endif
#endif`,xp=`#ifndef FLAT_SHADED
	varying vec3 vNormal;
	#ifdef USE_TANGENT
		varying vec3 vTangent;
		varying vec3 vBitangent;
	#endif
#endif`,Sp=`#ifndef FLAT_SHADED
	vNormal = normalize( transformedNormal );
	#ifdef USE_TANGENT
		vTangent = normalize( transformedTangent );
		vBitangent = normalize( cross( vNormal, vTangent ) * tangent.w );
	#endif
#endif`,yp=`#ifdef USE_NORMALMAP
	uniform sampler2D normalMap;
	uniform vec2 normalScale;
#endif
#ifdef USE_NORMALMAP_OBJECTSPACE
	uniform mat3 normalMatrix;
#endif
#if ! defined ( USE_TANGENT ) && ( defined ( USE_NORMALMAP_TANGENTSPACE ) || defined ( USE_CLEARCOAT_NORMALMAP ) )
	mat3 getTangentFrame( vec3 eye_pos, vec3 surf_norm, vec2 uv ) {
		vec3 q0 = dFdx( eye_pos.xyz );
		vec3 q1 = dFdy( eye_pos.xyz );
		vec2 st0 = dFdx( uv.st );
		vec2 st1 = dFdy( uv.st );
		vec3 N = surf_norm;
		vec3 q1perp = cross( q1, N );
		vec3 q0perp = cross( N, q0 );
		vec3 T = q1perp * st0.x + q0perp * st1.x;
		vec3 B = q1perp * st0.y + q0perp * st1.y;
		float det = max( dot( T, T ), dot( B, B ) );
		float scale = ( det == 0.0 ) ? 0.0 : inversesqrt( det );
		return mat3( T * scale, B * scale, N );
	}
#endif`,wp=`#ifdef USE_CLEARCOAT
	vec3 clearcoatNormal = geometryNormal;
#endif`,Ep=`#ifdef USE_CLEARCOAT_NORMALMAP
	vec3 clearcoatMapN = texture2D( clearcoatNormalMap, vClearcoatNormalMapUv ).xyz * 2.0 - 1.0;
	clearcoatMapN.xy *= clearcoatNormalScale;
	clearcoatNormal = normalize( tbn2 * clearcoatMapN );
#endif`,Tp=`#ifdef USE_CLEARCOATMAP
	uniform sampler2D clearcoatMap;
#endif
#ifdef USE_CLEARCOAT_NORMALMAP
	uniform sampler2D clearcoatNormalMap;
	uniform vec2 clearcoatNormalScale;
#endif
#ifdef USE_CLEARCOAT_ROUGHNESSMAP
	uniform sampler2D clearcoatRoughnessMap;
#endif`,Ap=`#ifdef USE_IRIDESCENCEMAP
	uniform sampler2D iridescenceMap;
#endif
#ifdef USE_IRIDESCENCE_THICKNESSMAP
	uniform sampler2D iridescenceThicknessMap;
#endif`,Cp=`#ifdef OPAQUE
diffuseColor.a = 1.0;
#endif
#ifdef USE_TRANSMISSION
diffuseColor.a *= material.transmissionAlpha + 0.1;
#endif
gl_FragColor = vec4( outgoingLight, diffuseColor.a );`,Pp=`vec3 packNormalToRGB( const in vec3 normal ) {
	return normalize( normal ) * 0.5 + 0.5;
}
vec3 unpackRGBToNormal( const in vec3 rgb ) {
	return 2.0 * rgb.xyz - 1.0;
}
const float PackUpscale = 256. / 255.;const float UnpackDownscale = 255. / 256.;
const vec3 PackFactors = vec3( 256. * 256. * 256., 256. * 256., 256. );
const vec4 UnpackFactors = UnpackDownscale / vec4( PackFactors, 1. );
const float ShiftRight8 = 1. / 256.;
vec4 packDepthToRGBA( const in float v ) {
	vec4 r = vec4( fract( v * PackFactors ), v );
	r.yzw -= r.xyz * ShiftRight8;	return r * PackUpscale;
}
float unpackRGBAToDepth( const in vec4 v ) {
	return dot( v, UnpackFactors );
}
vec2 packDepthToRG( in highp float v ) {
	return packDepthToRGBA( v ).yx;
}
float unpackRGToDepth( const in highp vec2 v ) {
	return unpackRGBAToDepth( vec4( v.xy, 0.0, 0.0 ) );
}
vec4 pack2HalfToRGBA( vec2 v ) {
	vec4 r = vec4( v.x, fract( v.x * 255.0 ), v.y, fract( v.y * 255.0 ) );
	return vec4( r.x - r.y / 255.0, r.y, r.z - r.w / 255.0, r.w );
}
vec2 unpackRGBATo2Half( vec4 v ) {
	return vec2( v.x + ( v.y / 255.0 ), v.z + ( v.w / 255.0 ) );
}
float viewZToOrthographicDepth( const in float viewZ, const in float near, const in float far ) {
	return ( viewZ + near ) / ( near - far );
}
float orthographicDepthToViewZ( const in float depth, const in float near, const in float far ) {
	return depth * ( near - far ) - near;
}
float viewZToPerspectiveDepth( const in float viewZ, const in float near, const in float far ) {
	return ( ( near + viewZ ) * far ) / ( ( far - near ) * viewZ );
}
float perspectiveDepthToViewZ( const in float depth, const in float near, const in float far ) {
	return ( near * far ) / ( ( far - near ) * depth - far );
}`,Lp=`#ifdef PREMULTIPLIED_ALPHA
	gl_FragColor.rgb *= gl_FragColor.a;
#endif`,Rp=`vec4 mvPosition = vec4( transformed, 1.0 );
#ifdef USE_INSTANCING
	mvPosition = instanceMatrix * mvPosition;
#endif
mvPosition = modelViewMatrix * mvPosition;
gl_Position = projectionMatrix * mvPosition;`,Dp=`#ifdef DITHERING
	gl_FragColor.rgb = dithering( gl_FragColor.rgb );
#endif`,Ip=`#ifdef DITHERING
	vec3 dithering( vec3 color ) {
		float grid_position = rand( gl_FragCoord.xy );
		vec3 dither_shift_RGB = vec3( 0.25 / 255.0, -0.25 / 255.0, 0.25 / 255.0 );
		dither_shift_RGB = mix( 2.0 * dither_shift_RGB, -2.0 * dither_shift_RGB, grid_position );
		return color + dither_shift_RGB;
	}
#endif`,Up=`float roughnessFactor = roughness;
#ifdef USE_ROUGHNESSMAP
	vec4 texelRoughness = texture2D( roughnessMap, vRoughnessMapUv );
	roughnessFactor *= texelRoughness.g;
#endif`,zp=`#ifdef USE_ROUGHNESSMAP
	uniform sampler2D roughnessMap;
#endif`,kp=`#if NUM_SPOT_LIGHT_COORDS > 0
	varying vec4 vSpotLightCoord[ NUM_SPOT_LIGHT_COORDS ];
#endif
#if NUM_SPOT_LIGHT_MAPS > 0
	uniform sampler2D spotLightMap[ NUM_SPOT_LIGHT_MAPS ];
#endif
#ifdef USE_SHADOWMAP
	#if NUM_DIR_LIGHT_SHADOWS > 0
		uniform sampler2D directionalShadowMap[ NUM_DIR_LIGHT_SHADOWS ];
		varying vec4 vDirectionalShadowCoord[ NUM_DIR_LIGHT_SHADOWS ];
		struct DirectionalLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
		};
		uniform DirectionalLightShadow directionalLightShadows[ NUM_DIR_LIGHT_SHADOWS ];
	#endif
	#if NUM_SPOT_LIGHT_SHADOWS > 0
		uniform sampler2D spotShadowMap[ NUM_SPOT_LIGHT_SHADOWS ];
		struct SpotLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
		};
		uniform SpotLightShadow spotLightShadows[ NUM_SPOT_LIGHT_SHADOWS ];
	#endif
	#if NUM_POINT_LIGHT_SHADOWS > 0
		uniform sampler2D pointShadowMap[ NUM_POINT_LIGHT_SHADOWS ];
		varying vec4 vPointShadowCoord[ NUM_POINT_LIGHT_SHADOWS ];
		struct PointLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
			float shadowCameraNear;
			float shadowCameraFar;
		};
		uniform PointLightShadow pointLightShadows[ NUM_POINT_LIGHT_SHADOWS ];
	#endif
	float texture2DCompare( sampler2D depths, vec2 uv, float compare ) {
		return step( compare, unpackRGBAToDepth( texture2D( depths, uv ) ) );
	}
	vec2 texture2DDistribution( sampler2D shadow, vec2 uv ) {
		return unpackRGBATo2Half( texture2D( shadow, uv ) );
	}
	float VSMShadow (sampler2D shadow, vec2 uv, float compare ){
		float occlusion = 1.0;
		vec2 distribution = texture2DDistribution( shadow, uv );
		float hard_shadow = step( compare , distribution.x );
		if (hard_shadow != 1.0 ) {
			float distance = compare - distribution.x ;
			float variance = max( 0.00000, distribution.y * distribution.y );
			float softness_probability = variance / (variance + distance * distance );			softness_probability = clamp( ( softness_probability - 0.3 ) / ( 0.95 - 0.3 ), 0.0, 1.0 );			occlusion = clamp( max( hard_shadow, softness_probability ), 0.0, 1.0 );
		}
		return occlusion;
	}
	float getShadow( sampler2D shadowMap, vec2 shadowMapSize, float shadowBias, float shadowRadius, vec4 shadowCoord ) {
		float shadow = 1.0;
		shadowCoord.xyz /= shadowCoord.w;
		shadowCoord.z += shadowBias;
		bool inFrustum = shadowCoord.x >= 0.0 && shadowCoord.x <= 1.0 && shadowCoord.y >= 0.0 && shadowCoord.y <= 1.0;
		bool frustumTest = inFrustum && shadowCoord.z <= 1.0;
		if ( frustumTest ) {
		#if defined( SHADOWMAP_TYPE_PCF )
			vec2 texelSize = vec2( 1.0 ) / shadowMapSize;
			float dx0 = - texelSize.x * shadowRadius;
			float dy0 = - texelSize.y * shadowRadius;
			float dx1 = + texelSize.x * shadowRadius;
			float dy1 = + texelSize.y * shadowRadius;
			float dx2 = dx0 / 2.0;
			float dy2 = dy0 / 2.0;
			float dx3 = dx1 / 2.0;
			float dy3 = dy1 / 2.0;
			shadow = (
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx0, dy0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( 0.0, dy0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx1, dy0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx2, dy2 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( 0.0, dy2 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx3, dy2 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx0, 0.0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx2, 0.0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy, shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx3, 0.0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx1, 0.0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx2, dy3 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( 0.0, dy3 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx3, dy3 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx0, dy1 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( 0.0, dy1 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx1, dy1 ), shadowCoord.z )
			) * ( 1.0 / 17.0 );
		#elif defined( SHADOWMAP_TYPE_PCF_SOFT )
			vec2 texelSize = vec2( 1.0 ) / shadowMapSize;
			float dx = texelSize.x;
			float dy = texelSize.y;
			vec2 uv = shadowCoord.xy;
			vec2 f = fract( uv * shadowMapSize + 0.5 );
			uv -= f * texelSize;
			shadow = (
				texture2DCompare( shadowMap, uv, shadowCoord.z ) +
				texture2DCompare( shadowMap, uv + vec2( dx, 0.0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, uv + vec2( 0.0, dy ), shadowCoord.z ) +
				texture2DCompare( shadowMap, uv + texelSize, shadowCoord.z ) +
				mix( texture2DCompare( shadowMap, uv + vec2( -dx, 0.0 ), shadowCoord.z ),
					 texture2DCompare( shadowMap, uv + vec2( 2.0 * dx, 0.0 ), shadowCoord.z ),
					 f.x ) +
				mix( texture2DCompare( shadowMap, uv + vec2( -dx, dy ), shadowCoord.z ),
					 texture2DCompare( shadowMap, uv + vec2( 2.0 * dx, dy ), shadowCoord.z ),
					 f.x ) +
				mix( texture2DCompare( shadowMap, uv + vec2( 0.0, -dy ), shadowCoord.z ),
					 texture2DCompare( shadowMap, uv + vec2( 0.0, 2.0 * dy ), shadowCoord.z ),
					 f.y ) +
				mix( texture2DCompare( shadowMap, uv + vec2( dx, -dy ), shadowCoord.z ),
					 texture2DCompare( shadowMap, uv + vec2( dx, 2.0 * dy ), shadowCoord.z ),
					 f.y ) +
				mix( mix( texture2DCompare( shadowMap, uv + vec2( -dx, -dy ), shadowCoord.z ),
						  texture2DCompare( shadowMap, uv + vec2( 2.0 * dx, -dy ), shadowCoord.z ),
						  f.x ),
					 mix( texture2DCompare( shadowMap, uv + vec2( -dx, 2.0 * dy ), shadowCoord.z ),
						  texture2DCompare( shadowMap, uv + vec2( 2.0 * dx, 2.0 * dy ), shadowCoord.z ),
						  f.x ),
					 f.y )
			) * ( 1.0 / 9.0 );
		#elif defined( SHADOWMAP_TYPE_VSM )
			shadow = VSMShadow( shadowMap, shadowCoord.xy, shadowCoord.z );
		#else
			shadow = texture2DCompare( shadowMap, shadowCoord.xy, shadowCoord.z );
		#endif
		}
		return shadow;
	}
	vec2 cubeToUV( vec3 v, float texelSizeY ) {
		vec3 absV = abs( v );
		float scaleToCube = 1.0 / max( absV.x, max( absV.y, absV.z ) );
		absV *= scaleToCube;
		v *= scaleToCube * ( 1.0 - 2.0 * texelSizeY );
		vec2 planar = v.xy;
		float almostATexel = 1.5 * texelSizeY;
		float almostOne = 1.0 - almostATexel;
		if ( absV.z >= almostOne ) {
			if ( v.z > 0.0 )
				planar.x = 4.0 - v.x;
		} else if ( absV.x >= almostOne ) {
			float signX = sign( v.x );
			planar.x = v.z * signX + 2.0 * signX;
		} else if ( absV.y >= almostOne ) {
			float signY = sign( v.y );
			planar.x = v.x + 2.0 * signY + 2.0;
			planar.y = v.z * signY - 2.0;
		}
		return vec2( 0.125, 0.25 ) * planar + vec2( 0.375, 0.75 );
	}
	float getPointShadow( sampler2D shadowMap, vec2 shadowMapSize, float shadowBias, float shadowRadius, vec4 shadowCoord, float shadowCameraNear, float shadowCameraFar ) {
		vec2 texelSize = vec2( 1.0 ) / ( shadowMapSize * vec2( 4.0, 2.0 ) );
		vec3 lightToPosition = shadowCoord.xyz;
		float dp = ( length( lightToPosition ) - shadowCameraNear ) / ( shadowCameraFar - shadowCameraNear );		dp += shadowBias;
		vec3 bd3D = normalize( lightToPosition );
		#if defined( SHADOWMAP_TYPE_PCF ) || defined( SHADOWMAP_TYPE_PCF_SOFT ) || defined( SHADOWMAP_TYPE_VSM )
			vec2 offset = vec2( - 1, 1 ) * shadowRadius * texelSize.y;
			return (
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.xyy, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.yyy, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.xyx, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.yyx, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.xxy, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.yxy, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.xxx, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.yxx, texelSize.y ), dp )
			) * ( 1.0 / 9.0 );
		#else
			return texture2DCompare( shadowMap, cubeToUV( bd3D, texelSize.y ), dp );
		#endif
	}
#endif`,Np=`#if NUM_SPOT_LIGHT_COORDS > 0
	uniform mat4 spotLightMatrix[ NUM_SPOT_LIGHT_COORDS ];
	varying vec4 vSpotLightCoord[ NUM_SPOT_LIGHT_COORDS ];
#endif
#ifdef USE_SHADOWMAP
	#if NUM_DIR_LIGHT_SHADOWS > 0
		uniform mat4 directionalShadowMatrix[ NUM_DIR_LIGHT_SHADOWS ];
		varying vec4 vDirectionalShadowCoord[ NUM_DIR_LIGHT_SHADOWS ];
		struct DirectionalLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
		};
		uniform DirectionalLightShadow directionalLightShadows[ NUM_DIR_LIGHT_SHADOWS ];
	#endif
	#if NUM_SPOT_LIGHT_SHADOWS > 0
		struct SpotLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
		};
		uniform SpotLightShadow spotLightShadows[ NUM_SPOT_LIGHT_SHADOWS ];
	#endif
	#if NUM_POINT_LIGHT_SHADOWS > 0
		uniform mat4 pointShadowMatrix[ NUM_POINT_LIGHT_SHADOWS ];
		varying vec4 vPointShadowCoord[ NUM_POINT_LIGHT_SHADOWS ];
		struct PointLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
			float shadowCameraNear;
			float shadowCameraFar;
		};
		uniform PointLightShadow pointLightShadows[ NUM_POINT_LIGHT_SHADOWS ];
	#endif
#endif`,Op=`#if ( defined( USE_SHADOWMAP ) && ( NUM_DIR_LIGHT_SHADOWS > 0 || NUM_POINT_LIGHT_SHADOWS > 0 ) ) || ( NUM_SPOT_LIGHT_COORDS > 0 )
	vec3 shadowWorldNormal = inverseTransformDirection( transformedNormal, viewMatrix );
	vec4 shadowWorldPosition;
#endif
#if defined( USE_SHADOWMAP )
	#if NUM_DIR_LIGHT_SHADOWS > 0
		#pragma unroll_loop_start
		for ( int i = 0; i < NUM_DIR_LIGHT_SHADOWS; i ++ ) {
			shadowWorldPosition = worldPosition + vec4( shadowWorldNormal * directionalLightShadows[ i ].shadowNormalBias, 0 );
			vDirectionalShadowCoord[ i ] = directionalShadowMatrix[ i ] * shadowWorldPosition;
		}
		#pragma unroll_loop_end
	#endif
	#if NUM_POINT_LIGHT_SHADOWS > 0
		#pragma unroll_loop_start
		for ( int i = 0; i < NUM_POINT_LIGHT_SHADOWS; i ++ ) {
			shadowWorldPosition = worldPosition + vec4( shadowWorldNormal * pointLightShadows[ i ].shadowNormalBias, 0 );
			vPointShadowCoord[ i ] = pointShadowMatrix[ i ] * shadowWorldPosition;
		}
		#pragma unroll_loop_end
	#endif
#endif
#if NUM_SPOT_LIGHT_COORDS > 0
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_SPOT_LIGHT_COORDS; i ++ ) {
		shadowWorldPosition = worldPosition;
		#if ( defined( USE_SHADOWMAP ) && UNROLLED_LOOP_INDEX < NUM_SPOT_LIGHT_SHADOWS )
			shadowWorldPosition.xyz += shadowWorldNormal * spotLightShadows[ i ].shadowNormalBias;
		#endif
		vSpotLightCoord[ i ] = spotLightMatrix[ i ] * shadowWorldPosition;
	}
	#pragma unroll_loop_end
#endif`,Fp=`float getShadowMask() {
	float shadow = 1.0;
	#ifdef USE_SHADOWMAP
	#if NUM_DIR_LIGHT_SHADOWS > 0
	DirectionalLightShadow directionalLight;
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_DIR_LIGHT_SHADOWS; i ++ ) {
		directionalLight = directionalLightShadows[ i ];
		shadow *= receiveShadow ? getShadow( directionalShadowMap[ i ], directionalLight.shadowMapSize, directionalLight.shadowBias, directionalLight.shadowRadius, vDirectionalShadowCoord[ i ] ) : 1.0;
	}
	#pragma unroll_loop_end
	#endif
	#if NUM_SPOT_LIGHT_SHADOWS > 0
	SpotLightShadow spotLight;
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_SPOT_LIGHT_SHADOWS; i ++ ) {
		spotLight = spotLightShadows[ i ];
		shadow *= receiveShadow ? getShadow( spotShadowMap[ i ], spotLight.shadowMapSize, spotLight.shadowBias, spotLight.shadowRadius, vSpotLightCoord[ i ] ) : 1.0;
	}
	#pragma unroll_loop_end
	#endif
	#if NUM_POINT_LIGHT_SHADOWS > 0
	PointLightShadow pointLight;
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_POINT_LIGHT_SHADOWS; i ++ ) {
		pointLight = pointLightShadows[ i ];
		shadow *= receiveShadow ? getPointShadow( pointShadowMap[ i ], pointLight.shadowMapSize, pointLight.shadowBias, pointLight.shadowRadius, vPointShadowCoord[ i ], pointLight.shadowCameraNear, pointLight.shadowCameraFar ) : 1.0;
	}
	#pragma unroll_loop_end
	#endif
	#endif
	return shadow;
}`,Bp=`#ifdef USE_SKINNING
	mat4 boneMatX = getBoneMatrix( skinIndex.x );
	mat4 boneMatY = getBoneMatrix( skinIndex.y );
	mat4 boneMatZ = getBoneMatrix( skinIndex.z );
	mat4 boneMatW = getBoneMatrix( skinIndex.w );
#endif`,Gp=`#ifdef USE_SKINNING
	uniform mat4 bindMatrix;
	uniform mat4 bindMatrixInverse;
	uniform highp sampler2D boneTexture;
	uniform int boneTextureSize;
	mat4 getBoneMatrix( const in float i ) {
		float j = i * 4.0;
		float x = mod( j, float( boneTextureSize ) );
		float y = floor( j / float( boneTextureSize ) );
		float dx = 1.0 / float( boneTextureSize );
		float dy = 1.0 / float( boneTextureSize );
		y = dy * ( y + 0.5 );
		vec4 v1 = texture2D( boneTexture, vec2( dx * ( x + 0.5 ), y ) );
		vec4 v2 = texture2D( boneTexture, vec2( dx * ( x + 1.5 ), y ) );
		vec4 v3 = texture2D( boneTexture, vec2( dx * ( x + 2.5 ), y ) );
		vec4 v4 = texture2D( boneTexture, vec2( dx * ( x + 3.5 ), y ) );
		mat4 bone = mat4( v1, v2, v3, v4 );
		return bone;
	}
#endif`,Hp=`#ifdef USE_SKINNING
	vec4 skinVertex = bindMatrix * vec4( transformed, 1.0 );
	vec4 skinned = vec4( 0.0 );
	skinned += boneMatX * skinVertex * skinWeight.x;
	skinned += boneMatY * skinVertex * skinWeight.y;
	skinned += boneMatZ * skinVertex * skinWeight.z;
	skinned += boneMatW * skinVertex * skinWeight.w;
	transformed = ( bindMatrixInverse * skinned ).xyz;
#endif`,Vp=`#ifdef USE_SKINNING
	mat4 skinMatrix = mat4( 0.0 );
	skinMatrix += skinWeight.x * boneMatX;
	skinMatrix += skinWeight.y * boneMatY;
	skinMatrix += skinWeight.z * boneMatZ;
	skinMatrix += skinWeight.w * boneMatW;
	skinMatrix = bindMatrixInverse * skinMatrix * bindMatrix;
	objectNormal = vec4( skinMatrix * vec4( objectNormal, 0.0 ) ).xyz;
	#ifdef USE_TANGENT
		objectTangent = vec4( skinMatrix * vec4( objectTangent, 0.0 ) ).xyz;
	#endif
#endif`,Wp=`float specularStrength;
#ifdef USE_SPECULARMAP
	vec4 texelSpecular = texture2D( specularMap, vSpecularMapUv );
	specularStrength = texelSpecular.r;
#else
	specularStrength = 1.0;
#endif`,jp=`#ifdef USE_SPECULARMAP
	uniform sampler2D specularMap;
#endif`,Xp=`#if defined( TONE_MAPPING )
	gl_FragColor.rgb = toneMapping( gl_FragColor.rgb );
#endif`,qp=`#ifndef saturate
#define saturate( a ) clamp( a, 0.0, 1.0 )
#endif
uniform float toneMappingExposure;
vec3 LinearToneMapping( vec3 color ) {
	return toneMappingExposure * color;
}
vec3 ReinhardToneMapping( vec3 color ) {
	color *= toneMappingExposure;
	return saturate( color / ( vec3( 1.0 ) + color ) );
}
vec3 OptimizedCineonToneMapping( vec3 color ) {
	color *= toneMappingExposure;
	color = max( vec3( 0.0 ), color - 0.004 );
	return pow( ( color * ( 6.2 * color + 0.5 ) ) / ( color * ( 6.2 * color + 1.7 ) + 0.06 ), vec3( 2.2 ) );
}
vec3 RRTAndODTFit( vec3 v ) {
	vec3 a = v * ( v + 0.0245786 ) - 0.000090537;
	vec3 b = v * ( 0.983729 * v + 0.4329510 ) + 0.238081;
	return a / b;
}
vec3 ACESFilmicToneMapping( vec3 color ) {
	const mat3 ACESInputMat = mat3(
		vec3( 0.59719, 0.07600, 0.02840 ),		vec3( 0.35458, 0.90834, 0.13383 ),
		vec3( 0.04823, 0.01566, 0.83777 )
	);
	const mat3 ACESOutputMat = mat3(
		vec3(  1.60475, -0.10208, -0.00327 ),		vec3( -0.53108,  1.10813, -0.07276 ),
		vec3( -0.07367, -0.00605,  1.07602 )
	);
	color *= toneMappingExposure / 0.6;
	color = ACESInputMat * color;
	color = RRTAndODTFit( color );
	color = ACESOutputMat * color;
	return saturate( color );
}
vec3 CustomToneMapping( vec3 color ) { return color; }`,Yp=`#ifdef USE_TRANSMISSION
	material.transmission = transmission;
	material.transmissionAlpha = 1.0;
	material.thickness = thickness;
	material.attenuationDistance = attenuationDistance;
	material.attenuationColor = attenuationColor;
	#ifdef USE_TRANSMISSIONMAP
		material.transmission *= texture2D( transmissionMap, vTransmissionMapUv ).r;
	#endif
	#ifdef USE_THICKNESSMAP
		material.thickness *= texture2D( thicknessMap, vThicknessMapUv ).g;
	#endif
	vec3 pos = vWorldPosition;
	vec3 v = normalize( cameraPosition - pos );
	vec3 n = inverseTransformDirection( normal, viewMatrix );
	vec4 transmission = getIBLVolumeRefraction(
		n, v, material.roughness, material.diffuseColor, material.specularColor, material.specularF90,
		pos, modelMatrix, viewMatrix, projectionMatrix, material.ior, material.thickness,
		material.attenuationColor, material.attenuationDistance );
	material.transmissionAlpha = mix( material.transmissionAlpha, transmission.a, material.transmission );
	totalDiffuse = mix( totalDiffuse, transmission.rgb, material.transmission );
#endif`,Zp=`#ifdef USE_TRANSMISSION
	uniform float transmission;
	uniform float thickness;
	uniform float attenuationDistance;
	uniform vec3 attenuationColor;
	#ifdef USE_TRANSMISSIONMAP
		uniform sampler2D transmissionMap;
	#endif
	#ifdef USE_THICKNESSMAP
		uniform sampler2D thicknessMap;
	#endif
	uniform vec2 transmissionSamplerSize;
	uniform sampler2D transmissionSamplerMap;
	uniform mat4 modelMatrix;
	uniform mat4 projectionMatrix;
	varying vec3 vWorldPosition;
	float w0( float a ) {
		return ( 1.0 / 6.0 ) * ( a * ( a * ( - a + 3.0 ) - 3.0 ) + 1.0 );
	}
	float w1( float a ) {
		return ( 1.0 / 6.0 ) * ( a *  a * ( 3.0 * a - 6.0 ) + 4.0 );
	}
	float w2( float a ){
		return ( 1.0 / 6.0 ) * ( a * ( a * ( - 3.0 * a + 3.0 ) + 3.0 ) + 1.0 );
	}
	float w3( float a ) {
		return ( 1.0 / 6.0 ) * ( a * a * a );
	}
	float g0( float a ) {
		return w0( a ) + w1( a );
	}
	float g1( float a ) {
		return w2( a ) + w3( a );
	}
	float h0( float a ) {
		return - 1.0 + w1( a ) / ( w0( a ) + w1( a ) );
	}
	float h1( float a ) {
		return 1.0 + w3( a ) / ( w2( a ) + w3( a ) );
	}
	vec4 bicubic( sampler2D tex, vec2 uv, vec4 texelSize, vec2 fullSize, float lod ) {
		uv = uv * texelSize.zw + 0.5;
		vec2 iuv = floor( uv );
		vec2 fuv = fract( uv );
		float g0x = g0( fuv.x );
		float g1x = g1( fuv.x );
		float h0x = h0( fuv.x );
		float h1x = h1( fuv.x );
		float h0y = h0( fuv.y );
		float h1y = h1( fuv.y );
		vec2 p0 = ( vec2( iuv.x + h0x, iuv.y + h0y ) - 0.5 ) * texelSize.xy;
		vec2 p1 = ( vec2( iuv.x + h1x, iuv.y + h0y ) - 0.5 ) * texelSize.xy;
		vec2 p2 = ( vec2( iuv.x + h0x, iuv.y + h1y ) - 0.5 ) * texelSize.xy;
		vec2 p3 = ( vec2( iuv.x + h1x, iuv.y + h1y ) - 0.5 ) * texelSize.xy;
		
		vec2 lodFudge = pow( 1.95, lod ) / fullSize;
		return g0( fuv.y ) * ( g0x * textureLod( tex, p0, lod ) + g1x * textureLod( tex, p1, lod ) ) +
			g1( fuv.y ) * ( g0x * textureLod( tex, p2, lod ) + g1x * textureLod( tex, p3, lod ) );
	}
	vec4 textureBicubic( sampler2D sampler, vec2 uv, float lod ) {
		vec2 fLodSize = vec2( textureSize( sampler, int( lod ) ) );
		vec2 cLodSize = vec2( textureSize( sampler, int( lod + 1.0 ) ) );
		vec2 fLodSizeInv = 1.0 / fLodSize;
		vec2 cLodSizeInv = 1.0 / cLodSize;
		vec2 fullSize = vec2( textureSize( sampler, 0 ) );
		vec4 fSample = bicubic( sampler, uv, vec4( fLodSizeInv, fLodSize ), fullSize, floor( lod ) );
		vec4 cSample = bicubic( sampler, uv, vec4( cLodSizeInv, cLodSize ), fullSize, ceil( lod ) );
		return mix( fSample, cSample, fract( lod ) );
	}
	vec3 getVolumeTransmissionRay( const in vec3 n, const in vec3 v, const in float thickness, const in float ior, const in mat4 modelMatrix ) {
		vec3 refractionVector = refract( - v, normalize( n ), 1.0 / ior );
		vec3 modelScale;
		modelScale.x = length( vec3( modelMatrix[ 0 ].xyz ) );
		modelScale.y = length( vec3( modelMatrix[ 1 ].xyz ) );
		modelScale.z = length( vec3( modelMatrix[ 2 ].xyz ) );
		return normalize( refractionVector ) * thickness * modelScale;
	}
	float applyIorToRoughness( const in float roughness, const in float ior ) {
		return roughness * clamp( ior * 2.0 - 2.0, 0.0, 1.0 );
	}
	vec4 getTransmissionSample( const in vec2 fragCoord, const in float roughness, const in float ior ) {
		float lod = log2( transmissionSamplerSize.x ) * applyIorToRoughness( roughness, ior );
		return textureBicubic( transmissionSamplerMap, fragCoord.xy, lod );
	}
	vec3 applyVolumeAttenuation( const in vec3 radiance, const in float transmissionDistance, const in vec3 attenuationColor, const in float attenuationDistance ) {
		if ( isinf( attenuationDistance ) ) {
			return radiance;
		} else {
			vec3 attenuationCoefficient = -log( attenuationColor ) / attenuationDistance;
			vec3 transmittance = exp( - attenuationCoefficient * transmissionDistance );			return transmittance * radiance;
		}
	}
	vec4 getIBLVolumeRefraction( const in vec3 n, const in vec3 v, const in float roughness, const in vec3 diffuseColor,
		const in vec3 specularColor, const in float specularF90, const in vec3 position, const in mat4 modelMatrix,
		const in mat4 viewMatrix, const in mat4 projMatrix, const in float ior, const in float thickness,
		const in vec3 attenuationColor, const in float attenuationDistance ) {
		vec3 transmissionRay = getVolumeTransmissionRay( n, v, thickness, ior, modelMatrix );
		vec3 refractedRayExit = position + transmissionRay;
		vec4 ndcPos = projMatrix * viewMatrix * vec4( refractedRayExit, 1.0 );
		vec2 refractionCoords = ndcPos.xy / ndcPos.w;
		refractionCoords += 1.0;
		refractionCoords /= 2.0;
		vec4 transmittedLight = getTransmissionSample( refractionCoords, roughness, ior );
		vec3 attenuatedColor = applyVolumeAttenuation( transmittedLight.rgb, length( transmissionRay ), attenuationColor, attenuationDistance );
		vec3 F = EnvironmentBRDF( n, v, specularColor, specularF90, roughness );
		return vec4( ( 1.0 - F ) * attenuatedColor * diffuseColor, transmittedLight.a );
	}
#endif`,Kp=`#ifdef USE_UV
	varying vec2 vUv;
#endif
#ifdef USE_MAP
	varying vec2 vMapUv;
#endif
#ifdef USE_ALPHAMAP
	varying vec2 vAlphaMapUv;
#endif
#ifdef USE_LIGHTMAP
	varying vec2 vLightMapUv;
#endif
#ifdef USE_AOMAP
	varying vec2 vAoMapUv;
#endif
#ifdef USE_BUMPMAP
	varying vec2 vBumpMapUv;
#endif
#ifdef USE_NORMALMAP
	varying vec2 vNormalMapUv;
#endif
#ifdef USE_EMISSIVEMAP
	varying vec2 vEmissiveMapUv;
#endif
#ifdef USE_METALNESSMAP
	varying vec2 vMetalnessMapUv;
#endif
#ifdef USE_ROUGHNESSMAP
	varying vec2 vRoughnessMapUv;
#endif
#ifdef USE_CLEARCOATMAP
	varying vec2 vClearcoatMapUv;
#endif
#ifdef USE_CLEARCOAT_NORMALMAP
	varying vec2 vClearcoatNormalMapUv;
#endif
#ifdef USE_CLEARCOAT_ROUGHNESSMAP
	varying vec2 vClearcoatRoughnessMapUv;
#endif
#ifdef USE_IRIDESCENCEMAP
	varying vec2 vIridescenceMapUv;
#endif
#ifdef USE_IRIDESCENCE_THICKNESSMAP
	varying vec2 vIridescenceThicknessMapUv;
#endif
#ifdef USE_SHEEN_COLORMAP
	varying vec2 vSheenColorMapUv;
#endif
#ifdef USE_SHEEN_ROUGHNESSMAP
	varying vec2 vSheenRoughnessMapUv;
#endif
#ifdef USE_SPECULARMAP
	varying vec2 vSpecularMapUv;
#endif
#ifdef USE_SPECULAR_COLORMAP
	varying vec2 vSpecularColorMapUv;
#endif
#ifdef USE_SPECULAR_INTENSITYMAP
	varying vec2 vSpecularIntensityMapUv;
#endif
#ifdef USE_TRANSMISSIONMAP
	uniform mat3 transmissionMapTransform;
	varying vec2 vTransmissionMapUv;
#endif
#ifdef USE_THICKNESSMAP
	uniform mat3 thicknessMapTransform;
	varying vec2 vThicknessMapUv;
#endif`,Qp=`#ifdef USE_UV
	varying vec2 vUv;
#endif
#ifdef USE_UV2
	attribute vec2 uv2;
#endif
#ifdef USE_MAP
	uniform mat3 mapTransform;
	varying vec2 vMapUv;
#endif
#ifdef USE_ALPHAMAP
	uniform mat3 alphaMapTransform;
	varying vec2 vAlphaMapUv;
#endif
#ifdef USE_LIGHTMAP
	uniform mat3 lightMapTransform;
	varying vec2 vLightMapUv;
#endif
#ifdef USE_AOMAP
	uniform mat3 aoMapTransform;
	varying vec2 vAoMapUv;
#endif
#ifdef USE_BUMPMAP
	uniform mat3 bumpMapTransform;
	varying vec2 vBumpMapUv;
#endif
#ifdef USE_NORMALMAP
	uniform mat3 normalMapTransform;
	varying vec2 vNormalMapUv;
#endif
#ifdef USE_DISPLACEMENTMAP
	uniform mat3 displacementMapTransform;
	varying vec2 vDisplacementMapUv;
#endif
#ifdef USE_EMISSIVEMAP
	uniform mat3 emissiveMapTransform;
	varying vec2 vEmissiveMapUv;
#endif
#ifdef USE_METALNESSMAP
	uniform mat3 metalnessMapTransform;
	varying vec2 vMetalnessMapUv;
#endif
#ifdef USE_ROUGHNESSMAP
	uniform mat3 roughnessMapTransform;
	varying vec2 vRoughnessMapUv;
#endif
#ifdef USE_CLEARCOATMAP
	uniform mat3 clearcoatMapTransform;
	varying vec2 vClearcoatMapUv;
#endif
#ifdef USE_CLEARCOAT_NORMALMAP
	uniform mat3 clearcoatNormalMapTransform;
	varying vec2 vClearcoatNormalMapUv;
#endif
#ifdef USE_CLEARCOAT_ROUGHNESSMAP
	uniform mat3 clearcoatRoughnessMapTransform;
	varying vec2 vClearcoatRoughnessMapUv;
#endif
#ifdef USE_SHEEN_COLORMAP
	uniform mat3 sheenColorMapTransform;
	varying vec2 vSheenColorMapUv;
#endif
#ifdef USE_SHEEN_ROUGHNESSMAP
	uniform mat3 sheenRoughnessMapTransform;
	varying vec2 vSheenRoughnessMapUv;
#endif
#ifdef USE_IRIDESCENCEMAP
	uniform mat3 iridescenceMapTransform;
	varying vec2 vIridescenceMapUv;
#endif
#ifdef USE_IRIDESCENCE_THICKNESSMAP
	uniform mat3 iridescenceThicknessMapTransform;
	varying vec2 vIridescenceThicknessMapUv;
#endif
#ifdef USE_SPECULARMAP
	uniform mat3 specularMapTransform;
	varying vec2 vSpecularMapUv;
#endif
#ifdef USE_SPECULAR_COLORMAP
	uniform mat3 specularColorMapTransform;
	varying vec2 vSpecularColorMapUv;
#endif
#ifdef USE_SPECULAR_INTENSITYMAP
	uniform mat3 specularIntensityMapTransform;
	varying vec2 vSpecularIntensityMapUv;
#endif
#ifdef USE_TRANSMISSIONMAP
	uniform mat3 transmissionMapTransform;
	varying vec2 vTransmissionMapUv;
#endif
#ifdef USE_THICKNESSMAP
	uniform mat3 thicknessMapTransform;
	varying vec2 vThicknessMapUv;
#endif`,Jp=`#ifdef USE_UV
	vUv = vec3( uv, 1 ).xy;
#endif
#ifdef USE_MAP
	vMapUv = ( mapTransform * vec3( MAP_UV, 1 ) ).xy;
#endif
#ifdef USE_ALPHAMAP
	vAlphaMapUv = ( alphaMapTransform * vec3( ALPHAMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_LIGHTMAP
	vLightMapUv = ( lightMapTransform * vec3( LIGHTMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_AOMAP
	vAoMapUv = ( aoMapTransform * vec3( AOMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_BUMPMAP
	vBumpMapUv = ( bumpMapTransform * vec3( BUMPMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_NORMALMAP
	vNormalMapUv = ( normalMapTransform * vec3( NORMALMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_DISPLACEMENTMAP
	vDisplacementMapUv = ( displacementMapTransform * vec3( DISPLACEMENTMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_EMISSIVEMAP
	vEmissiveMapUv = ( emissiveMapTransform * vec3( EMISSIVEMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_METALNESSMAP
	vMetalnessMapUv = ( metalnessMapTransform * vec3( METALNESSMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_ROUGHNESSMAP
	vRoughnessMapUv = ( roughnessMapTransform * vec3( ROUGHNESSMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_CLEARCOATMAP
	vClearcoatMapUv = ( clearcoatMapTransform * vec3( CLEARCOATMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_CLEARCOAT_NORMALMAP
	vClearcoatNormalMapUv = ( clearcoatNormalMapTransform * vec3( CLEARCOAT_NORMALMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_CLEARCOAT_ROUGHNESSMAP
	vClearcoatRoughnessMapUv = ( clearcoatRoughnessMapTransform * vec3( CLEARCOAT_ROUGHNESSMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_IRIDESCENCEMAP
	vIridescenceMapUv = ( iridescenceMapTransform * vec3( IRIDESCENCEMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_IRIDESCENCE_THICKNESSMAP
	vIridescenceThicknessMapUv = ( iridescenceThicknessMapTransform * vec3( IRIDESCENCE_THICKNESSMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_SHEEN_COLORMAP
	vSheenColorMapUv = ( sheenColorMapTransform * vec3( SHEEN_COLORMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_SHEEN_ROUGHNESSMAP
	vSheenRoughnessMapUv = ( sheenRoughnessMapTransform * vec3( SHEEN_ROUGHNESSMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_SPECULARMAP
	vSpecularMapUv = ( specularMapTransform * vec3( SPECULARMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_SPECULAR_COLORMAP
	vSpecularColorMapUv = ( specularColorMapTransform * vec3( SPECULAR_COLORMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_SPECULAR_INTENSITYMAP
	vSpecularIntensityMapUv = ( specularIntensityMapTransform * vec3( SPECULAR_INTENSITYMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_TRANSMISSIONMAP
	vTransmissionMapUv = ( transmissionMapTransform * vec3( TRANSMISSIONMAP_UV, 1 ) ).xy;
#endif
#ifdef USE_THICKNESSMAP
	vThicknessMapUv = ( thicknessMapTransform * vec3( THICKNESSMAP_UV, 1 ) ).xy;
#endif`,$p=`#if defined( USE_ENVMAP ) || defined( DISTANCE ) || defined ( USE_SHADOWMAP ) || defined ( USE_TRANSMISSION ) || NUM_SPOT_LIGHT_COORDS > 0
	vec4 worldPosition = vec4( transformed, 1.0 );
	#ifdef USE_INSTANCING
		worldPosition = instanceMatrix * worldPosition;
	#endif
	worldPosition = modelMatrix * worldPosition;
#endif`;const em=`varying vec2 vUv;
uniform mat3 uvTransform;
void main() {
	vUv = ( uvTransform * vec3( uv, 1 ) ).xy;
	gl_Position = vec4( position.xy, 1.0, 1.0 );
}`,tm=`uniform sampler2D t2D;
uniform float backgroundIntensity;
varying vec2 vUv;
void main() {
	vec4 texColor = texture2D( t2D, vUv );
	#ifdef DECODE_VIDEO_TEXTURE
		texColor = vec4( mix( pow( texColor.rgb * 0.9478672986 + vec3( 0.0521327014 ), vec3( 2.4 ) ), texColor.rgb * 0.0773993808, vec3( lessThanEqual( texColor.rgb, vec3( 0.04045 ) ) ) ), texColor.w );
	#endif
	texColor.rgb *= backgroundIntensity;
	gl_FragColor = texColor;
	#include <tonemapping_fragment>
	#include <encodings_fragment>
}`,nm=`varying vec3 vWorldDirection;
#include <common>
void main() {
	vWorldDirection = transformDirection( position, modelMatrix );
	#include <begin_vertex>
	#include <project_vertex>
	gl_Position.z = gl_Position.w;
}`,im=`#ifdef ENVMAP_TYPE_CUBE
	uniform samplerCube envMap;
#elif defined( ENVMAP_TYPE_CUBE_UV )
	uniform sampler2D envMap;
#endif
uniform float flipEnvMap;
uniform float backgroundBlurriness;
uniform float backgroundIntensity;
varying vec3 vWorldDirection;
#include <cube_uv_reflection_fragment>
void main() {
	#ifdef ENVMAP_TYPE_CUBE
		vec4 texColor = textureCube( envMap, vec3( flipEnvMap * vWorldDirection.x, vWorldDirection.yz ) );
	#elif defined( ENVMAP_TYPE_CUBE_UV )
		vec4 texColor = textureCubeUV( envMap, vWorldDirection, backgroundBlurriness );
	#else
		vec4 texColor = vec4( 0.0, 0.0, 0.0, 1.0 );
	#endif
	texColor.rgb *= backgroundIntensity;
	gl_FragColor = texColor;
	#include <tonemapping_fragment>
	#include <encodings_fragment>
}`,sm=`varying vec3 vWorldDirection;
#include <common>
void main() {
	vWorldDirection = transformDirection( position, modelMatrix );
	#include <begin_vertex>
	#include <project_vertex>
	gl_Position.z = gl_Position.w;
}`,rm=`uniform samplerCube tCube;
uniform float tFlip;
uniform float opacity;
varying vec3 vWorldDirection;
void main() {
	vec4 texColor = textureCube( tCube, vec3( tFlip * vWorldDirection.x, vWorldDirection.yz ) );
	gl_FragColor = texColor;
	gl_FragColor.a *= opacity;
	#include <tonemapping_fragment>
	#include <encodings_fragment>
}`,om=`#include <common>
#include <uv_pars_vertex>
#include <displacementmap_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
varying vec2 vHighPrecisionZW;
void main() {
	#include <uv_vertex>
	#include <skinbase_vertex>
	#ifdef USE_DISPLACEMENTMAP
		#include <beginnormal_vertex>
		#include <morphnormal_vertex>
		#include <skinnormal_vertex>
	#endif
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	vHighPrecisionZW = gl_Position.zw;
}`,am=`#if DEPTH_PACKING == 3200
	uniform float opacity;
#endif
#include <common>
#include <packing>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
varying vec2 vHighPrecisionZW;
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( 1.0 );
	#if DEPTH_PACKING == 3200
		diffuseColor.a = opacity;
	#endif
	#include <map_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <logdepthbuf_fragment>
	float fragCoordZ = 0.5 * vHighPrecisionZW[0] / vHighPrecisionZW[1] + 0.5;
	#if DEPTH_PACKING == 3200
		gl_FragColor = vec4( vec3( 1.0 - fragCoordZ ), opacity );
	#elif DEPTH_PACKING == 3201
		gl_FragColor = packDepthToRGBA( fragCoordZ );
	#endif
}`,lm=`#define DISTANCE
varying vec3 vWorldPosition;
#include <common>
#include <uv_pars_vertex>
#include <displacementmap_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <skinbase_vertex>
	#ifdef USE_DISPLACEMENTMAP
		#include <beginnormal_vertex>
		#include <morphnormal_vertex>
		#include <skinnormal_vertex>
	#endif
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <worldpos_vertex>
	#include <clipping_planes_vertex>
	vWorldPosition = worldPosition.xyz;
}`,cm=`#define DISTANCE
uniform vec3 referencePosition;
uniform float nearDistance;
uniform float farDistance;
varying vec3 vWorldPosition;
#include <common>
#include <packing>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <clipping_planes_pars_fragment>
void main () {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( 1.0 );
	#include <map_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	float dist = length( vWorldPosition - referencePosition );
	dist = ( dist - nearDistance ) / ( farDistance - nearDistance );
	dist = saturate( dist );
	gl_FragColor = packDepthToRGBA( dist );
}`,um=`varying vec3 vWorldDirection;
#include <common>
void main() {
	vWorldDirection = transformDirection( position, modelMatrix );
	#include <begin_vertex>
	#include <project_vertex>
}`,fm=`uniform sampler2D tEquirect;
varying vec3 vWorldDirection;
#include <common>
void main() {
	vec3 direction = normalize( vWorldDirection );
	vec2 sampleUV = equirectUv( direction );
	gl_FragColor = texture2D( tEquirect, sampleUV );
	#include <tonemapping_fragment>
	#include <encodings_fragment>
}`,hm=`uniform float scale;
attribute float lineDistance;
varying float vLineDistance;
#include <common>
#include <uv_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <morphtarget_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	vLineDistance = scale * lineDistance;
	#include <uv_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <fog_vertex>
}`,dm=`uniform vec3 diffuse;
uniform float opacity;
uniform float dashSize;
uniform float totalSize;
varying float vLineDistance;
#include <common>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <fog_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	if ( mod( vLineDistance, totalSize ) > dashSize ) {
		discard;
	}
	vec3 outgoingLight = vec3( 0.0 );
	vec4 diffuseColor = vec4( diffuse, opacity );
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	outgoingLight = diffuseColor.rgb;
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
}`,pm=`#include <common>
#include <uv_pars_vertex>
#include <envmap_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#if defined ( USE_ENVMAP ) || defined ( USE_SKINNING )
		#include <beginnormal_vertex>
		#include <morphnormal_vertex>
		#include <skinbase_vertex>
		#include <skinnormal_vertex>
		#include <defaultnormal_vertex>
	#endif
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <worldpos_vertex>
	#include <envmap_vertex>
	#include <fog_vertex>
}`,mm=`uniform vec3 diffuse;
uniform float opacity;
#ifndef FLAT_SHADED
	varying vec3 vNormal;
#endif
#include <common>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <envmap_common_pars_fragment>
#include <envmap_pars_fragment>
#include <fog_pars_fragment>
#include <specularmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <specularmap_fragment>
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	#ifdef USE_LIGHTMAP
		vec4 lightMapTexel = texture2D( lightMap, vLightMapUv );
		reflectedLight.indirectDiffuse += lightMapTexel.rgb * lightMapIntensity * RECIPROCAL_PI;
	#else
		reflectedLight.indirectDiffuse += vec3( 1.0 );
	#endif
	#include <aomap_fragment>
	reflectedLight.indirectDiffuse *= diffuseColor.rgb;
	vec3 outgoingLight = reflectedLight.indirectDiffuse;
	#include <envmap_fragment>
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,gm=`#define LAMBERT
varying vec3 vViewPosition;
#include <common>
#include <uv_pars_vertex>
#include <displacementmap_pars_vertex>
#include <envmap_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <shadowmap_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	vViewPosition = - mvPosition.xyz;
	#include <worldpos_vertex>
	#include <envmap_vertex>
	#include <shadowmap_vertex>
	#include <fog_vertex>
}`,_m=`#define LAMBERT
uniform vec3 diffuse;
uniform vec3 emissive;
uniform float opacity;
#include <common>
#include <packing>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <emissivemap_pars_fragment>
#include <envmap_common_pars_fragment>
#include <envmap_pars_fragment>
#include <fog_pars_fragment>
#include <bsdfs>
#include <lights_pars_begin>
#include <normal_pars_fragment>
#include <lights_lambert_pars_fragment>
#include <shadowmap_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <specularmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	vec3 totalEmissiveRadiance = emissive;
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <specularmap_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	#include <emissivemap_fragment>
	#include <lights_lambert_fragment>
	#include <lights_fragment_begin>
	#include <lights_fragment_maps>
	#include <lights_fragment_end>
	#include <aomap_fragment>
	vec3 outgoingLight = reflectedLight.directDiffuse + reflectedLight.indirectDiffuse + totalEmissiveRadiance;
	#include <envmap_fragment>
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,vm=`#define MATCAP
varying vec3 vViewPosition;
#include <common>
#include <uv_pars_vertex>
#include <color_pars_vertex>
#include <displacementmap_pars_vertex>
#include <fog_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <fog_vertex>
	vViewPosition = - mvPosition.xyz;
}`,bm=`#define MATCAP
uniform vec3 diffuse;
uniform float opacity;
uniform sampler2D matcap;
varying vec3 vViewPosition;
#include <common>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <fog_pars_fragment>
#include <normal_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	vec3 viewDir = normalize( vViewPosition );
	vec3 x = normalize( vec3( viewDir.z, 0.0, - viewDir.x ) );
	vec3 y = cross( viewDir, x );
	vec2 uv = vec2( dot( x, normal ), dot( y, normal ) ) * 0.495 + 0.5;
	#ifdef USE_MATCAP
		vec4 matcapColor = texture2D( matcap, uv );
	#else
		vec4 matcapColor = vec4( vec3( mix( 0.2, 0.8, uv.y ) ), 1.0 );
	#endif
	vec3 outgoingLight = diffuseColor.rgb * matcapColor.rgb;
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,Mm=`#define NORMAL
#if defined( FLAT_SHADED ) || defined( USE_BUMPMAP ) || defined( USE_NORMALMAP_TANGENTSPACE )
	varying vec3 vViewPosition;
#endif
#include <common>
#include <uv_pars_vertex>
#include <displacementmap_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
#if defined( FLAT_SHADED ) || defined( USE_BUMPMAP ) || defined( USE_NORMALMAP_TANGENTSPACE )
	vViewPosition = - mvPosition.xyz;
#endif
}`,xm=`#define NORMAL
uniform float opacity;
#if defined( FLAT_SHADED ) || defined( USE_BUMPMAP ) || defined( USE_NORMALMAP_TANGENTSPACE )
	varying vec3 vViewPosition;
#endif
#include <packing>
#include <uv_pars_fragment>
#include <normal_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	#include <logdepthbuf_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	gl_FragColor = vec4( packNormalToRGB( normal ), opacity );
	#ifdef OPAQUE
		gl_FragColor.a = 1.0;
	#endif
}`,Sm=`#define PHONG
varying vec3 vViewPosition;
#include <common>
#include <uv_pars_vertex>
#include <displacementmap_pars_vertex>
#include <envmap_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <shadowmap_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	vViewPosition = - mvPosition.xyz;
	#include <worldpos_vertex>
	#include <envmap_vertex>
	#include <shadowmap_vertex>
	#include <fog_vertex>
}`,ym=`#define PHONG
uniform vec3 diffuse;
uniform vec3 emissive;
uniform vec3 specular;
uniform float shininess;
uniform float opacity;
#include <common>
#include <packing>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <emissivemap_pars_fragment>
#include <envmap_common_pars_fragment>
#include <envmap_pars_fragment>
#include <fog_pars_fragment>
#include <bsdfs>
#include <lights_pars_begin>
#include <normal_pars_fragment>
#include <lights_phong_pars_fragment>
#include <shadowmap_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <specularmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	vec3 totalEmissiveRadiance = emissive;
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <specularmap_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	#include <emissivemap_fragment>
	#include <lights_phong_fragment>
	#include <lights_fragment_begin>
	#include <lights_fragment_maps>
	#include <lights_fragment_end>
	#include <aomap_fragment>
	vec3 outgoingLight = reflectedLight.directDiffuse + reflectedLight.indirectDiffuse + reflectedLight.directSpecular + reflectedLight.indirectSpecular + totalEmissiveRadiance;
	#include <envmap_fragment>
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,wm=`#define STANDARD
varying vec3 vViewPosition;
#ifdef USE_TRANSMISSION
	varying vec3 vWorldPosition;
#endif
#include <common>
#include <uv_pars_vertex>
#include <displacementmap_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <shadowmap_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	vViewPosition = - mvPosition.xyz;
	#include <worldpos_vertex>
	#include <shadowmap_vertex>
	#include <fog_vertex>
#ifdef USE_TRANSMISSION
	vWorldPosition = worldPosition.xyz;
#endif
}`,Em=`#define STANDARD
#ifdef PHYSICAL
	#define IOR
	#define USE_SPECULAR
#endif
uniform vec3 diffuse;
uniform vec3 emissive;
uniform float roughness;
uniform float metalness;
uniform float opacity;
#ifdef IOR
	uniform float ior;
#endif
#ifdef USE_SPECULAR
	uniform float specularIntensity;
	uniform vec3 specularColor;
	#ifdef USE_SPECULAR_COLORMAP
		uniform sampler2D specularColorMap;
	#endif
	#ifdef USE_SPECULAR_INTENSITYMAP
		uniform sampler2D specularIntensityMap;
	#endif
#endif
#ifdef USE_CLEARCOAT
	uniform float clearcoat;
	uniform float clearcoatRoughness;
#endif
#ifdef USE_IRIDESCENCE
	uniform float iridescence;
	uniform float iridescenceIOR;
	uniform float iridescenceThicknessMinimum;
	uniform float iridescenceThicknessMaximum;
#endif
#ifdef USE_SHEEN
	uniform vec3 sheenColor;
	uniform float sheenRoughness;
	#ifdef USE_SHEEN_COLORMAP
		uniform sampler2D sheenColorMap;
	#endif
	#ifdef USE_SHEEN_ROUGHNESSMAP
		uniform sampler2D sheenRoughnessMap;
	#endif
#endif
varying vec3 vViewPosition;
#include <common>
#include <packing>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <emissivemap_pars_fragment>
#include <iridescence_fragment>
#include <cube_uv_reflection_fragment>
#include <envmap_common_pars_fragment>
#include <envmap_physical_pars_fragment>
#include <fog_pars_fragment>
#include <lights_pars_begin>
#include <normal_pars_fragment>
#include <lights_physical_pars_fragment>
#include <transmission_pars_fragment>
#include <shadowmap_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <clearcoat_pars_fragment>
#include <iridescence_pars_fragment>
#include <roughnessmap_pars_fragment>
#include <metalnessmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	vec3 totalEmissiveRadiance = emissive;
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <roughnessmap_fragment>
	#include <metalnessmap_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	#include <clearcoat_normal_fragment_begin>
	#include <clearcoat_normal_fragment_maps>
	#include <emissivemap_fragment>
	#include <lights_physical_fragment>
	#include <lights_fragment_begin>
	#include <lights_fragment_maps>
	#include <lights_fragment_end>
	#include <aomap_fragment>
	vec3 totalDiffuse = reflectedLight.directDiffuse + reflectedLight.indirectDiffuse;
	vec3 totalSpecular = reflectedLight.directSpecular + reflectedLight.indirectSpecular;
	#include <transmission_fragment>
	vec3 outgoingLight = totalDiffuse + totalSpecular + totalEmissiveRadiance;
	#ifdef USE_SHEEN
		float sheenEnergyComp = 1.0 - 0.157 * max3( material.sheenColor );
		outgoingLight = outgoingLight * sheenEnergyComp + sheenSpecular;
	#endif
	#ifdef USE_CLEARCOAT
		float dotNVcc = saturate( dot( geometry.clearcoatNormal, geometry.viewDir ) );
		vec3 Fcc = F_Schlick( material.clearcoatF0, material.clearcoatF90, dotNVcc );
		outgoingLight = outgoingLight * ( 1.0 - material.clearcoat * Fcc ) + clearcoatSpecular * material.clearcoat;
	#endif
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,Tm=`#define TOON
varying vec3 vViewPosition;
#include <common>
#include <uv_pars_vertex>
#include <displacementmap_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <shadowmap_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	vViewPosition = - mvPosition.xyz;
	#include <worldpos_vertex>
	#include <shadowmap_vertex>
	#include <fog_vertex>
}`,Am=`#define TOON
uniform vec3 diffuse;
uniform vec3 emissive;
uniform float opacity;
#include <common>
#include <packing>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <emissivemap_pars_fragment>
#include <gradientmap_pars_fragment>
#include <fog_pars_fragment>
#include <bsdfs>
#include <lights_pars_begin>
#include <normal_pars_fragment>
#include <lights_toon_pars_fragment>
#include <shadowmap_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	vec3 totalEmissiveRadiance = emissive;
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	#include <emissivemap_fragment>
	#include <lights_toon_fragment>
	#include <lights_fragment_begin>
	#include <lights_fragment_maps>
	#include <lights_fragment_end>
	#include <aomap_fragment>
	vec3 outgoingLight = reflectedLight.directDiffuse + reflectedLight.indirectDiffuse + totalEmissiveRadiance;
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,Cm=`uniform float size;
uniform float scale;
#include <common>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <morphtarget_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
#ifdef USE_POINTS_UV
	varying vec2 vUv;
	uniform mat3 uvTransform;
#endif
void main() {
	#ifdef USE_POINTS_UV
		vUv = ( uvTransform * vec3( uv, 1 ) ).xy;
	#endif
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <project_vertex>
	gl_PointSize = size;
	#ifdef USE_SIZEATTENUATION
		bool isPerspective = isPerspectiveMatrix( projectionMatrix );
		if ( isPerspective ) gl_PointSize *= ( scale / - mvPosition.z );
	#endif
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <worldpos_vertex>
	#include <fog_vertex>
}`,Pm=`uniform vec3 diffuse;
uniform float opacity;
#include <common>
#include <color_pars_fragment>
#include <map_particle_pars_fragment>
#include <alphatest_pars_fragment>
#include <fog_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec3 outgoingLight = vec3( 0.0 );
	vec4 diffuseColor = vec4( diffuse, opacity );
	#include <logdepthbuf_fragment>
	#include <map_particle_fragment>
	#include <color_fragment>
	#include <alphatest_fragment>
	outgoingLight = diffuseColor.rgb;
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
}`,Lm=`#include <common>
#include <fog_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <shadowmap_pars_vertex>
void main() {
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <worldpos_vertex>
	#include <shadowmap_vertex>
	#include <fog_vertex>
}`,Rm=`uniform vec3 color;
uniform float opacity;
#include <common>
#include <packing>
#include <fog_pars_fragment>
#include <bsdfs>
#include <lights_pars_begin>
#include <logdepthbuf_pars_fragment>
#include <shadowmap_pars_fragment>
#include <shadowmask_pars_fragment>
void main() {
	#include <logdepthbuf_fragment>
	gl_FragColor = vec4( color, opacity * ( 1.0 - getShadowMask() ) );
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
}`,Dm=`uniform float rotation;
uniform vec2 center;
#include <common>
#include <uv_pars_vertex>
#include <fog_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	vec4 mvPosition = modelViewMatrix * vec4( 0.0, 0.0, 0.0, 1.0 );
	vec2 scale;
	scale.x = length( vec3( modelMatrix[ 0 ].x, modelMatrix[ 0 ].y, modelMatrix[ 0 ].z ) );
	scale.y = length( vec3( modelMatrix[ 1 ].x, modelMatrix[ 1 ].y, modelMatrix[ 1 ].z ) );
	#ifndef USE_SIZEATTENUATION
		bool isPerspective = isPerspectiveMatrix( projectionMatrix );
		if ( isPerspective ) scale *= - mvPosition.z;
	#endif
	vec2 alignedPosition = ( position.xy - ( center - vec2( 0.5 ) ) ) * scale;
	vec2 rotatedPosition;
	rotatedPosition.x = cos( rotation ) * alignedPosition.x - sin( rotation ) * alignedPosition.y;
	rotatedPosition.y = sin( rotation ) * alignedPosition.x + cos( rotation ) * alignedPosition.y;
	mvPosition.xy += rotatedPosition;
	gl_Position = projectionMatrix * mvPosition;
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <fog_vertex>
}`,Im=`uniform vec3 diffuse;
uniform float opacity;
#include <common>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <fog_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec3 outgoingLight = vec3( 0.0 );
	vec4 diffuseColor = vec4( diffuse, opacity );
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	outgoingLight = diffuseColor.rgb;
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
}`,Qe={alphamap_fragment:rd,alphamap_pars_fragment:od,alphatest_fragment:ad,alphatest_pars_fragment:ld,aomap_fragment:cd,aomap_pars_fragment:ud,begin_vertex:fd,beginnormal_vertex:hd,bsdfs:dd,iridescence_fragment:pd,bumpmap_pars_fragment:md,clipping_planes_fragment:gd,clipping_planes_pars_fragment:_d,clipping_planes_pars_vertex:vd,clipping_planes_vertex:bd,color_fragment:Md,color_pars_fragment:xd,color_pars_vertex:Sd,color_vertex:yd,common:wd,cube_uv_reflection_fragment:Ed,defaultnormal_vertex:Td,displacementmap_pars_vertex:Ad,displacementmap_vertex:Cd,emissivemap_fragment:Pd,emissivemap_pars_fragment:Ld,encodings_fragment:Rd,encodings_pars_fragment:Dd,envmap_fragment:Id,envmap_common_pars_fragment:Ud,envmap_pars_fragment:zd,envmap_pars_vertex:kd,envmap_physical_pars_fragment:Yd,envmap_vertex:Nd,fog_vertex:Od,fog_pars_vertex:Fd,fog_fragment:Bd,fog_pars_fragment:Gd,gradientmap_pars_fragment:Hd,lightmap_fragment:Vd,lightmap_pars_fragment:Wd,lights_lambert_fragment:jd,lights_lambert_pars_fragment:Xd,lights_pars_begin:qd,lights_toon_fragment:Zd,lights_toon_pars_fragment:Kd,lights_phong_fragment:Qd,lights_phong_pars_fragment:Jd,lights_physical_fragment:$d,lights_physical_pars_fragment:ep,lights_fragment_begin:tp,lights_fragment_maps:np,lights_fragment_end:ip,logdepthbuf_fragment:sp,logdepthbuf_pars_fragment:rp,logdepthbuf_pars_vertex:op,logdepthbuf_vertex:ap,map_fragment:lp,map_pars_fragment:cp,map_particle_fragment:up,map_particle_pars_fragment:fp,metalnessmap_fragment:hp,metalnessmap_pars_fragment:dp,morphcolor_vertex:pp,morphnormal_vertex:mp,morphtarget_pars_vertex:gp,morphtarget_vertex:_p,normal_fragment_begin:vp,normal_fragment_maps:bp,normal_pars_fragment:Mp,normal_pars_vertex:xp,normal_vertex:Sp,normalmap_pars_fragment:yp,clearcoat_normal_fragment_begin:wp,clearcoat_normal_fragment_maps:Ep,clearcoat_pars_fragment:Tp,iridescence_pars_fragment:Ap,output_fragment:Cp,packing:Pp,premultiplied_alpha_fragment:Lp,project_vertex:Rp,dithering_fragment:Dp,dithering_pars_fragment:Ip,roughnessmap_fragment:Up,roughnessmap_pars_fragment:zp,shadowmap_pars_fragment:kp,shadowmap_pars_vertex:Np,shadowmap_vertex:Op,shadowmask_pars_fragment:Fp,skinbase_vertex:Bp,skinning_pars_vertex:Gp,skinning_vertex:Hp,skinnormal_vertex:Vp,specularmap_fragment:Wp,specularmap_pars_fragment:jp,tonemapping_fragment:Xp,tonemapping_pars_fragment:qp,transmission_fragment:Yp,transmission_pars_fragment:Zp,uv_pars_fragment:Kp,uv_pars_vertex:Qp,uv_vertex:Jp,worldpos_vertex:$p,background_vert:em,background_frag:tm,backgroundCube_vert:nm,backgroundCube_frag:im,cube_vert:sm,cube_frag:rm,depth_vert:om,depth_frag:am,distanceRGBA_vert:lm,distanceRGBA_frag:cm,equirect_vert:um,equirect_frag:fm,linedashed_vert:hm,linedashed_frag:dm,meshbasic_vert:pm,meshbasic_frag:mm,meshlambert_vert:gm,meshlambert_frag:_m,meshmatcap_vert:vm,meshmatcap_frag:bm,meshnormal_vert:Mm,meshnormal_frag:xm,meshphong_vert:Sm,meshphong_frag:ym,meshphysical_vert:wm,meshphysical_frag:Em,meshtoon_vert:Tm,meshtoon_frag:Am,points_vert:Cm,points_frag:Pm,shadow_vert:Lm,shadow_frag:Rm,sprite_vert:Dm,sprite_frag:Im},be={common:{diffuse:{value:new ut(16777215)},opacity:{value:1},map:{value:null},mapTransform:{value:new et},alphaMap:{value:null},alphaMapTransform:{value:new et},alphaTest:{value:0}},specularmap:{specularMap:{value:null},specularMapTransform:{value:new et}},envmap:{envMap:{value:null},flipEnvMap:{value:-1},reflectivity:{value:1},ior:{value:1.5},refractionRatio:{value:.98}},aomap:{aoMap:{value:null},aoMapIntensity:{value:1},aoMapTransform:{value:new et}},lightmap:{lightMap:{value:null},lightMapIntensity:{value:1},lightMapTransform:{value:new et}},bumpmap:{bumpMap:{value:null},bumpMapTransform:{value:new et},bumpScale:{value:1}},normalmap:{normalMap:{value:null},normalMapTransform:{value:new et},normalScale:{value:new st(1,1)}},displacementmap:{displacementMap:{value:null},displacementMapTransform:{value:new et},displacementScale:{value:1},displacementBias:{value:0}},emissivemap:{emissiveMap:{value:null},emissiveMapTransform:{value:new et}},metalnessmap:{metalnessMap:{value:null},metalnessMapTransform:{value:new et}},roughnessmap:{roughnessMap:{value:null},roughnessMapTransform:{value:new et}},gradientmap:{gradientMap:{value:null}},fog:{fogDensity:{value:25e-5},fogNear:{value:1},fogFar:{value:2e3},fogColor:{value:new ut(16777215)}},lights:{ambientLightColor:{value:[]},lightProbe:{value:[]},directionalLights:{value:[],properties:{direction:{},color:{}}},directionalLightShadows:{value:[],properties:{shadowBias:{},shadowNormalBias:{},shadowRadius:{},shadowMapSize:{}}},directionalShadowMap:{value:[]},directionalShadowMatrix:{value:[]},spotLights:{value:[],properties:{color:{},position:{},direction:{},distance:{},coneCos:{},penumbraCos:{},decay:{}}},spotLightShadows:{value:[],properties:{shadowBias:{},shadowNormalBias:{},shadowRadius:{},shadowMapSize:{}}},spotLightMap:{value:[]},spotShadowMap:{value:[]},spotLightMatrix:{value:[]},pointLights:{value:[],properties:{color:{},position:{},decay:{},distance:{}}},pointLightShadows:{value:[],properties:{shadowBias:{},shadowNormalBias:{},shadowRadius:{},shadowMapSize:{},shadowCameraNear:{},shadowCameraFar:{}}},pointShadowMap:{value:[]},pointShadowMatrix:{value:[]},hemisphereLights:{value:[],properties:{direction:{},skyColor:{},groundColor:{}}},rectAreaLights:{value:[],properties:{color:{},position:{},width:{},height:{}}},ltc_1:{value:null},ltc_2:{value:null}},points:{diffuse:{value:new ut(16777215)},opacity:{value:1},size:{value:1},scale:{value:1},map:{value:null},alphaMap:{value:null},alphaTest:{value:0},uvTransform:{value:new et}},sprite:{diffuse:{value:new ut(16777215)},opacity:{value:1},center:{value:new st(.5,.5)},rotation:{value:0},map:{value:null},mapTransform:{value:new et},alphaMap:{value:null},alphaTest:{value:0}}},Un={basic:{uniforms:Jt([be.common,be.specularmap,be.envmap,be.aomap,be.lightmap,be.fog]),vertexShader:Qe.meshbasic_vert,fragmentShader:Qe.meshbasic_frag},lambert:{uniforms:Jt([be.common,be.specularmap,be.envmap,be.aomap,be.lightmap,be.emissivemap,be.bumpmap,be.normalmap,be.displacementmap,be.fog,be.lights,{emissive:{value:new ut(0)}}]),vertexShader:Qe.meshlambert_vert,fragmentShader:Qe.meshlambert_frag},phong:{uniforms:Jt([be.common,be.specularmap,be.envmap,be.aomap,be.lightmap,be.emissivemap,be.bumpmap,be.normalmap,be.displacementmap,be.fog,be.lights,{emissive:{value:new ut(0)},specular:{value:new ut(1118481)},shininess:{value:30}}]),vertexShader:Qe.meshphong_vert,fragmentShader:Qe.meshphong_frag},standard:{uniforms:Jt([be.common,be.envmap,be.aomap,be.lightmap,be.emissivemap,be.bumpmap,be.normalmap,be.displacementmap,be.roughnessmap,be.metalnessmap,be.fog,be.lights,{emissive:{value:new ut(0)},roughness:{value:1},metalness:{value:0},envMapIntensity:{value:1}}]),vertexShader:Qe.meshphysical_vert,fragmentShader:Qe.meshphysical_frag},toon:{uniforms:Jt([be.common,be.aomap,be.lightmap,be.emissivemap,be.bumpmap,be.normalmap,be.displacementmap,be.gradientmap,be.fog,be.lights,{emissive:{value:new ut(0)}}]),vertexShader:Qe.meshtoon_vert,fragmentShader:Qe.meshtoon_frag},matcap:{uniforms:Jt([be.common,be.bumpmap,be.normalmap,be.displacementmap,be.fog,{matcap:{value:null}}]),vertexShader:Qe.meshmatcap_vert,fragmentShader:Qe.meshmatcap_frag},points:{uniforms:Jt([be.points,be.fog]),vertexShader:Qe.points_vert,fragmentShader:Qe.points_frag},dashed:{uniforms:Jt([be.common,be.fog,{scale:{value:1},dashSize:{value:1},totalSize:{value:2}}]),vertexShader:Qe.linedashed_vert,fragmentShader:Qe.linedashed_frag},depth:{uniforms:Jt([be.common,be.displacementmap]),vertexShader:Qe.depth_vert,fragmentShader:Qe.depth_frag},normal:{uniforms:Jt([be.common,be.bumpmap,be.normalmap,be.displacementmap,{opacity:{value:1}}]),vertexShader:Qe.meshnormal_vert,fragmentShader:Qe.meshnormal_frag},sprite:{uniforms:Jt([be.sprite,be.fog]),vertexShader:Qe.sprite_vert,fragmentShader:Qe.sprite_frag},background:{uniforms:{uvTransform:{value:new et},t2D:{value:null},backgroundIntensity:{value:1}},vertexShader:Qe.background_vert,fragmentShader:Qe.background_frag},backgroundCube:{uniforms:{envMap:{value:null},flipEnvMap:{value:-1},backgroundBlurriness:{value:0},backgroundIntensity:{value:1}},vertexShader:Qe.backgroundCube_vert,fragmentShader:Qe.backgroundCube_frag},cube:{uniforms:{tCube:{value:null},tFlip:{value:-1},opacity:{value:1}},vertexShader:Qe.cube_vert,fragmentShader:Qe.cube_frag},equirect:{uniforms:{tEquirect:{value:null}},vertexShader:Qe.equirect_vert,fragmentShader:Qe.equirect_frag},distanceRGBA:{uniforms:Jt([be.common,be.displacementmap,{referencePosition:{value:new G},nearDistance:{value:1},farDistance:{value:1e3}}]),vertexShader:Qe.distanceRGBA_vert,fragmentShader:Qe.distanceRGBA_frag},shadow:{uniforms:Jt([be.lights,be.fog,{color:{value:new ut(0)},opacity:{value:1}}]),vertexShader:Qe.shadow_vert,fragmentShader:Qe.shadow_frag}};Un.physical={uniforms:Jt([Un.standard.uniforms,{clearcoat:{value:0},clearcoatMap:{value:null},clearcoatMapTransform:{value:new et},clearcoatNormalMap:{value:null},clearcoatNormalMapTransform:{value:new et},clearcoatNormalScale:{value:new st(1,1)},clearcoatRoughness:{value:0},clearcoatRoughnessMap:{value:null},clearcoatRoughnessMapTransform:{value:new et},iridescence:{value:0},iridescenceMap:{value:null},iridescenceMapTransform:{value:new et},iridescenceIOR:{value:1.3},iridescenceThicknessMinimum:{value:100},iridescenceThicknessMaximum:{value:400},iridescenceThicknessMap:{value:null},iridescenceThicknessMapTransform:{value:new et},sheen:{value:0},sheenColor:{value:new ut(0)},sheenColorMap:{value:null},sheenColorMapTransform:{value:new et},sheenRoughness:{value:1},sheenRoughnessMap:{value:null},sheenRoughnessMapTransform:{value:new et},transmission:{value:0},transmissionMap:{value:null},transmissionMapTransform:{value:new et},transmissionSamplerSize:{value:new st},transmissionSamplerMap:{value:null},thickness:{value:0},thicknessMap:{value:null},thicknessMapTransform:{value:new et},attenuationDistance:{value:0},attenuationColor:{value:new ut(0)},specularColor:{value:new ut(1,1,1)},specularColorMap:{value:null},specularColorMapTransform:{value:new et},specularIntensity:{value:1},specularIntensityMap:{value:null},specularIntensityMapTransform:{value:new et}}]),vertexShader:Qe.meshphysical_vert,fragmentShader:Qe.meshphysical_frag};const fr={r:0,b:0,g:0};function Um(i,e,t,n,s,r,o){const a=new ut(0);let l=r===!0?0:1,c,f,h=null,u=0,p=null;function g(m,d){let M=!1,b=d.isScene===!0?d.background:null;b&&b.isTexture&&(b=(d.backgroundBlurriness>0?t:e).get(b));const x=i.xr,y=x.getSession&&x.getSession();y&&y.environmentBlendMode==="additive"&&(b=null),b===null?v(a,l):b&&b.isColor&&(v(b,1),M=!0),(i.autoClear||M)&&i.clear(i.autoClearColor,i.autoClearDepth,i.autoClearStencil),b&&(b.isCubeTexture||b.mapping===Rr)?(f===void 0&&(f=new Ee(new At(1,1,1),new $n({name:"BackgroundCubeMaterial",uniforms:us(Un.backgroundCube.uniforms),vertexShader:Un.backgroundCube.vertexShader,fragmentShader:Un.backgroundCube.fragmentShader,side:un,depthTest:!1,depthWrite:!1,fog:!1})),f.geometry.deleteAttribute("normal"),f.geometry.deleteAttribute("uv"),f.onBeforeRender=function(T,L,w){this.matrixWorld.copyPosition(w.matrixWorld)},Object.defineProperty(f.material,"envMap",{get:function(){return this.uniforms.envMap.value}}),s.update(f)),f.material.uniforms.envMap.value=b,f.material.uniforms.flipEnvMap.value=b.isCubeTexture&&b.isRenderTargetTexture===!1?-1:1,f.material.uniforms.backgroundBlurriness.value=d.backgroundBlurriness,f.material.uniforms.backgroundIntensity.value=d.backgroundIntensity,f.material.toneMapped=b.encoding!==vt,(h!==b||u!==b.version||p!==i.toneMapping)&&(f.material.needsUpdate=!0,h=b,u=b.version,p=i.toneMapping),f.layers.enableAll(),m.unshift(f,f.geometry,f.material,0,0,null)):b&&b.isTexture&&(c===void 0&&(c=new Ee(new Ur(2,2),new $n({name:"BackgroundMaterial",uniforms:us(Un.background.uniforms),vertexShader:Un.background.vertexShader,fragmentShader:Un.background.fragmentShader,side:ci,depthTest:!1,depthWrite:!1,fog:!1})),c.geometry.deleteAttribute("normal"),Object.defineProperty(c.material,"map",{get:function(){return this.uniforms.t2D.value}}),s.update(c)),c.material.uniforms.t2D.value=b,c.material.uniforms.backgroundIntensity.value=d.backgroundIntensity,c.material.toneMapped=b.encoding!==vt,b.matrixAutoUpdate===!0&&b.updateMatrix(),c.material.uniforms.uvTransform.value.copy(b.matrix),(h!==b||u!==b.version||p!==i.toneMapping)&&(c.material.needsUpdate=!0,h=b,u=b.version,p=i.toneMapping),c.layers.enableAll(),m.unshift(c,c.geometry,c.material,0,0,null))}function v(m,d){m.getRGB(fr,bu(i)),n.buffers.color.setClear(fr.r,fr.g,fr.b,d,o)}return{getClearColor:function(){return a},setClearColor:function(m,d=1){a.set(m),l=d,v(a,l)},getClearAlpha:function(){return l},setClearAlpha:function(m){l=m,v(a,l)},render:g}}function zm(i,e,t,n){const s=i.getParameter(34921),r=n.isWebGL2?null:e.get("OES_vertex_array_object"),o=n.isWebGL2||r!==null,a={},l=m(null);let c=l,f=!1;function h(U,N,j,D,V){let W=!1;if(o){const Q=v(D,j,N);c!==Q&&(c=Q,p(c.object)),W=d(U,D,j,V),W&&M(U,D,j,V)}else{const Q=N.wireframe===!0;(c.geometry!==D.id||c.program!==j.id||c.wireframe!==Q)&&(c.geometry=D.id,c.program=j.id,c.wireframe=Q,W=!0)}V!==null&&t.update(V,34963),(W||f)&&(f=!1,w(U,N,j,D),V!==null&&i.bindBuffer(34963,t.get(V).buffer))}function u(){return n.isWebGL2?i.createVertexArray():r.createVertexArrayOES()}function p(U){return n.isWebGL2?i.bindVertexArray(U):r.bindVertexArrayOES(U)}function g(U){return n.isWebGL2?i.deleteVertexArray(U):r.deleteVertexArrayOES(U)}function v(U,N,j){const D=j.wireframe===!0;let V=a[U.id];V===void 0&&(V={},a[U.id]=V);let W=V[N.id];W===void 0&&(W={},V[N.id]=W);let Q=W[D];return Q===void 0&&(Q=m(u()),W[D]=Q),Q}function m(U){const N=[],j=[],D=[];for(let V=0;V<s;V++)N[V]=0,j[V]=0,D[V]=0;return{geometry:null,program:null,wireframe:!1,newAttributes:N,enabledAttributes:j,attributeDivisors:D,object:U,attributes:{},index:null}}function d(U,N,j,D){const V=c.attributes,W=N.attributes;let Q=0;const oe=j.getAttributes();for(const ee in oe)if(oe[ee].location>=0){const K=V[ee];let pe=W[ee];if(pe===void 0&&(ee==="instanceMatrix"&&U.instanceMatrix&&(pe=U.instanceMatrix),ee==="instanceColor"&&U.instanceColor&&(pe=U.instanceColor)),K===void 0||K.attribute!==pe||pe&&K.data!==pe.data)return!0;Q++}return c.attributesNum!==Q||c.index!==D}function M(U,N,j,D){const V={},W=N.attributes;let Q=0;const oe=j.getAttributes();for(const ee in oe)if(oe[ee].location>=0){let K=W[ee];K===void 0&&(ee==="instanceMatrix"&&U.instanceMatrix&&(K=U.instanceMatrix),ee==="instanceColor"&&U.instanceColor&&(K=U.instanceColor));const pe={};pe.attribute=K,K&&K.data&&(pe.data=K.data),V[ee]=pe,Q++}c.attributes=V,c.attributesNum=Q,c.index=D}function b(){const U=c.newAttributes;for(let N=0,j=U.length;N<j;N++)U[N]=0}function x(U){y(U,0)}function y(U,N){const j=c.newAttributes,D=c.enabledAttributes,V=c.attributeDivisors;j[U]=1,D[U]===0&&(i.enableVertexAttribArray(U),D[U]=1),V[U]!==N&&((n.isWebGL2?i:e.get("ANGLE_instanced_arrays"))[n.isWebGL2?"vertexAttribDivisor":"vertexAttribDivisorANGLE"](U,N),V[U]=N)}function T(){const U=c.newAttributes,N=c.enabledAttributes;for(let j=0,D=N.length;j<D;j++)N[j]!==U[j]&&(i.disableVertexAttribArray(j),N[j]=0)}function L(U,N,j,D,V,W){n.isWebGL2===!0&&(j===5124||j===5125)?i.vertexAttribIPointer(U,N,j,V,W):i.vertexAttribPointer(U,N,j,D,V,W)}function w(U,N,j,D){if(n.isWebGL2===!1&&(U.isInstancedMesh||D.isInstancedBufferGeometry)&&e.get("ANGLE_instanced_arrays")===null)return;b();const V=D.attributes,W=j.getAttributes(),Q=N.defaultAttributeValues;for(const oe in W){const ee=W[oe];if(ee.location>=0){let z=V[oe];if(z===void 0&&(oe==="instanceMatrix"&&U.instanceMatrix&&(z=U.instanceMatrix),oe==="instanceColor"&&U.instanceColor&&(z=U.instanceColor)),z!==void 0){const K=z.normalized,pe=z.itemSize,ae=t.get(z);if(ae===void 0)continue;const H=ae.buffer,Se=ae.type,ve=ae.bytesPerElement;if(z.isInterleavedBufferAttribute){const se=z.data,me=se.stride,Ie=z.offset;if(se.isInstancedInterleavedBuffer){for(let ce=0;ce<ee.locationSize;ce++)y(ee.location+ce,se.meshPerAttribute);U.isInstancedMesh!==!0&&D._maxInstanceCount===void 0&&(D._maxInstanceCount=se.meshPerAttribute*se.count)}else for(let ce=0;ce<ee.locationSize;ce++)x(ee.location+ce);i.bindBuffer(34962,H);for(let ce=0;ce<ee.locationSize;ce++)L(ee.location+ce,pe/ee.locationSize,Se,K,me*ve,(Ie+pe/ee.locationSize*ce)*ve)}else{if(z.isInstancedBufferAttribute){for(let se=0;se<ee.locationSize;se++)y(ee.location+se,z.meshPerAttribute);U.isInstancedMesh!==!0&&D._maxInstanceCount===void 0&&(D._maxInstanceCount=z.meshPerAttribute*z.count)}else for(let se=0;se<ee.locationSize;se++)x(ee.location+se);i.bindBuffer(34962,H);for(let se=0;se<ee.locationSize;se++)L(ee.location+se,pe/ee.locationSize,Se,K,pe*ve,pe/ee.locationSize*se*ve)}}else if(Q!==void 0){const K=Q[oe];if(K!==void 0)switch(K.length){case 2:i.vertexAttrib2fv(ee.location,K);break;case 3:i.vertexAttrib3fv(ee.location,K);break;case 4:i.vertexAttrib4fv(ee.location,K);break;default:i.vertexAttrib1fv(ee.location,K)}}}}T()}function _(){k();for(const U in a){const N=a[U];for(const j in N){const D=N[j];for(const V in D)g(D[V].object),delete D[V];delete N[j]}delete a[U]}}function S(U){if(a[U.id]===void 0)return;const N=a[U.id];for(const j in N){const D=N[j];for(const V in D)g(D[V].object),delete D[V];delete N[j]}delete a[U.id]}function B(U){for(const N in a){const j=a[N];if(j[U.id]===void 0)continue;const D=j[U.id];for(const V in D)g(D[V].object),delete D[V];delete j[U.id]}}function k(){C(),f=!0,c!==l&&(c=l,p(c.object))}function C(){l.geometry=null,l.program=null,l.wireframe=!1}return{setup:h,reset:k,resetDefaultState:C,dispose:_,releaseStatesOfGeometry:S,releaseStatesOfProgram:B,initAttributes:b,enableAttribute:x,disableUnusedAttributes:T}}function km(i,e,t,n){const s=n.isWebGL2;let r;function o(c){r=c}function a(c,f){i.drawArrays(r,c,f),t.update(f,r,1)}function l(c,f,h){if(h===0)return;let u,p;if(s)u=i,p="drawArraysInstanced";else if(u=e.get("ANGLE_instanced_arrays"),p="drawArraysInstancedANGLE",u===null){console.error("THREE.WebGLBufferRenderer: using THREE.InstancedBufferGeometry but hardware does not support extension ANGLE_instanced_arrays.");return}u[p](r,c,f,h),t.update(f,r,h)}this.setMode=o,this.render=a,this.renderInstances=l}function Nm(i,e,t){let n;function s(){if(n!==void 0)return n;if(e.has("EXT_texture_filter_anisotropic")===!0){const L=e.get("EXT_texture_filter_anisotropic");n=i.getParameter(L.MAX_TEXTURE_MAX_ANISOTROPY_EXT)}else n=0;return n}function r(L){if(L==="highp"){if(i.getShaderPrecisionFormat(35633,36338).precision>0&&i.getShaderPrecisionFormat(35632,36338).precision>0)return"highp";L="mediump"}return L==="mediump"&&i.getShaderPrecisionFormat(35633,36337).precision>0&&i.getShaderPrecisionFormat(35632,36337).precision>0?"mediump":"lowp"}const o=typeof WebGL2RenderingContext!="undefined"&&i.constructor.name==="WebGL2RenderingContext";let a=t.precision!==void 0?t.precision:"highp";const l=r(a);l!==a&&(console.warn("THREE.WebGLRenderer:",a,"not supported, using",l,"instead."),a=l);const c=o||e.has("WEBGL_draw_buffers"),f=t.logarithmicDepthBuffer===!0,h=i.getParameter(34930),u=i.getParameter(35660),p=i.getParameter(3379),g=i.getParameter(34076),v=i.getParameter(34921),m=i.getParameter(36347),d=i.getParameter(36348),M=i.getParameter(36349),b=u>0,x=o||e.has("OES_texture_float"),y=b&&x,T=o?i.getParameter(36183):0;return{isWebGL2:o,drawBuffers:c,getMaxAnisotropy:s,getMaxPrecision:r,precision:a,logarithmicDepthBuffer:f,maxTextures:h,maxVertexTextures:u,maxTextureSize:p,maxCubemapSize:g,maxAttributes:v,maxVertexUniforms:m,maxVaryings:d,maxFragmentUniforms:M,vertexTextures:b,floatFragmentTextures:x,floatVertexTextures:y,maxSamples:T}}function Om(i){const e=this;let t=null,n=0,s=!1,r=!1;const o=new Si,a=new et,l={value:null,needsUpdate:!1};this.uniform=l,this.numPlanes=0,this.numIntersection=0,this.init=function(h,u){const p=h.length!==0||u||n!==0||s;return s=u,n=h.length,p},this.beginShadows=function(){r=!0,f(null)},this.endShadows=function(){r=!1},this.setGlobalState=function(h,u){t=f(h,u,0)},this.setState=function(h,u,p){const g=h.clippingPlanes,v=h.clipIntersection,m=h.clipShadows,d=i.get(h);if(!s||g===null||g.length===0||r&&!m)r?f(null):c();else{const M=r?0:n,b=M*4;let x=d.clippingState||null;l.value=x,x=f(g,u,b,p);for(let y=0;y!==b;++y)x[y]=t[y];d.clippingState=x,this.numIntersection=v?this.numPlanes:0,this.numPlanes+=M}};function c(){l.value!==t&&(l.value=t,l.needsUpdate=n>0),e.numPlanes=n,e.numIntersection=0}function f(h,u,p,g){const v=h!==null?h.length:0;let m=null;if(v!==0){if(m=l.value,g!==!0||m===null){const d=p+v*4,M=u.matrixWorldInverse;a.getNormalMatrix(M),(m===null||m.length<d)&&(m=new Float32Array(d));for(let b=0,x=p;b!==v;++b,x+=4)o.copy(h[b]).applyMatrix4(M,a),o.normal.toArray(m,x),m[x+3]=o.constant}l.value=m,l.needsUpdate=!0}return e.numPlanes=v,e.numIntersection=0,m}}function Fm(i){let e=new WeakMap;function t(o,a){return a===Ro?o.mapping=as:a===Do&&(o.mapping=ls),o}function n(o){if(o&&o.isTexture&&o.isRenderTargetTexture===!1){const a=o.mapping;if(a===Ro||a===Do)if(e.has(o)){const l=e.get(o).texture;return t(l,o.mapping)}else{const l=o.image;if(l&&l.height>0){const c=new td(l.height/2);return c.fromEquirectangularTexture(i,o),e.set(o,c),o.addEventListener("dispose",s),t(c.texture,o.mapping)}else return null}}return o}function s(o){const a=o.target;a.removeEventListener("dispose",s);const l=e.get(a);l!==void 0&&(e.delete(a),l.dispose())}function r(){e=new WeakMap}return{get:n,dispose:r}}class wu extends xu{constructor(e=-1,t=1,n=1,s=-1,r=.1,o=2e3){super(),this.isOrthographicCamera=!0,this.type="OrthographicCamera",this.zoom=1,this.view=null,this.left=e,this.right=t,this.top=n,this.bottom=s,this.near=r,this.far=o,this.updateProjectionMatrix()}copy(e,t){return super.copy(e,t),this.left=e.left,this.right=e.right,this.top=e.top,this.bottom=e.bottom,this.near=e.near,this.far=e.far,this.zoom=e.zoom,this.view=e.view===null?null:Object.assign({},e.view),this}setViewOffset(e,t,n,s,r,o){this.view===null&&(this.view={enabled:!0,fullWidth:1,fullHeight:1,offsetX:0,offsetY:0,width:1,height:1}),this.view.enabled=!0,this.view.fullWidth=e,this.view.fullHeight=t,this.view.offsetX=n,this.view.offsetY=s,this.view.width=r,this.view.height=o,this.updateProjectionMatrix()}clearViewOffset(){this.view!==null&&(this.view.enabled=!1),this.updateProjectionMatrix()}updateProjectionMatrix(){const e=(this.right-this.left)/(2*this.zoom),t=(this.top-this.bottom)/(2*this.zoom),n=(this.right+this.left)/2,s=(this.top+this.bottom)/2;let r=n-e,o=n+e,a=s+t,l=s-t;if(this.view!==null&&this.view.enabled){const c=(this.right-this.left)/this.view.fullWidth/this.zoom,f=(this.top-this.bottom)/this.view.fullHeight/this.zoom;r+=c*this.view.offsetX,o=r+c*this.view.width,a-=f*this.view.offsetY,l=a-f*this.view.height}this.projectionMatrix.makeOrthographic(r,o,a,l,this.near,this.far),this.projectionMatrixInverse.copy(this.projectionMatrix).invert()}toJSON(e){const t=super.toJSON(e);return t.object.zoom=this.zoom,t.object.left=this.left,t.object.right=this.right,t.object.top=this.top,t.object.bottom=this.bottom,t.object.near=this.near,t.object.far=this.far,this.view!==null&&(t.object.view=Object.assign({},this.view)),t}}const $i=4,nl=[.125,.215,.35,.446,.526,.582],Ei=20,vo=new wu,il=new ut;let bo=null;const yi=(1+Math.sqrt(5))/2,Ki=1/yi,sl=[new G(1,1,1),new G(-1,1,1),new G(1,1,-1),new G(-1,1,-1),new G(0,yi,Ki),new G(0,yi,-Ki),new G(Ki,0,yi),new G(-Ki,0,yi),new G(yi,Ki,0),new G(-yi,Ki,0)];class rl{constructor(e){this._renderer=e,this._pingPongRenderTarget=null,this._lodMax=0,this._cubeSize=0,this._lodPlanes=[],this._sizeLods=[],this._sigmas=[],this._blurMaterial=null,this._cubemapMaterial=null,this._equirectMaterial=null,this._compileMaterial(this._blurMaterial)}fromScene(e,t=0,n=.1,s=100){bo=this._renderer.getRenderTarget(),this._setSize(256);const r=this._allocateTargets();return r.depthBuffer=!0,this._sceneToCubeUV(e,n,s,r),t>0&&this._blur(r,0,0,t),this._applyPMREM(r),this._cleanup(r),r}fromEquirectangular(e,t=null){return this._fromTexture(e,t)}fromCubemap(e,t=null){return this._fromTexture(e,t)}compileCubemapShader(){this._cubemapMaterial===null&&(this._cubemapMaterial=ll(),this._compileMaterial(this._cubemapMaterial))}compileEquirectangularShader(){this._equirectMaterial===null&&(this._equirectMaterial=al(),this._compileMaterial(this._equirectMaterial))}dispose(){this._dispose(),this._cubemapMaterial!==null&&this._cubemapMaterial.dispose(),this._equirectMaterial!==null&&this._equirectMaterial.dispose()}_setSize(e){this._lodMax=Math.floor(Math.log2(e)),this._cubeSize=Math.pow(2,this._lodMax)}_dispose(){this._blurMaterial!==null&&this._blurMaterial.dispose(),this._pingPongRenderTarget!==null&&this._pingPongRenderTarget.dispose();for(let e=0;e<this._lodPlanes.length;e++)this._lodPlanes[e].dispose()}_cleanup(e){this._renderer.setRenderTarget(bo),e.scissorTest=!1,hr(e,0,0,e.width,e.height)}_fromTexture(e,t){e.mapping===as||e.mapping===ls?this._setSize(e.image.length===0?16:e.image[0].width||e.image[0].image.width):this._setSize(e.image.width/4),bo=this._renderer.getRenderTarget();const n=t||this._allocateTargets();return this._textureToCubeUV(e,n),this._applyPMREM(n),this._cleanup(n),n}_allocateTargets(){const e=3*Math.max(this._cubeSize,112),t=4*this._cubeSize,n={magFilter:Mn,minFilter:Mn,generateMipmaps:!1,type:Ns,format:Cn,encoding:ui,depthBuffer:!1},s=ol(e,t,n);if(this._pingPongRenderTarget===null||this._pingPongRenderTarget.width!==e||this._pingPongRenderTarget.height!==t){this._pingPongRenderTarget!==null&&this._dispose(),this._pingPongRenderTarget=ol(e,t,n);const{_lodMax:r}=this;({sizeLods:this._sizeLods,lodPlanes:this._lodPlanes,sigmas:this._sigmas}=Bm(r)),this._blurMaterial=Gm(r,e,t)}return s}_compileMaterial(e){const t=new Ee(this._lodPlanes[0],e);this._renderer.compile(t,vo)}_sceneToCubeUV(e,t,n,s){const a=new _n(90,1,t,n),l=[1,-1,1,1,1,1],c=[1,1,1,-1,-1,-1],f=this._renderer,h=f.autoClear,u=f.toneMapping;f.getClearColor(il),f.toneMapping=Nn,f.autoClear=!1;const p=new Ir({name:"PMREM.Background",side:un,depthWrite:!1,depthTest:!1}),g=new Ee(new At,p);let v=!1;const m=e.background;m?m.isColor&&(p.color.copy(m),e.background=null,v=!0):(p.color.copy(il),v=!0);for(let d=0;d<6;d++){const M=d%3;M===0?(a.up.set(0,l[d],0),a.lookAt(c[d],0,0)):M===1?(a.up.set(0,0,l[d]),a.lookAt(0,c[d],0)):(a.up.set(0,l[d],0),a.lookAt(0,0,c[d]));const b=this._cubeSize;hr(s,M*b,d>2?b:0,b,b),f.setRenderTarget(s),v&&f.render(g,a),f.render(e,a)}g.geometry.dispose(),g.material.dispose(),f.toneMapping=u,f.autoClear=h,e.background=m}_textureToCubeUV(e,t){const n=this._renderer,s=e.mapping===as||e.mapping===ls;s?(this._cubemapMaterial===null&&(this._cubemapMaterial=ll()),this._cubemapMaterial.uniforms.flipEnvMap.value=e.isRenderTargetTexture===!1?-1:1):this._equirectMaterial===null&&(this._equirectMaterial=al());const r=s?this._cubemapMaterial:this._equirectMaterial,o=new Ee(this._lodPlanes[0],r),a=r.uniforms;a.envMap.value=e;const l=this._cubeSize;hr(t,0,0,3*l,2*l),n.setRenderTarget(t),n.render(o,vo)}_applyPMREM(e){const t=this._renderer,n=t.autoClear;t.autoClear=!1;for(let s=1;s<this._lodPlanes.length;s++){const r=Math.sqrt(this._sigmas[s]*this._sigmas[s]-this._sigmas[s-1]*this._sigmas[s-1]),o=sl[(s-1)%sl.length];this._blur(e,s-1,s,r,o)}t.autoClear=n}_blur(e,t,n,s,r){const o=this._pingPongRenderTarget;this._halfBlur(e,o,t,n,s,"latitudinal",r),this._halfBlur(o,e,n,n,s,"longitudinal",r)}_halfBlur(e,t,n,s,r,o,a){const l=this._renderer,c=this._blurMaterial;o!=="latitudinal"&&o!=="longitudinal"&&console.error("blur direction must be either latitudinal or longitudinal!");const f=3,h=new Ee(this._lodPlanes[s],c),u=c.uniforms,p=this._sizeLods[n]-1,g=isFinite(r)?Math.PI/(2*p):2*Math.PI/(2*Ei-1),v=r/g,m=isFinite(r)?1+Math.floor(f*v):Ei;m>Ei&&console.warn(`sigmaRadians, ${r}, is too large and will clip, as it requested ${m} samples when the maximum is set to ${Ei}`);const d=[];let M=0;for(let L=0;L<Ei;++L){const w=L/v,_=Math.exp(-w*w/2);d.push(_),L===0?M+=_:L<m&&(M+=2*_)}for(let L=0;L<d.length;L++)d[L]=d[L]/M;u.envMap.value=e.texture,u.samples.value=m,u.weights.value=d,u.latitudinal.value=o==="latitudinal",a&&(u.poleAxis.value=a);const{_lodMax:b}=this;u.dTheta.value=g,u.mipInt.value=b-n;const x=this._sizeLods[s],y=3*x*(s>b-$i?s-b+$i:0),T=4*(this._cubeSize-x);hr(t,y,T,3*x,2*x),l.setRenderTarget(t),l.render(h,vo)}}function Bm(i){const e=[],t=[],n=[];let s=i;const r=i-$i+1+nl.length;for(let o=0;o<r;o++){const a=Math.pow(2,s);t.push(a);let l=1/a;o>i-$i?l=nl[o-i+$i-1]:o===0&&(l=0),n.push(l);const c=1/(a-2),f=-c,h=1+c,u=[f,f,h,f,h,h,f,f,h,h,f,h],p=6,g=6,v=3,m=2,d=1,M=new Float32Array(v*g*p),b=new Float32Array(m*g*p),x=new Float32Array(d*g*p);for(let T=0;T<p;T++){const L=T%3*2/3-1,w=T>2?0:-1,_=[L,w,0,L+2/3,w,0,L+2/3,w+1,0,L,w,0,L+2/3,w+1,0,L,w+1,0];M.set(_,v*g*T),b.set(u,m*g*T);const S=[T,T,T,T,T,T];x.set(S,d*g*T)}const y=new sn;y.setAttribute("position",new On(M,v)),y.setAttribute("uv",new On(b,m)),y.setAttribute("faceIndex",new On(x,d)),e.push(y),s>$i&&s--}return{lodPlanes:e,sizeLods:t,sigmas:n}}function ol(i,e,t){const n=new fi(i,e,t);return n.texture.mapping=Rr,n.texture.name="PMREM.cubeUv",n.scissorTest=!0,n}function hr(i,e,t,n,s){i.viewport.set(e,t,n,s),i.scissor.set(e,t,n,s)}function Gm(i,e,t){const n=new Float32Array(Ei),s=new G(0,1,0);return new $n({name:"SphericalGaussianBlur",defines:{n:Ei,CUBEUV_TEXEL_WIDTH:1/e,CUBEUV_TEXEL_HEIGHT:1/t,CUBEUV_MAX_MIP:`${i}.0`},uniforms:{envMap:{value:null},samples:{value:1},weights:{value:n},latitudinal:{value:!1},dTheta:{value:0},mipInt:{value:0},poleAxis:{value:s}},vertexShader:Zo(),fragmentShader:`

			precision mediump float;
			precision mediump int;

			varying vec3 vOutputDirection;

			uniform sampler2D envMap;
			uniform int samples;
			uniform float weights[ n ];
			uniform bool latitudinal;
			uniform float dTheta;
			uniform float mipInt;
			uniform vec3 poleAxis;

			#define ENVMAP_TYPE_CUBE_UV
			#include <cube_uv_reflection_fragment>

			vec3 getSample( float theta, vec3 axis ) {

				float cosTheta = cos( theta );
				// Rodrigues' axis-angle rotation
				vec3 sampleDirection = vOutputDirection * cosTheta
					+ cross( axis, vOutputDirection ) * sin( theta )
					+ axis * dot( axis, vOutputDirection ) * ( 1.0 - cosTheta );

				return bilinearCubeUV( envMap, sampleDirection, mipInt );

			}

			void main() {

				vec3 axis = latitudinal ? poleAxis : cross( poleAxis, vOutputDirection );

				if ( all( equal( axis, vec3( 0.0 ) ) ) ) {

					axis = vec3( vOutputDirection.z, 0.0, - vOutputDirection.x );

				}

				axis = normalize( axis );

				gl_FragColor = vec4( 0.0, 0.0, 0.0, 1.0 );
				gl_FragColor.rgb += weights[ 0 ] * getSample( 0.0, axis );

				for ( int i = 1; i < n; i++ ) {

					if ( i >= samples ) {

						break;

					}

					float theta = dTheta * float( i );
					gl_FragColor.rgb += weights[ i ] * getSample( -1.0 * theta, axis );
					gl_FragColor.rgb += weights[ i ] * getSample( theta, axis );

				}

			}
		`,blending:li,depthTest:!1,depthWrite:!1})}function al(){return new $n({name:"EquirectangularToCubeUV",uniforms:{envMap:{value:null}},vertexShader:Zo(),fragmentShader:`

			precision mediump float;
			precision mediump int;

			varying vec3 vOutputDirection;

			uniform sampler2D envMap;

			#include <common>

			void main() {

				vec3 outputDirection = normalize( vOutputDirection );
				vec2 uv = equirectUv( outputDirection );

				gl_FragColor = vec4( texture2D ( envMap, uv ).rgb, 1.0 );

			}
		`,blending:li,depthTest:!1,depthWrite:!1})}function ll(){return new $n({name:"CubemapToCubeUV",uniforms:{envMap:{value:null},flipEnvMap:{value:-1}},vertexShader:Zo(),fragmentShader:`

			precision mediump float;
			precision mediump int;

			uniform float flipEnvMap;

			varying vec3 vOutputDirection;

			uniform samplerCube envMap;

			void main() {

				gl_FragColor = textureCube( envMap, vec3( flipEnvMap * vOutputDirection.x, vOutputDirection.yz ) );

			}
		`,blending:li,depthTest:!1,depthWrite:!1})}function Zo(){return`

		precision mediump float;
		precision mediump int;

		attribute float faceIndex;

		varying vec3 vOutputDirection;

		// RH coordinate system; PMREM face-indexing convention
		vec3 getDirection( vec2 uv, float face ) {

			uv = 2.0 * uv - 1.0;

			vec3 direction = vec3( uv, 1.0 );

			if ( face == 0.0 ) {

				direction = direction.zyx; // ( 1, v, u ) pos x

			} else if ( face == 1.0 ) {

				direction = direction.xzy;
				direction.xz *= -1.0; // ( -u, 1, -v ) pos y

			} else if ( face == 2.0 ) {

				direction.x *= -1.0; // ( -u, v, 1 ) pos z

			} else if ( face == 3.0 ) {

				direction = direction.zyx;
				direction.xz *= -1.0; // ( -1, v, -u ) neg x

			} else if ( face == 4.0 ) {

				direction = direction.xzy;
				direction.xy *= -1.0; // ( -u, -1, v ) neg y

			} else if ( face == 5.0 ) {

				direction.z *= -1.0; // ( u, v, -1 ) neg z

			}

			return direction;

		}

		void main() {

			vOutputDirection = getDirection( uv, faceIndex );
			gl_Position = vec4( position, 1.0 );

		}
	`}function Hm(i){let e=new WeakMap,t=null;function n(a){if(a&&a.isTexture){const l=a.mapping,c=l===Ro||l===Do,f=l===as||l===ls;if(c||f)if(a.isRenderTargetTexture&&a.needsPMREMUpdate===!0){a.needsPMREMUpdate=!1;let h=e.get(a);return t===null&&(t=new rl(i)),h=c?t.fromEquirectangular(a,h):t.fromCubemap(a,h),e.set(a,h),h.texture}else{if(e.has(a))return e.get(a).texture;{const h=a.image;if(c&&h&&h.height>0||f&&h&&s(h)){t===null&&(t=new rl(i));const u=c?t.fromEquirectangular(a):t.fromCubemap(a);return e.set(a,u),a.addEventListener("dispose",r),u.texture}else return null}}}return a}function s(a){let l=0;const c=6;for(let f=0;f<c;f++)a[f]!==void 0&&l++;return l===c}function r(a){const l=a.target;l.removeEventListener("dispose",r);const c=e.get(l);c!==void 0&&(e.delete(l),c.dispose())}function o(){e=new WeakMap,t!==null&&(t.dispose(),t=null)}return{get:n,dispose:o}}function Vm(i){const e={};function t(n){if(e[n]!==void 0)return e[n];let s;switch(n){case"WEBGL_depth_texture":s=i.getExtension("WEBGL_depth_texture")||i.getExtension("MOZ_WEBGL_depth_texture")||i.getExtension("WEBKIT_WEBGL_depth_texture");break;case"EXT_texture_filter_anisotropic":s=i.getExtension("EXT_texture_filter_anisotropic")||i.getExtension("MOZ_EXT_texture_filter_anisotropic")||i.getExtension("WEBKIT_EXT_texture_filter_anisotropic");break;case"WEBGL_compressed_texture_s3tc":s=i.getExtension("WEBGL_compressed_texture_s3tc")||i.getExtension("MOZ_WEBGL_compressed_texture_s3tc")||i.getExtension("WEBKIT_WEBGL_compressed_texture_s3tc");break;case"WEBGL_compressed_texture_pvrtc":s=i.getExtension("WEBGL_compressed_texture_pvrtc")||i.getExtension("WEBKIT_WEBGL_compressed_texture_pvrtc");break;default:s=i.getExtension(n)}return e[n]=s,s}return{has:function(n){return t(n)!==null},init:function(n){n.isWebGL2?t("EXT_color_buffer_float"):(t("WEBGL_depth_texture"),t("OES_texture_float"),t("OES_texture_half_float"),t("OES_texture_half_float_linear"),t("OES_standard_derivatives"),t("OES_element_index_uint"),t("OES_vertex_array_object"),t("ANGLE_instanced_arrays")),t("OES_texture_float_linear"),t("EXT_color_buffer_half_float"),t("WEBGL_multisampled_render_to_texture")},get:function(n){const s=t(n);return s===null&&console.warn("THREE.WebGLRenderer: "+n+" extension not supported."),s}}}function Wm(i,e,t,n){const s={},r=new WeakMap;function o(h){const u=h.target;u.index!==null&&e.remove(u.index);for(const g in u.attributes)e.remove(u.attributes[g]);u.removeEventListener("dispose",o),delete s[u.id];const p=r.get(u);p&&(e.remove(p),r.delete(u)),n.releaseStatesOfGeometry(u),u.isInstancedBufferGeometry===!0&&delete u._maxInstanceCount,t.memory.geometries--}function a(h,u){return s[u.id]===!0||(u.addEventListener("dispose",o),s[u.id]=!0,t.memory.geometries++),u}function l(h){const u=h.attributes;for(const g in u)e.update(u[g],34962);const p=h.morphAttributes;for(const g in p){const v=p[g];for(let m=0,d=v.length;m<d;m++)e.update(v[m],34962)}}function c(h){const u=[],p=h.index,g=h.attributes.position;let v=0;if(p!==null){const M=p.array;v=p.version;for(let b=0,x=M.length;b<x;b+=3){const y=M[b+0],T=M[b+1],L=M[b+2];u.push(y,T,T,L,L,y)}}else{const M=g.array;v=g.version;for(let b=0,x=M.length/3-1;b<x;b+=3){const y=b+0,T=b+1,L=b+2;u.push(y,T,T,L,L,y)}}const m=new(hu(u)?vu:_u)(u,1);m.version=v;const d=r.get(h);d&&e.remove(d),r.set(h,m)}function f(h){const u=r.get(h);if(u){const p=h.index;p!==null&&u.version<p.version&&c(h)}else c(h);return r.get(h)}return{get:a,update:l,getWireframeAttribute:f}}function jm(i,e,t,n){const s=n.isWebGL2;let r;function o(u){r=u}let a,l;function c(u){a=u.type,l=u.bytesPerElement}function f(u,p){i.drawElements(r,p,a,u*l),t.update(p,r,1)}function h(u,p,g){if(g===0)return;let v,m;if(s)v=i,m="drawElementsInstanced";else if(v=e.get("ANGLE_instanced_arrays"),m="drawElementsInstancedANGLE",v===null){console.error("THREE.WebGLIndexedBufferRenderer: using THREE.InstancedBufferGeometry but hardware does not support extension ANGLE_instanced_arrays.");return}v[m](r,p,a,u*l,g),t.update(p,r,g)}this.setMode=o,this.setIndex=c,this.render=f,this.renderInstances=h}function Xm(i){const e={geometries:0,textures:0},t={frame:0,calls:0,triangles:0,points:0,lines:0};function n(r,o,a){switch(t.calls++,o){case 4:t.triangles+=a*(r/3);break;case 1:t.lines+=a*(r/2);break;case 3:t.lines+=a*(r-1);break;case 2:t.lines+=a*r;break;case 0:t.points+=a*r;break;default:console.error("THREE.WebGLInfo: Unknown draw mode:",o);break}}function s(){t.frame++,t.calls=0,t.triangles=0,t.points=0,t.lines=0}return{memory:e,render:t,programs:null,autoReset:!0,reset:s,update:n}}function qm(i,e){return i[0]-e[0]}function Ym(i,e){return Math.abs(e[1])-Math.abs(i[1])}function Zm(i,e,t){const n={},s=new Float32Array(8),r=new WeakMap,o=new Xt,a=[];for(let c=0;c<8;c++)a[c]=[c,0];function l(c,f,h){const u=c.morphTargetInfluences;if(e.isWebGL2===!0){const g=f.morphAttributes.position||f.morphAttributes.normal||f.morphAttributes.color,v=g!==void 0?g.length:0;let m=r.get(f);if(m===void 0||m.count!==v){let N=function(){C.dispose(),r.delete(f),f.removeEventListener("dispose",N)};var p=N;m!==void 0&&m.texture.dispose();const b=f.morphAttributes.position!==void 0,x=f.morphAttributes.normal!==void 0,y=f.morphAttributes.color!==void 0,T=f.morphAttributes.position||[],L=f.morphAttributes.normal||[],w=f.morphAttributes.color||[];let _=0;b===!0&&(_=1),x===!0&&(_=2),y===!0&&(_=3);let S=f.attributes.position.count*_,B=1;S>e.maxTextureSize&&(B=Math.ceil(S/e.maxTextureSize),S=e.maxTextureSize);const k=new Float32Array(S*B*4*v),C=new mu(k,S,B,v);C.type=Ci,C.needsUpdate=!0;const U=_*4;for(let j=0;j<v;j++){const D=T[j],V=L[j],W=w[j],Q=S*B*4*j;for(let oe=0;oe<D.count;oe++){const ee=oe*U;b===!0&&(o.fromBufferAttribute(D,oe),k[Q+ee+0]=o.x,k[Q+ee+1]=o.y,k[Q+ee+2]=o.z,k[Q+ee+3]=0),x===!0&&(o.fromBufferAttribute(V,oe),k[Q+ee+4]=o.x,k[Q+ee+5]=o.y,k[Q+ee+6]=o.z,k[Q+ee+7]=0),y===!0&&(o.fromBufferAttribute(W,oe),k[Q+ee+8]=o.x,k[Q+ee+9]=o.y,k[Q+ee+10]=o.z,k[Q+ee+11]=W.itemSize===4?o.w:1)}}m={count:v,texture:C,size:new st(S,B)},r.set(f,m),f.addEventListener("dispose",N)}let d=0;for(let b=0;b<u.length;b++)d+=u[b];const M=f.morphTargetsRelative?1:1-d;h.getUniforms().setValue(i,"morphTargetBaseInfluence",M),h.getUniforms().setValue(i,"morphTargetInfluences",u),h.getUniforms().setValue(i,"morphTargetsTexture",m.texture,t),h.getUniforms().setValue(i,"morphTargetsTextureSize",m.size)}else{const g=u===void 0?0:u.length;let v=n[f.id];if(v===void 0||v.length!==g){v=[];for(let x=0;x<g;x++)v[x]=[x,0];n[f.id]=v}for(let x=0;x<g;x++){const y=v[x];y[0]=x,y[1]=u[x]}v.sort(Ym);for(let x=0;x<8;x++)x<g&&v[x][1]?(a[x][0]=v[x][0],a[x][1]=v[x][1]):(a[x][0]=Number.MAX_SAFE_INTEGER,a[x][1]=0);a.sort(qm);const m=f.morphAttributes.position,d=f.morphAttributes.normal;let M=0;for(let x=0;x<8;x++){const y=a[x],T=y[0],L=y[1];T!==Number.MAX_SAFE_INTEGER&&L?(m&&f.getAttribute("morphTarget"+x)!==m[T]&&f.setAttribute("morphTarget"+x,m[T]),d&&f.getAttribute("morphNormal"+x)!==d[T]&&f.setAttribute("morphNormal"+x,d[T]),s[x]=L,M+=L):(m&&f.hasAttribute("morphTarget"+x)===!0&&f.deleteAttribute("morphTarget"+x),d&&f.hasAttribute("morphNormal"+x)===!0&&f.deleteAttribute("morphNormal"+x),s[x]=0)}const b=f.morphTargetsRelative?1:1-M;h.getUniforms().setValue(i,"morphTargetBaseInfluence",b),h.getUniforms().setValue(i,"morphTargetInfluences",s)}}return{update:l}}function Km(i,e,t,n){let s=new WeakMap;function r(l){const c=n.render.frame,f=l.geometry,h=e.get(l,f);return s.get(h)!==c&&(e.update(h),s.set(h,c)),l.isInstancedMesh&&(l.hasEventListener("dispose",a)===!1&&l.addEventListener("dispose",a),t.update(l.instanceMatrix,34962),l.instanceColor!==null&&t.update(l.instanceColor,34962)),h}function o(){s=new WeakMap}function a(l){const c=l.target;c.removeEventListener("dispose",a),t.remove(c.instanceMatrix),c.instanceColor!==null&&t.remove(c.instanceColor)}return{update:r,dispose:o}}const Eu=new fn,Tu=new mu,Au=new Bh,Cu=new Su,cl=[],ul=[],fl=new Float32Array(16),hl=new Float32Array(9),dl=new Float32Array(4);function gs(i,e,t){const n=i[0];if(n<=0||n>0)return i;const s=e*t;let r=cl[s];if(r===void 0&&(r=new Float32Array(s),cl[s]=r),e!==0){n.toArray(r,0);for(let o=1,a=0;o!==e;++o)a+=t,i[o].toArray(r,a)}return r}function zt(i,e){if(i.length!==e.length)return!1;for(let t=0,n=i.length;t<n;t++)if(i[t]!==e[t])return!1;return!0}function kt(i,e){for(let t=0,n=e.length;t<n;t++)i[t]=e[t]}function zr(i,e){let t=ul[e];t===void 0&&(t=new Int32Array(e),ul[e]=t);for(let n=0;n!==e;++n)t[n]=i.allocateTextureUnit();return t}function Qm(i,e){const t=this.cache;t[0]!==e&&(i.uniform1f(this.addr,e),t[0]=e)}function Jm(i,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y)&&(i.uniform2f(this.addr,e.x,e.y),t[0]=e.x,t[1]=e.y);else{if(zt(t,e))return;i.uniform2fv(this.addr,e),kt(t,e)}}function $m(i,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z)&&(i.uniform3f(this.addr,e.x,e.y,e.z),t[0]=e.x,t[1]=e.y,t[2]=e.z);else if(e.r!==void 0)(t[0]!==e.r||t[1]!==e.g||t[2]!==e.b)&&(i.uniform3f(this.addr,e.r,e.g,e.b),t[0]=e.r,t[1]=e.g,t[2]=e.b);else{if(zt(t,e))return;i.uniform3fv(this.addr,e),kt(t,e)}}function eg(i,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z||t[3]!==e.w)&&(i.uniform4f(this.addr,e.x,e.y,e.z,e.w),t[0]=e.x,t[1]=e.y,t[2]=e.z,t[3]=e.w);else{if(zt(t,e))return;i.uniform4fv(this.addr,e),kt(t,e)}}function tg(i,e){const t=this.cache,n=e.elements;if(n===void 0){if(zt(t,e))return;i.uniformMatrix2fv(this.addr,!1,e),kt(t,e)}else{if(zt(t,n))return;dl.set(n),i.uniformMatrix2fv(this.addr,!1,dl),kt(t,n)}}function ng(i,e){const t=this.cache,n=e.elements;if(n===void 0){if(zt(t,e))return;i.uniformMatrix3fv(this.addr,!1,e),kt(t,e)}else{if(zt(t,n))return;hl.set(n),i.uniformMatrix3fv(this.addr,!1,hl),kt(t,n)}}function ig(i,e){const t=this.cache,n=e.elements;if(n===void 0){if(zt(t,e))return;i.uniformMatrix4fv(this.addr,!1,e),kt(t,e)}else{if(zt(t,n))return;fl.set(n),i.uniformMatrix4fv(this.addr,!1,fl),kt(t,n)}}function sg(i,e){const t=this.cache;t[0]!==e&&(i.uniform1i(this.addr,e),t[0]=e)}function rg(i,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y)&&(i.uniform2i(this.addr,e.x,e.y),t[0]=e.x,t[1]=e.y);else{if(zt(t,e))return;i.uniform2iv(this.addr,e),kt(t,e)}}function og(i,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z)&&(i.uniform3i(this.addr,e.x,e.y,e.z),t[0]=e.x,t[1]=e.y,t[2]=e.z);else{if(zt(t,e))return;i.uniform3iv(this.addr,e),kt(t,e)}}function ag(i,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z||t[3]!==e.w)&&(i.uniform4i(this.addr,e.x,e.y,e.z,e.w),t[0]=e.x,t[1]=e.y,t[2]=e.z,t[3]=e.w);else{if(zt(t,e))return;i.uniform4iv(this.addr,e),kt(t,e)}}function lg(i,e){const t=this.cache;t[0]!==e&&(i.uniform1ui(this.addr,e),t[0]=e)}function cg(i,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y)&&(i.uniform2ui(this.addr,e.x,e.y),t[0]=e.x,t[1]=e.y);else{if(zt(t,e))return;i.uniform2uiv(this.addr,e),kt(t,e)}}function ug(i,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z)&&(i.uniform3ui(this.addr,e.x,e.y,e.z),t[0]=e.x,t[1]=e.y,t[2]=e.z);else{if(zt(t,e))return;i.uniform3uiv(this.addr,e),kt(t,e)}}function fg(i,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z||t[3]!==e.w)&&(i.uniform4ui(this.addr,e.x,e.y,e.z,e.w),t[0]=e.x,t[1]=e.y,t[2]=e.z,t[3]=e.w);else{if(zt(t,e))return;i.uniform4uiv(this.addr,e),kt(t,e)}}function hg(i,e,t){const n=this.cache,s=t.allocateTextureUnit();n[0]!==s&&(i.uniform1i(this.addr,s),n[0]=s),t.setTexture2D(e||Eu,s)}function dg(i,e,t){const n=this.cache,s=t.allocateTextureUnit();n[0]!==s&&(i.uniform1i(this.addr,s),n[0]=s),t.setTexture3D(e||Au,s)}function pg(i,e,t){const n=this.cache,s=t.allocateTextureUnit();n[0]!==s&&(i.uniform1i(this.addr,s),n[0]=s),t.setTextureCube(e||Cu,s)}function mg(i,e,t){const n=this.cache,s=t.allocateTextureUnit();n[0]!==s&&(i.uniform1i(this.addr,s),n[0]=s),t.setTexture2DArray(e||Tu,s)}function gg(i){switch(i){case 5126:return Qm;case 35664:return Jm;case 35665:return $m;case 35666:return eg;case 35674:return tg;case 35675:return ng;case 35676:return ig;case 5124:case 35670:return sg;case 35667:case 35671:return rg;case 35668:case 35672:return og;case 35669:case 35673:return ag;case 5125:return lg;case 36294:return cg;case 36295:return ug;case 36296:return fg;case 35678:case 36198:case 36298:case 36306:case 35682:return hg;case 35679:case 36299:case 36307:return dg;case 35680:case 36300:case 36308:case 36293:return pg;case 36289:case 36303:case 36311:case 36292:return mg}}function _g(i,e){i.uniform1fv(this.addr,e)}function vg(i,e){const t=gs(e,this.size,2);i.uniform2fv(this.addr,t)}function bg(i,e){const t=gs(e,this.size,3);i.uniform3fv(this.addr,t)}function Mg(i,e){const t=gs(e,this.size,4);i.uniform4fv(this.addr,t)}function xg(i,e){const t=gs(e,this.size,4);i.uniformMatrix2fv(this.addr,!1,t)}function Sg(i,e){const t=gs(e,this.size,9);i.uniformMatrix3fv(this.addr,!1,t)}function yg(i,e){const t=gs(e,this.size,16);i.uniformMatrix4fv(this.addr,!1,t)}function wg(i,e){i.uniform1iv(this.addr,e)}function Eg(i,e){i.uniform2iv(this.addr,e)}function Tg(i,e){i.uniform3iv(this.addr,e)}function Ag(i,e){i.uniform4iv(this.addr,e)}function Cg(i,e){i.uniform1uiv(this.addr,e)}function Pg(i,e){i.uniform2uiv(this.addr,e)}function Lg(i,e){i.uniform3uiv(this.addr,e)}function Rg(i,e){i.uniform4uiv(this.addr,e)}function Dg(i,e,t){const n=this.cache,s=e.length,r=zr(t,s);zt(n,r)||(i.uniform1iv(this.addr,r),kt(n,r));for(let o=0;o!==s;++o)t.setTexture2D(e[o]||Eu,r[o])}function Ig(i,e,t){const n=this.cache,s=e.length,r=zr(t,s);zt(n,r)||(i.uniform1iv(this.addr,r),kt(n,r));for(let o=0;o!==s;++o)t.setTexture3D(e[o]||Au,r[o])}function Ug(i,e,t){const n=this.cache,s=e.length,r=zr(t,s);zt(n,r)||(i.uniform1iv(this.addr,r),kt(n,r));for(let o=0;o!==s;++o)t.setTextureCube(e[o]||Cu,r[o])}function zg(i,e,t){const n=this.cache,s=e.length,r=zr(t,s);zt(n,r)||(i.uniform1iv(this.addr,r),kt(n,r));for(let o=0;o!==s;++o)t.setTexture2DArray(e[o]||Tu,r[o])}function kg(i){switch(i){case 5126:return _g;case 35664:return vg;case 35665:return bg;case 35666:return Mg;case 35674:return xg;case 35675:return Sg;case 35676:return yg;case 5124:case 35670:return wg;case 35667:case 35671:return Eg;case 35668:case 35672:return Tg;case 35669:case 35673:return Ag;case 5125:return Cg;case 36294:return Pg;case 36295:return Lg;case 36296:return Rg;case 35678:case 36198:case 36298:case 36306:case 35682:return Dg;case 35679:case 36299:case 36307:return Ig;case 35680:case 36300:case 36308:case 36293:return Ug;case 36289:case 36303:case 36311:case 36292:return zg}}class Ng{constructor(e,t,n){this.id=e,this.addr=n,this.cache=[],this.setValue=gg(t.type)}}class Og{constructor(e,t,n){this.id=e,this.addr=n,this.cache=[],this.size=t.size,this.setValue=kg(t.type)}}class Fg{constructor(e){this.id=e,this.seq=[],this.map={}}setValue(e,t,n){const s=this.seq;for(let r=0,o=s.length;r!==o;++r){const a=s[r];a.setValue(e,t[a.id],n)}}}const Mo=/(\w+)(\])?(\[|\.)?/g;function pl(i,e){i.seq.push(e),i.map[e.id]=e}function Bg(i,e,t){const n=i.name,s=n.length;for(Mo.lastIndex=0;;){const r=Mo.exec(n),o=Mo.lastIndex;let a=r[1];const l=r[2]==="]",c=r[3];if(l&&(a=a|0),c===void 0||c==="["&&o+2===s){pl(t,c===void 0?new Ng(a,i,e):new Og(a,i,e));break}else{let h=t.map[a];h===void 0&&(h=new Fg(a),pl(t,h)),t=h}}}class Mr{constructor(e,t){this.seq=[],this.map={};const n=e.getProgramParameter(t,35718);for(let s=0;s<n;++s){const r=e.getActiveUniform(t,s),o=e.getUniformLocation(t,r.name);Bg(r,o,this)}}setValue(e,t,n,s){const r=this.map[t];r!==void 0&&r.setValue(e,n,s)}setOptional(e,t,n){const s=t[n];s!==void 0&&this.setValue(e,n,s)}static upload(e,t,n,s){for(let r=0,o=t.length;r!==o;++r){const a=t[r],l=n[a.id];l.needsUpdate!==!1&&a.setValue(e,l.value,s)}}static seqWithValue(e,t){const n=[];for(let s=0,r=e.length;s!==r;++s){const o=e[s];o.id in t&&n.push(o)}return n}}function ml(i,e,t){const n=i.createShader(e);return i.shaderSource(n,t),i.compileShader(n),n}let Gg=0;function Hg(i,e){const t=i.split(`
`),n=[],s=Math.max(e-6,0),r=Math.min(e+6,t.length);for(let o=s;o<r;o++){const a=o+1;n.push(`${a===e?">":" "} ${a}: ${t[o]}`)}return n.join(`
`)}function Vg(i){switch(i){case ui:return["Linear","( value )"];case vt:return["sRGB","( value )"];default:return console.warn("THREE.WebGLProgram: Unsupported encoding:",i),["Linear","( value )"]}}function gl(i,e,t){const n=i.getShaderParameter(e,35713),s=i.getShaderInfoLog(e).trim();if(n&&s==="")return"";const r=/ERROR: 0:(\d+)/.exec(s);if(r){const o=parseInt(r[1]);return t.toUpperCase()+`

`+s+`

`+Hg(i.getShaderSource(e),o)}else return s}function Wg(i,e){const t=Vg(e);return"vec4 "+i+"( vec4 value ) { return LinearTo"+t[0]+t[1]+"; }"}function jg(i,e){let t;switch(e){case Zf:t="Linear";break;case Kf:t="Reinhard";break;case Qf:t="OptimizedCineon";break;case ou:t="ACESFilmic";break;case Jf:t="Custom";break;default:console.warn("THREE.WebGLProgram: Unsupported toneMapping:",e),t="Linear"}return"vec3 "+i+"( vec3 color ) { return "+t+"ToneMapping( color ); }"}function Xg(i){return[i.extensionDerivatives||!!i.envMapCubeUVHeight||i.bumpMap||i.normalMapTangentSpace||i.clearcoatNormalMap||i.flatShading||i.shaderID==="physical"?"#extension GL_OES_standard_derivatives : enable":"",(i.extensionFragDepth||i.logarithmicDepthBuffer)&&i.rendererExtensionFragDepth?"#extension GL_EXT_frag_depth : enable":"",i.extensionDrawBuffers&&i.rendererExtensionDrawBuffers?"#extension GL_EXT_draw_buffers : require":"",(i.extensionShaderTextureLOD||i.envMap||i.transmission)&&i.rendererExtensionShaderTextureLod?"#extension GL_EXT_shader_texture_lod : enable":""].filter(Cs).join(`
`)}function qg(i){const e=[];for(const t in i){const n=i[t];n!==!1&&e.push("#define "+t+" "+n)}return e.join(`
`)}function Yg(i,e){const t={},n=i.getProgramParameter(e,35721);for(let s=0;s<n;s++){const r=i.getActiveAttrib(e,s),o=r.name;let a=1;r.type===35674&&(a=2),r.type===35675&&(a=3),r.type===35676&&(a=4),t[o]={type:r.type,location:i.getAttribLocation(e,o),locationSize:a}}return t}function Cs(i){return i!==""}function _l(i,e){const t=e.numSpotLightShadows+e.numSpotLightMaps-e.numSpotLightShadowsWithMaps;return i.replace(/NUM_DIR_LIGHTS/g,e.numDirLights).replace(/NUM_SPOT_LIGHTS/g,e.numSpotLights).replace(/NUM_SPOT_LIGHT_MAPS/g,e.numSpotLightMaps).replace(/NUM_SPOT_LIGHT_COORDS/g,t).replace(/NUM_RECT_AREA_LIGHTS/g,e.numRectAreaLights).replace(/NUM_POINT_LIGHTS/g,e.numPointLights).replace(/NUM_HEMI_LIGHTS/g,e.numHemiLights).replace(/NUM_DIR_LIGHT_SHADOWS/g,e.numDirLightShadows).replace(/NUM_SPOT_LIGHT_SHADOWS_WITH_MAPS/g,e.numSpotLightShadowsWithMaps).replace(/NUM_SPOT_LIGHT_SHADOWS/g,e.numSpotLightShadows).replace(/NUM_POINT_LIGHT_SHADOWS/g,e.numPointLightShadows)}function vl(i,e){return i.replace(/NUM_CLIPPING_PLANES/g,e.numClippingPlanes).replace(/UNION_CLIPPING_PLANES/g,e.numClippingPlanes-e.numClipIntersection)}const Zg=/^[ \t]*#include +<([\w\d./]+)>/gm;function No(i){return i.replace(Zg,Kg)}function Kg(i,e){const t=Qe[e];if(t===void 0)throw new Error("Can not resolve #include <"+e+">");return No(t)}const Qg=/#pragma unroll_loop_start\s+for\s*\(\s*int\s+i\s*=\s*(\d+)\s*;\s*i\s*<\s*(\d+)\s*;\s*i\s*\+\+\s*\)\s*{([\s\S]+?)}\s+#pragma unroll_loop_end/g;function bl(i){return i.replace(Qg,Jg)}function Jg(i,e,t,n){let s="";for(let r=parseInt(e);r<parseInt(t);r++)s+=n.replace(/\[\s*i\s*\]/g,"[ "+r+" ]").replace(/UNROLLED_LOOP_INDEX/g,r);return s}function Ml(i){let e="precision "+i.precision+` float;
precision `+i.precision+" int;";return i.precision==="highp"?e+=`
#define HIGH_PRECISION`:i.precision==="mediump"?e+=`
#define MEDIUM_PRECISION`:i.precision==="lowp"&&(e+=`
#define LOW_PRECISION`),e}function $g(i){let e="SHADOWMAP_TYPE_BASIC";return i.shadowMapType===tu?e="SHADOWMAP_TYPE_PCF":i.shadowMapType===nu?e="SHADOWMAP_TYPE_PCF_SOFT":i.shadowMapType===Ts&&(e="SHADOWMAP_TYPE_VSM"),e}function e_(i){let e="ENVMAP_TYPE_CUBE";if(i.envMap)switch(i.envMapMode){case as:case ls:e="ENVMAP_TYPE_CUBE";break;case Rr:e="ENVMAP_TYPE_CUBE_UV";break}return e}function t_(i){let e="ENVMAP_MODE_REFLECTION";if(i.envMap)switch(i.envMapMode){case ls:e="ENVMAP_MODE_REFRACTION";break}return e}function n_(i){let e="ENVMAP_BLENDING_NONE";if(i.envMap)switch(i.combine){case ru:e="ENVMAP_BLENDING_MULTIPLY";break;case qf:e="ENVMAP_BLENDING_MIX";break;case Yf:e="ENVMAP_BLENDING_ADD";break}return e}function i_(i){const e=i.envMapCubeUVHeight;if(e===null)return null;const t=Math.log2(e)-2,n=1/e;return{texelWidth:1/(3*Math.max(Math.pow(2,t),7*16)),texelHeight:n,maxMip:t}}function s_(i,e,t,n){const s=i.getContext(),r=t.defines;let o=t.vertexShader,a=t.fragmentShader;const l=$g(t),c=e_(t),f=t_(t),h=n_(t),u=i_(t),p=t.isWebGL2?"":Xg(t),g=qg(r),v=s.createProgram();let m,d,M=t.glslVersion?"#version "+t.glslVersion+`
`:"";t.isRawShaderMaterial?(m=[g].filter(Cs).join(`
`),m.length>0&&(m+=`
`),d=[p,g].filter(Cs).join(`
`),d.length>0&&(d+=`
`)):(m=[Ml(t),"#define SHADER_NAME "+t.shaderName,g,t.instancing?"#define USE_INSTANCING":"",t.instancingColor?"#define USE_INSTANCING_COLOR":"",t.useFog&&t.fog?"#define USE_FOG":"",t.useFog&&t.fogExp2?"#define FOG_EXP2":"",t.map?"#define USE_MAP":"",t.envMap?"#define USE_ENVMAP":"",t.envMap?"#define "+f:"",t.lightMap?"#define USE_LIGHTMAP":"",t.aoMap?"#define USE_AOMAP":"",t.bumpMap?"#define USE_BUMPMAP":"",t.normalMap?"#define USE_NORMALMAP":"",t.normalMapObjectSpace?"#define USE_NORMALMAP_OBJECTSPACE":"",t.normalMapTangentSpace?"#define USE_NORMALMAP_TANGENTSPACE":"",t.displacementMap?"#define USE_DISPLACEMENTMAP":"",t.emissiveMap?"#define USE_EMISSIVEMAP":"",t.clearcoatMap?"#define USE_CLEARCOATMAP":"",t.clearcoatRoughnessMap?"#define USE_CLEARCOAT_ROUGHNESSMAP":"",t.clearcoatNormalMap?"#define USE_CLEARCOAT_NORMALMAP":"",t.iridescenceMap?"#define USE_IRIDESCENCEMAP":"",t.iridescenceThicknessMap?"#define USE_IRIDESCENCE_THICKNESSMAP":"",t.specularMap?"#define USE_SPECULARMAP":"",t.specularColorMap?"#define USE_SPECULAR_COLORMAP":"",t.specularIntensityMap?"#define USE_SPECULAR_INTENSITYMAP":"",t.roughnessMap?"#define USE_ROUGHNESSMAP":"",t.metalnessMap?"#define USE_METALNESSMAP":"",t.alphaMap?"#define USE_ALPHAMAP":"",t.transmission?"#define USE_TRANSMISSION":"",t.transmissionMap?"#define USE_TRANSMISSIONMAP":"",t.thicknessMap?"#define USE_THICKNESSMAP":"",t.sheenColorMap?"#define USE_SHEEN_COLORMAP":"",t.sheenRoughnessMap?"#define USE_SHEEN_ROUGHNESSMAP":"",t.mapUv?"#define MAP_UV "+t.mapUv:"",t.alphaMapUv?"#define ALPHAMAP_UV "+t.alphaMapUv:"",t.lightMapUv?"#define LIGHTMAP_UV "+t.lightMapUv:"",t.aoMapUv?"#define AOMAP_UV "+t.aoMapUv:"",t.emissiveMapUv?"#define EMISSIVEMAP_UV "+t.emissiveMapUv:"",t.bumpMapUv?"#define BUMPMAP_UV "+t.bumpMapUv:"",t.normalMapUv?"#define NORMALMAP_UV "+t.normalMapUv:"",t.displacementMapUv?"#define DISPLACEMENTMAP_UV "+t.displacementMapUv:"",t.metalnessMapUv?"#define METALNESSMAP_UV "+t.metalnessMapUv:"",t.roughnessMapUv?"#define ROUGHNESSMAP_UV "+t.roughnessMapUv:"",t.clearcoatMapUv?"#define CLEARCOATMAP_UV "+t.clearcoatMapUv:"",t.clearcoatNormalMapUv?"#define CLEARCOAT_NORMALMAP_UV "+t.clearcoatNormalMapUv:"",t.clearcoatRoughnessMapUv?"#define CLEARCOAT_ROUGHNESSMAP_UV "+t.clearcoatRoughnessMapUv:"",t.iridescenceMapUv?"#define IRIDESCENCEMAP_UV "+t.iridescenceMapUv:"",t.iridescenceThicknessMapUv?"#define IRIDESCENCE_THICKNESSMAP_UV "+t.iridescenceThicknessMapUv:"",t.sheenColorMapUv?"#define SHEEN_COLORMAP_UV "+t.sheenColorMapUv:"",t.sheenRoughnessMapUv?"#define SHEEN_ROUGHNESSMAP_UV "+t.sheenRoughnessMapUv:"",t.specularMapUv?"#define SPECULARMAP_UV "+t.specularMapUv:"",t.specularColorMapUv?"#define SPECULAR_COLORMAP_UV "+t.specularColorMapUv:"",t.specularIntensityMapUv?"#define SPECULAR_INTENSITYMAP_UV "+t.specularIntensityMapUv:"",t.transmissionMapUv?"#define TRANSMISSIONMAP_UV "+t.transmissionMapUv:"",t.thicknessMapUv?"#define THICKNESSMAP_UV "+t.thicknessMapUv:"",t.vertexTangents?"#define USE_TANGENT":"",t.vertexColors?"#define USE_COLOR":"",t.vertexAlphas?"#define USE_COLOR_ALPHA":"",t.vertexUvs2?"#define USE_UV2":"",t.pointsUvs?"#define USE_POINTS_UV":"",t.flatShading?"#define FLAT_SHADED":"",t.skinning?"#define USE_SKINNING":"",t.morphTargets?"#define USE_MORPHTARGETS":"",t.morphNormals&&t.flatShading===!1?"#define USE_MORPHNORMALS":"",t.morphColors&&t.isWebGL2?"#define USE_MORPHCOLORS":"",t.morphTargetsCount>0&&t.isWebGL2?"#define MORPHTARGETS_TEXTURE":"",t.morphTargetsCount>0&&t.isWebGL2?"#define MORPHTARGETS_TEXTURE_STRIDE "+t.morphTextureStride:"",t.morphTargetsCount>0&&t.isWebGL2?"#define MORPHTARGETS_COUNT "+t.morphTargetsCount:"",t.doubleSided?"#define DOUBLE_SIDED":"",t.flipSided?"#define FLIP_SIDED":"",t.shadowMapEnabled?"#define USE_SHADOWMAP":"",t.shadowMapEnabled?"#define "+l:"",t.sizeAttenuation?"#define USE_SIZEATTENUATION":"",t.logarithmicDepthBuffer?"#define USE_LOGDEPTHBUF":"",t.logarithmicDepthBuffer&&t.rendererExtensionFragDepth?"#define USE_LOGDEPTHBUF_EXT":"","uniform mat4 modelMatrix;","uniform mat4 modelViewMatrix;","uniform mat4 projectionMatrix;","uniform mat4 viewMatrix;","uniform mat3 normalMatrix;","uniform vec3 cameraPosition;","uniform bool isOrthographic;","#ifdef USE_INSTANCING","	attribute mat4 instanceMatrix;","#endif","#ifdef USE_INSTANCING_COLOR","	attribute vec3 instanceColor;","#endif","attribute vec3 position;","attribute vec3 normal;","attribute vec2 uv;","#ifdef USE_TANGENT","	attribute vec4 tangent;","#endif","#if defined( USE_COLOR_ALPHA )","	attribute vec4 color;","#elif defined( USE_COLOR )","	attribute vec3 color;","#endif","#if ( defined( USE_MORPHTARGETS ) && ! defined( MORPHTARGETS_TEXTURE ) )","	attribute vec3 morphTarget0;","	attribute vec3 morphTarget1;","	attribute vec3 morphTarget2;","	attribute vec3 morphTarget3;","	#ifdef USE_MORPHNORMALS","		attribute vec3 morphNormal0;","		attribute vec3 morphNormal1;","		attribute vec3 morphNormal2;","		attribute vec3 morphNormal3;","	#else","		attribute vec3 morphTarget4;","		attribute vec3 morphTarget5;","		attribute vec3 morphTarget6;","		attribute vec3 morphTarget7;","	#endif","#endif","#ifdef USE_SKINNING","	attribute vec4 skinIndex;","	attribute vec4 skinWeight;","#endif",`
`].filter(Cs).join(`
`),d=[p,Ml(t),"#define SHADER_NAME "+t.shaderName,g,t.useFog&&t.fog?"#define USE_FOG":"",t.useFog&&t.fogExp2?"#define FOG_EXP2":"",t.map?"#define USE_MAP":"",t.matcap?"#define USE_MATCAP":"",t.envMap?"#define USE_ENVMAP":"",t.envMap?"#define "+c:"",t.envMap?"#define "+f:"",t.envMap?"#define "+h:"",u?"#define CUBEUV_TEXEL_WIDTH "+u.texelWidth:"",u?"#define CUBEUV_TEXEL_HEIGHT "+u.texelHeight:"",u?"#define CUBEUV_MAX_MIP "+u.maxMip+".0":"",t.lightMap?"#define USE_LIGHTMAP":"",t.aoMap?"#define USE_AOMAP":"",t.bumpMap?"#define USE_BUMPMAP":"",t.normalMap?"#define USE_NORMALMAP":"",t.normalMapObjectSpace?"#define USE_NORMALMAP_OBJECTSPACE":"",t.normalMapTangentSpace?"#define USE_NORMALMAP_TANGENTSPACE":"",t.emissiveMap?"#define USE_EMISSIVEMAP":"",t.clearcoat?"#define USE_CLEARCOAT":"",t.clearcoatMap?"#define USE_CLEARCOATMAP":"",t.clearcoatRoughnessMap?"#define USE_CLEARCOAT_ROUGHNESSMAP":"",t.clearcoatNormalMap?"#define USE_CLEARCOAT_NORMALMAP":"",t.iridescence?"#define USE_IRIDESCENCE":"",t.iridescenceMap?"#define USE_IRIDESCENCEMAP":"",t.iridescenceThicknessMap?"#define USE_IRIDESCENCE_THICKNESSMAP":"",t.specularMap?"#define USE_SPECULARMAP":"",t.specularColorMap?"#define USE_SPECULAR_COLORMAP":"",t.specularIntensityMap?"#define USE_SPECULAR_INTENSITYMAP":"",t.roughnessMap?"#define USE_ROUGHNESSMAP":"",t.metalnessMap?"#define USE_METALNESSMAP":"",t.alphaMap?"#define USE_ALPHAMAP":"",t.alphaTest?"#define USE_ALPHATEST":"",t.sheen?"#define USE_SHEEN":"",t.sheenColorMap?"#define USE_SHEEN_COLORMAP":"",t.sheenRoughnessMap?"#define USE_SHEEN_ROUGHNESSMAP":"",t.transmission?"#define USE_TRANSMISSION":"",t.transmissionMap?"#define USE_TRANSMISSIONMAP":"",t.thicknessMap?"#define USE_THICKNESSMAP":"",t.decodeVideoTexture?"#define DECODE_VIDEO_TEXTURE":"",t.vertexTangents?"#define USE_TANGENT":"",t.vertexColors||t.instancingColor?"#define USE_COLOR":"",t.vertexAlphas?"#define USE_COLOR_ALPHA":"",t.vertexUvs2?"#define USE_UV2":"",t.pointsUvs?"#define USE_POINTS_UV":"",t.gradientMap?"#define USE_GRADIENTMAP":"",t.flatShading?"#define FLAT_SHADED":"",t.doubleSided?"#define DOUBLE_SIDED":"",t.flipSided?"#define FLIP_SIDED":"",t.shadowMapEnabled?"#define USE_SHADOWMAP":"",t.shadowMapEnabled?"#define "+l:"",t.premultipliedAlpha?"#define PREMULTIPLIED_ALPHA":"",t.useLegacyLights?"#define LEGACY_LIGHTS":"",t.logarithmicDepthBuffer?"#define USE_LOGDEPTHBUF":"",t.logarithmicDepthBuffer&&t.rendererExtensionFragDepth?"#define USE_LOGDEPTHBUF_EXT":"","uniform mat4 viewMatrix;","uniform vec3 cameraPosition;","uniform bool isOrthographic;",t.toneMapping!==Nn?"#define TONE_MAPPING":"",t.toneMapping!==Nn?Qe.tonemapping_pars_fragment:"",t.toneMapping!==Nn?jg("toneMapping",t.toneMapping):"",t.dithering?"#define DITHERING":"",t.opaque?"#define OPAQUE":"",Qe.encodings_pars_fragment,Wg("linearToOutputTexel",t.outputEncoding),t.useDepthPacking?"#define DEPTH_PACKING "+t.depthPacking:"",`
`].filter(Cs).join(`
`)),o=No(o),o=_l(o,t),o=vl(o,t),a=No(a),a=_l(a,t),a=vl(a,t),o=bl(o),a=bl(a),t.isWebGL2&&t.isRawShaderMaterial!==!0&&(M=`#version 300 es
`,m=["precision mediump sampler2DArray;","#define attribute in","#define varying out","#define texture2D texture"].join(`
`)+`
`+m,d=["#define varying in",t.glslVersion===Ba?"":"layout(location = 0) out highp vec4 pc_fragColor;",t.glslVersion===Ba?"":"#define gl_FragColor pc_fragColor","#define gl_FragDepthEXT gl_FragDepth","#define texture2D texture","#define textureCube texture","#define texture2DProj textureProj","#define texture2DLodEXT textureLod","#define texture2DProjLodEXT textureProjLod","#define textureCubeLodEXT textureLod","#define texture2DGradEXT textureGrad","#define texture2DProjGradEXT textureProjGrad","#define textureCubeGradEXT textureGrad"].join(`
`)+`
`+d);const b=M+m+o,x=M+d+a,y=ml(s,35633,b),T=ml(s,35632,x);if(s.attachShader(v,y),s.attachShader(v,T),t.index0AttributeName!==void 0?s.bindAttribLocation(v,0,t.index0AttributeName):t.morphTargets===!0&&s.bindAttribLocation(v,0,"position"),s.linkProgram(v),i.debug.checkShaderErrors){const _=s.getProgramInfoLog(v).trim(),S=s.getShaderInfoLog(y).trim(),B=s.getShaderInfoLog(T).trim();let k=!0,C=!0;if(s.getProgramParameter(v,35714)===!1)if(k=!1,typeof i.debug.onShaderError=="function")i.debug.onShaderError(s,v,y,T);else{const U=gl(s,y,"vertex"),N=gl(s,T,"fragment");console.error("THREE.WebGLProgram: Shader Error "+s.getError()+" - VALIDATE_STATUS "+s.getProgramParameter(v,35715)+`

Program Info Log: `+_+`
`+U+`
`+N)}else _!==""?console.warn("THREE.WebGLProgram: Program Info Log:",_):(S===""||B==="")&&(C=!1);C&&(this.diagnostics={runnable:k,programLog:_,vertexShader:{log:S,prefix:m},fragmentShader:{log:B,prefix:d}})}s.deleteShader(y),s.deleteShader(T);let L;this.getUniforms=function(){return L===void 0&&(L=new Mr(s,v)),L};let w;return this.getAttributes=function(){return w===void 0&&(w=Yg(s,v)),w},this.destroy=function(){n.releaseStatesOfProgram(this),s.deleteProgram(v),this.program=void 0},this.name=t.shaderName,this.id=Gg++,this.cacheKey=e,this.usedTimes=1,this.program=v,this.vertexShader=y,this.fragmentShader=T,this}let r_=0;class o_{constructor(){this.shaderCache=new Map,this.materialCache=new Map}update(e){const t=e.vertexShader,n=e.fragmentShader,s=this._getShaderStage(t),r=this._getShaderStage(n),o=this._getShaderCacheForMaterial(e);return o.has(s)===!1&&(o.add(s),s.usedTimes++),o.has(r)===!1&&(o.add(r),r.usedTimes++),this}remove(e){const t=this.materialCache.get(e);for(const n of t)n.usedTimes--,n.usedTimes===0&&this.shaderCache.delete(n.code);return this.materialCache.delete(e),this}getVertexShaderID(e){return this._getShaderStage(e.vertexShader).id}getFragmentShaderID(e){return this._getShaderStage(e.fragmentShader).id}dispose(){this.shaderCache.clear(),this.materialCache.clear()}_getShaderCacheForMaterial(e){const t=this.materialCache;let n=t.get(e);return n===void 0&&(n=new Set,t.set(e,n)),n}_getShaderStage(e){const t=this.shaderCache;let n=t.get(e);return n===void 0&&(n=new a_(e),t.set(e,n)),n}}class a_{constructor(e){this.id=r_++,this.code=e,this.usedTimes=0}}function l_(i,e,t,n,s,r,o){const a=new qo,l=new o_,c=[],f=s.isWebGL2,h=s.logarithmicDepthBuffer,u=s.vertexTextures;let p=s.precision;const g={MeshDepthMaterial:"depth",MeshDistanceMaterial:"distanceRGBA",MeshNormalMaterial:"normal",MeshBasicMaterial:"basic",MeshLambertMaterial:"lambert",MeshPhongMaterial:"phong",MeshToonMaterial:"toon",MeshStandardMaterial:"physical",MeshPhysicalMaterial:"physical",MeshMatcapMaterial:"matcap",LineBasicMaterial:"basic",LineDashedMaterial:"dashed",PointsMaterial:"points",ShadowMaterial:"shadow",SpriteMaterial:"sprite"};function v(_){return _===1?"uv2":"uv"}function m(_,S,B,k,C){const U=k.fog,N=C.geometry,j=_.isMeshStandardMaterial?k.environment:null,D=(_.isMeshStandardMaterial?t:e).get(_.envMap||j),V=!!D&&D.mapping===Rr?D.image.height:null,W=g[_.type];_.precision!==null&&(p=s.getMaxPrecision(_.precision),p!==_.precision&&console.warn("THREE.WebGLProgram.getParameters:",_.precision,"not supported, using",p,"instead."));const Q=N.morphAttributes.position||N.morphAttributes.normal||N.morphAttributes.color,oe=Q!==void 0?Q.length:0;let ee=0;N.morphAttributes.position!==void 0&&(ee=1),N.morphAttributes.normal!==void 0&&(ee=2),N.morphAttributes.color!==void 0&&(ee=3);let z,K,pe,ae;if(W){const ye=Un[W];z=ye.vertexShader,K=ye.fragmentShader}else z=_.vertexShader,K=_.fragmentShader,l.update(_),pe=l.getVertexShaderID(_),ae=l.getFragmentShaderID(_);const H=i.getRenderTarget(),Se=C.isInstancedMesh===!0,ve=!!_.map,se=!!_.matcap,me=!!D,Ie=!!_.aoMap,ce=!!_.lightMap,xe=!!_.bumpMap,Xe=!!_.normalMap,Mt=!!_.displacementMap,nt=!!_.emissiveMap,Le=!!_.metalnessMap,Ye=!!_.roughnessMap,ht=_.clearcoat>0,dt=_.iridescence>0,R=_.sheen>0,A=_.transmission>0,$=ht&&!!_.clearcoatMap,fe=ht&&!!_.clearcoatNormalMap,de=ht&&!!_.clearcoatRoughnessMap,ge=dt&&!!_.iridescenceMap,ze=dt&&!!_.iridescenceThicknessMap,Te=R&&!!_.sheenColorMap,te=R&&!!_.sheenRoughnessMap,Ce=!!_.specularMap,Ue=!!_.specularColorMap,Pe=!!_.specularIntensityMap,we=A&&!!_.transmissionMap,Re=A&&!!_.thicknessMap,He=!!_.gradientMap,tt=!!_.alphaMap,gt=_.alphaTest>0,O=!!_.extensions,q=!!N.attributes.uv2;return{isWebGL2:f,shaderID:W,shaderName:_.type,vertexShader:z,fragmentShader:K,defines:_.defines,customVertexShaderID:pe,customFragmentShaderID:ae,isRawShaderMaterial:_.isRawShaderMaterial===!0,glslVersion:_.glslVersion,precision:p,instancing:Se,instancingColor:Se&&C.instanceColor!==null,supportsVertexTextures:u,outputEncoding:H===null?i.outputEncoding:H.isXRRenderTarget===!0?H.texture.encoding:ui,map:ve,matcap:se,envMap:me,envMapMode:me&&D.mapping,envMapCubeUVHeight:V,aoMap:Ie,lightMap:ce,bumpMap:xe,normalMap:Xe,displacementMap:u&&Mt,emissiveMap:nt,normalMapObjectSpace:Xe&&_.normalMapType===_h,normalMapTangentSpace:Xe&&_.normalMapType===cu,decodeVideoTexture:ve&&_.map.isVideoTexture===!0&&_.map.encoding===vt,metalnessMap:Le,roughnessMap:Ye,clearcoat:ht,clearcoatMap:$,clearcoatNormalMap:fe,clearcoatRoughnessMap:de,iridescence:dt,iridescenceMap:ge,iridescenceThicknessMap:ze,sheen:R,sheenColorMap:Te,sheenRoughnessMap:te,specularMap:Ce,specularColorMap:Ue,specularIntensityMap:Pe,transmission:A,transmissionMap:we,thicknessMap:Re,gradientMap:He,opaque:_.transparent===!1&&_.blending===is,alphaMap:tt,alphaTest:gt,combine:_.combine,mapUv:ve&&v(_.map.channel),aoMapUv:Ie&&v(_.aoMap.channel),lightMapUv:ce&&v(_.lightMap.channel),bumpMapUv:xe&&v(_.bumpMap.channel),normalMapUv:Xe&&v(_.normalMap.channel),displacementMapUv:Mt&&v(_.displacementMap.channel),emissiveMapUv:nt&&v(_.emissiveMap.channel),metalnessMapUv:Le&&v(_.metalnessMap.channel),roughnessMapUv:Ye&&v(_.roughnessMap.channel),clearcoatMapUv:$&&v(_.clearcoatMap.channel),clearcoatNormalMapUv:fe&&v(_.clearcoatNormalMap.channel),clearcoatRoughnessMapUv:de&&v(_.clearcoatRoughnessMap.channel),iridescenceMapUv:ge&&v(_.iridescenceMap.channel),iridescenceThicknessMapUv:ze&&v(_.iridescenceThicknessMap.channel),sheenColorMapUv:Te&&v(_.sheenColorMap.channel),sheenRoughnessMapUv:te&&v(_.sheenRoughnessMap.channel),specularMapUv:Ce&&v(_.specularMap.channel),specularColorMapUv:Ue&&v(_.specularColorMap.channel),specularIntensityMapUv:Pe&&v(_.specularIntensityMap.channel),transmissionMapUv:we&&v(_.transmissionMap.channel),thicknessMapUv:Re&&v(_.thicknessMap.channel),alphaMapUv:tt&&v(_.alphaMap.channel),vertexTangents:Xe&&!!N.attributes.tangent,vertexColors:_.vertexColors,vertexAlphas:_.vertexColors===!0&&!!N.attributes.color&&N.attributes.color.itemSize===4,vertexUvs2:q,pointsUvs:C.isPoints===!0&&!!N.attributes.uv&&(ve||tt),fog:!!U,useFog:_.fog===!0,fogExp2:U&&U.isFogExp2,flatShading:_.flatShading===!0,sizeAttenuation:_.sizeAttenuation===!0,logarithmicDepthBuffer:h,skinning:C.isSkinnedMesh===!0,morphTargets:N.morphAttributes.position!==void 0,morphNormals:N.morphAttributes.normal!==void 0,morphColors:N.morphAttributes.color!==void 0,morphTargetsCount:oe,morphTextureStride:ee,numDirLights:S.directional.length,numPointLights:S.point.length,numSpotLights:S.spot.length,numSpotLightMaps:S.spotLightMap.length,numRectAreaLights:S.rectArea.length,numHemiLights:S.hemi.length,numDirLightShadows:S.directionalShadowMap.length,numPointLightShadows:S.pointShadowMap.length,numSpotLightShadows:S.spotShadowMap.length,numSpotLightShadowsWithMaps:S.numSpotLightShadowsWithMaps,numClippingPlanes:o.numPlanes,numClipIntersection:o.numIntersection,dithering:_.dithering,shadowMapEnabled:i.shadowMap.enabled&&B.length>0,shadowMapType:i.shadowMap.type,toneMapping:_.toneMapped?i.toneMapping:Nn,useLegacyLights:i.useLegacyLights,premultipliedAlpha:_.premultipliedAlpha,doubleSided:_.side===zn,flipSided:_.side===un,useDepthPacking:_.depthPacking>=0,depthPacking:_.depthPacking||0,index0AttributeName:_.index0AttributeName,extensionDerivatives:O&&_.extensions.derivatives===!0,extensionFragDepth:O&&_.extensions.fragDepth===!0,extensionDrawBuffers:O&&_.extensions.drawBuffers===!0,extensionShaderTextureLOD:O&&_.extensions.shaderTextureLOD===!0,rendererExtensionFragDepth:f||n.has("EXT_frag_depth"),rendererExtensionDrawBuffers:f||n.has("WEBGL_draw_buffers"),rendererExtensionShaderTextureLod:f||n.has("EXT_shader_texture_lod"),customProgramCacheKey:_.customProgramCacheKey()}}function d(_){const S=[];if(_.shaderID?S.push(_.shaderID):(S.push(_.customVertexShaderID),S.push(_.customFragmentShaderID)),_.defines!==void 0)for(const B in _.defines)S.push(B),S.push(_.defines[B]);return _.isRawShaderMaterial===!1&&(M(S,_),b(S,_),S.push(i.outputEncoding)),S.push(_.customProgramCacheKey),S.join()}function M(_,S){_.push(S.precision),_.push(S.outputEncoding),_.push(S.envMapMode),_.push(S.envMapCubeUVHeight),_.push(S.mapUv),_.push(S.alphaMapUv),_.push(S.lightMapUv),_.push(S.aoMapUv),_.push(S.bumpMapUv),_.push(S.normalMapUv),_.push(S.displacementMapUv),_.push(S.emissiveMapUv),_.push(S.metalnessMapUv),_.push(S.roughnessMapUv),_.push(S.clearcoatMapUv),_.push(S.clearcoatNormalMapUv),_.push(S.clearcoatRoughnessMapUv),_.push(S.iridescenceMapUv),_.push(S.iridescenceThicknessMapUv),_.push(S.sheenColorMapUv),_.push(S.sheenRoughnessMapUv),_.push(S.specularMapUv),_.push(S.specularColorMapUv),_.push(S.specularIntensityMapUv),_.push(S.transmissionMapUv),_.push(S.thicknessMapUv),_.push(S.combine),_.push(S.fogExp2),_.push(S.sizeAttenuation),_.push(S.morphTargetsCount),_.push(S.morphAttributeCount),_.push(S.numDirLights),_.push(S.numPointLights),_.push(S.numSpotLights),_.push(S.numSpotLightMaps),_.push(S.numHemiLights),_.push(S.numRectAreaLights),_.push(S.numDirLightShadows),_.push(S.numPointLightShadows),_.push(S.numSpotLightShadows),_.push(S.numSpotLightShadowsWithMaps),_.push(S.shadowMapType),_.push(S.toneMapping),_.push(S.numClippingPlanes),_.push(S.numClipIntersection),_.push(S.depthPacking)}function b(_,S){a.disableAll(),S.isWebGL2&&a.enable(0),S.supportsVertexTextures&&a.enable(1),S.instancing&&a.enable(2),S.instancingColor&&a.enable(3),S.matcap&&a.enable(4),S.envMap&&a.enable(5),S.normalMapObjectSpace&&a.enable(6),S.normalMapTangentSpace&&a.enable(7),S.clearcoat&&a.enable(8),S.iridescence&&a.enable(9),S.alphaTest&&a.enable(10),S.vertexColors&&a.enable(11),S.vertexAlphas&&a.enable(12),S.vertexUvs2&&a.enable(13),S.vertexTangents&&a.enable(14),_.push(a.mask),a.disableAll(),S.fog&&a.enable(0),S.useFog&&a.enable(1),S.flatShading&&a.enable(2),S.logarithmicDepthBuffer&&a.enable(3),S.skinning&&a.enable(4),S.morphTargets&&a.enable(5),S.morphNormals&&a.enable(6),S.morphColors&&a.enable(7),S.premultipliedAlpha&&a.enable(8),S.shadowMapEnabled&&a.enable(9),S.useLegacyLights&&a.enable(10),S.doubleSided&&a.enable(11),S.flipSided&&a.enable(12),S.useDepthPacking&&a.enable(13),S.dithering&&a.enable(14),S.transmission&&a.enable(15),S.sheen&&a.enable(16),S.decodeVideoTexture&&a.enable(17),S.opaque&&a.enable(18),S.pointsUvs&&a.enable(19),_.push(a.mask)}function x(_){const S=g[_.type];let B;if(S){const k=Un[S];B=Mu.clone(k.uniforms)}else B=_.uniforms;return B}function y(_,S){let B;for(let k=0,C=c.length;k<C;k++){const U=c[k];if(U.cacheKey===S){B=U,++B.usedTimes;break}}return B===void 0&&(B=new s_(i,S,_,r),c.push(B)),B}function T(_){if(--_.usedTimes===0){const S=c.indexOf(_);c[S]=c[c.length-1],c.pop(),_.destroy()}}function L(_){l.remove(_)}function w(){l.dispose()}return{getParameters:m,getProgramCacheKey:d,getUniforms:x,acquireProgram:y,releaseProgram:T,releaseShaderCache:L,programs:c,dispose:w}}function c_(){let i=new WeakMap;function e(r){let o=i.get(r);return o===void 0&&(o={},i.set(r,o)),o}function t(r){i.delete(r)}function n(r,o,a){i.get(r)[o]=a}function s(){i=new WeakMap}return{get:e,remove:t,update:n,dispose:s}}function u_(i,e){return i.groupOrder!==e.groupOrder?i.groupOrder-e.groupOrder:i.renderOrder!==e.renderOrder?i.renderOrder-e.renderOrder:i.material.id!==e.material.id?i.material.id-e.material.id:i.z!==e.z?i.z-e.z:i.id-e.id}function xl(i,e){return i.groupOrder!==e.groupOrder?i.groupOrder-e.groupOrder:i.renderOrder!==e.renderOrder?i.renderOrder-e.renderOrder:i.z!==e.z?e.z-i.z:i.id-e.id}function Sl(){const i=[];let e=0;const t=[],n=[],s=[];function r(){e=0,t.length=0,n.length=0,s.length=0}function o(h,u,p,g,v,m){let d=i[e];return d===void 0?(d={id:h.id,object:h,geometry:u,material:p,groupOrder:g,renderOrder:h.renderOrder,z:v,group:m},i[e]=d):(d.id=h.id,d.object=h,d.geometry=u,d.material=p,d.groupOrder=g,d.renderOrder=h.renderOrder,d.z=v,d.group=m),e++,d}function a(h,u,p,g,v,m){const d=o(h,u,p,g,v,m);p.transmission>0?n.push(d):p.transparent===!0?s.push(d):t.push(d)}function l(h,u,p,g,v,m){const d=o(h,u,p,g,v,m);p.transmission>0?n.unshift(d):p.transparent===!0?s.unshift(d):t.unshift(d)}function c(h,u){t.length>1&&t.sort(h||u_),n.length>1&&n.sort(u||xl),s.length>1&&s.sort(u||xl)}function f(){for(let h=e,u=i.length;h<u;h++){const p=i[h];if(p.id===null)break;p.id=null,p.object=null,p.geometry=null,p.material=null,p.group=null}}return{opaque:t,transmissive:n,transparent:s,init:r,push:a,unshift:l,finish:f,sort:c}}function f_(){let i=new WeakMap;function e(n,s){const r=i.get(n);let o;return r===void 0?(o=new Sl,i.set(n,[o])):s>=r.length?(o=new Sl,r.push(o)):o=r[s],o}function t(){i=new WeakMap}return{get:e,dispose:t}}function h_(){const i={};return{get:function(e){if(i[e.id]!==void 0)return i[e.id];let t;switch(e.type){case"DirectionalLight":t={direction:new G,color:new ut};break;case"SpotLight":t={position:new G,direction:new G,color:new ut,distance:0,coneCos:0,penumbraCos:0,decay:0};break;case"PointLight":t={position:new G,color:new ut,distance:0,decay:0};break;case"HemisphereLight":t={direction:new G,skyColor:new ut,groundColor:new ut};break;case"RectAreaLight":t={color:new ut,position:new G,halfWidth:new G,halfHeight:new G};break}return i[e.id]=t,t}}}function d_(){const i={};return{get:function(e){if(i[e.id]!==void 0)return i[e.id];let t;switch(e.type){case"DirectionalLight":t={shadowBias:0,shadowNormalBias:0,shadowRadius:1,shadowMapSize:new st};break;case"SpotLight":t={shadowBias:0,shadowNormalBias:0,shadowRadius:1,shadowMapSize:new st};break;case"PointLight":t={shadowBias:0,shadowNormalBias:0,shadowRadius:1,shadowMapSize:new st,shadowCameraNear:1,shadowCameraFar:1e3};break}return i[e.id]=t,t}}}let p_=0;function m_(i,e){return(e.castShadow?2:0)-(i.castShadow?2:0)+(e.map?1:0)-(i.map?1:0)}function g_(i,e){const t=new h_,n=d_(),s={version:0,hash:{directionalLength:-1,pointLength:-1,spotLength:-1,rectAreaLength:-1,hemiLength:-1,numDirectionalShadows:-1,numPointShadows:-1,numSpotShadows:-1,numSpotMaps:-1},ambient:[0,0,0],probe:[],directional:[],directionalShadow:[],directionalShadowMap:[],directionalShadowMatrix:[],spot:[],spotLightMap:[],spotShadow:[],spotShadowMap:[],spotLightMatrix:[],rectArea:[],rectAreaLTC1:null,rectAreaLTC2:null,point:[],pointShadow:[],pointShadowMap:[],pointShadowMatrix:[],hemi:[],numSpotLightShadowsWithMaps:0};for(let f=0;f<9;f++)s.probe.push(new G);const r=new G,o=new Ct,a=new Ct;function l(f,h){let u=0,p=0,g=0;for(let B=0;B<9;B++)s.probe[B].set(0,0,0);let v=0,m=0,d=0,M=0,b=0,x=0,y=0,T=0,L=0,w=0;f.sort(m_);const _=h===!0?Math.PI:1;for(let B=0,k=f.length;B<k;B++){const C=f[B],U=C.color,N=C.intensity,j=C.distance,D=C.shadow&&C.shadow.map?C.shadow.map.texture:null;if(C.isAmbientLight)u+=U.r*N*_,p+=U.g*N*_,g+=U.b*N*_;else if(C.isLightProbe)for(let V=0;V<9;V++)s.probe[V].addScaledVector(C.sh.coefficients[V],N);else if(C.isDirectionalLight){const V=t.get(C);if(V.color.copy(C.color).multiplyScalar(C.intensity*_),C.castShadow){const W=C.shadow,Q=n.get(C);Q.shadowBias=W.bias,Q.shadowNormalBias=W.normalBias,Q.shadowRadius=W.radius,Q.shadowMapSize=W.mapSize,s.directionalShadow[v]=Q,s.directionalShadowMap[v]=D,s.directionalShadowMatrix[v]=C.shadow.matrix,x++}s.directional[v]=V,v++}else if(C.isSpotLight){const V=t.get(C);V.position.setFromMatrixPosition(C.matrixWorld),V.color.copy(U).multiplyScalar(N*_),V.distance=j,V.coneCos=Math.cos(C.angle),V.penumbraCos=Math.cos(C.angle*(1-C.penumbra)),V.decay=C.decay,s.spot[d]=V;const W=C.shadow;if(C.map&&(s.spotLightMap[L]=C.map,L++,W.updateMatrices(C),C.castShadow&&w++),s.spotLightMatrix[d]=W.matrix,C.castShadow){const Q=n.get(C);Q.shadowBias=W.bias,Q.shadowNormalBias=W.normalBias,Q.shadowRadius=W.radius,Q.shadowMapSize=W.mapSize,s.spotShadow[d]=Q,s.spotShadowMap[d]=D,T++}d++}else if(C.isRectAreaLight){const V=t.get(C);V.color.copy(U).multiplyScalar(N),V.halfWidth.set(C.width*.5,0,0),V.halfHeight.set(0,C.height*.5,0),s.rectArea[M]=V,M++}else if(C.isPointLight){const V=t.get(C);if(V.color.copy(C.color).multiplyScalar(C.intensity*_),V.distance=C.distance,V.decay=C.decay,C.castShadow){const W=C.shadow,Q=n.get(C);Q.shadowBias=W.bias,Q.shadowNormalBias=W.normalBias,Q.shadowRadius=W.radius,Q.shadowMapSize=W.mapSize,Q.shadowCameraNear=W.camera.near,Q.shadowCameraFar=W.camera.far,s.pointShadow[m]=Q,s.pointShadowMap[m]=D,s.pointShadowMatrix[m]=C.shadow.matrix,y++}s.point[m]=V,m++}else if(C.isHemisphereLight){const V=t.get(C);V.skyColor.copy(C.color).multiplyScalar(N*_),V.groundColor.copy(C.groundColor).multiplyScalar(N*_),s.hemi[b]=V,b++}}M>0&&(e.isWebGL2||i.has("OES_texture_float_linear")===!0?(s.rectAreaLTC1=be.LTC_FLOAT_1,s.rectAreaLTC2=be.LTC_FLOAT_2):i.has("OES_texture_half_float_linear")===!0?(s.rectAreaLTC1=be.LTC_HALF_1,s.rectAreaLTC2=be.LTC_HALF_2):console.error("THREE.WebGLRenderer: Unable to use RectAreaLight. Missing WebGL extensions.")),s.ambient[0]=u,s.ambient[1]=p,s.ambient[2]=g;const S=s.hash;(S.directionalLength!==v||S.pointLength!==m||S.spotLength!==d||S.rectAreaLength!==M||S.hemiLength!==b||S.numDirectionalShadows!==x||S.numPointShadows!==y||S.numSpotShadows!==T||S.numSpotMaps!==L)&&(s.directional.length=v,s.spot.length=d,s.rectArea.length=M,s.point.length=m,s.hemi.length=b,s.directionalShadow.length=x,s.directionalShadowMap.length=x,s.pointShadow.length=y,s.pointShadowMap.length=y,s.spotShadow.length=T,s.spotShadowMap.length=T,s.directionalShadowMatrix.length=x,s.pointShadowMatrix.length=y,s.spotLightMatrix.length=T+L-w,s.spotLightMap.length=L,s.numSpotLightShadowsWithMaps=w,S.directionalLength=v,S.pointLength=m,S.spotLength=d,S.rectAreaLength=M,S.hemiLength=b,S.numDirectionalShadows=x,S.numPointShadows=y,S.numSpotShadows=T,S.numSpotMaps=L,s.version=p_++)}function c(f,h){let u=0,p=0,g=0,v=0,m=0;const d=h.matrixWorldInverse;for(let M=0,b=f.length;M<b;M++){const x=f[M];if(x.isDirectionalLight){const y=s.directional[u];y.direction.setFromMatrixPosition(x.matrixWorld),r.setFromMatrixPosition(x.target.matrixWorld),y.direction.sub(r),y.direction.transformDirection(d),u++}else if(x.isSpotLight){const y=s.spot[g];y.position.setFromMatrixPosition(x.matrixWorld),y.position.applyMatrix4(d),y.direction.setFromMatrixPosition(x.matrixWorld),r.setFromMatrixPosition(x.target.matrixWorld),y.direction.sub(r),y.direction.transformDirection(d),g++}else if(x.isRectAreaLight){const y=s.rectArea[v];y.position.setFromMatrixPosition(x.matrixWorld),y.position.applyMatrix4(d),a.identity(),o.copy(x.matrixWorld),o.premultiply(d),a.extractRotation(o),y.halfWidth.set(x.width*.5,0,0),y.halfHeight.set(0,x.height*.5,0),y.halfWidth.applyMatrix4(a),y.halfHeight.applyMatrix4(a),v++}else if(x.isPointLight){const y=s.point[p];y.position.setFromMatrixPosition(x.matrixWorld),y.position.applyMatrix4(d),p++}else if(x.isHemisphereLight){const y=s.hemi[m];y.direction.setFromMatrixPosition(x.matrixWorld),y.direction.transformDirection(d),m++}}}return{setup:l,setupView:c,state:s}}function yl(i,e){const t=new g_(i,e),n=[],s=[];function r(){n.length=0,s.length=0}function o(h){n.push(h)}function a(h){s.push(h)}function l(h){t.setup(n,h)}function c(h){t.setupView(n,h)}return{init:r,state:{lightsArray:n,shadowsArray:s,lights:t},setupLights:l,setupLightsView:c,pushLight:o,pushShadow:a}}function __(i,e){let t=new WeakMap;function n(r,o=0){const a=t.get(r);let l;return a===void 0?(l=new yl(i,e),t.set(r,[l])):o>=a.length?(l=new yl(i,e),a.push(l)):l=a[o],l}function s(){t=new WeakMap}return{get:n,dispose:s}}class v_ extends ms{constructor(e){super(),this.isMeshDepthMaterial=!0,this.type="MeshDepthMaterial",this.depthPacking=mh,this.map=null,this.alphaMap=null,this.displacementMap=null,this.displacementScale=1,this.displacementBias=0,this.wireframe=!1,this.wireframeLinewidth=1,this.setValues(e)}copy(e){return super.copy(e),this.depthPacking=e.depthPacking,this.map=e.map,this.alphaMap=e.alphaMap,this.displacementMap=e.displacementMap,this.displacementScale=e.displacementScale,this.displacementBias=e.displacementBias,this.wireframe=e.wireframe,this.wireframeLinewidth=e.wireframeLinewidth,this}}class b_ extends ms{constructor(e){super(),this.isMeshDistanceMaterial=!0,this.type="MeshDistanceMaterial",this.map=null,this.alphaMap=null,this.displacementMap=null,this.displacementScale=1,this.displacementBias=0,this.setValues(e)}copy(e){return super.copy(e),this.map=e.map,this.alphaMap=e.alphaMap,this.displacementMap=e.displacementMap,this.displacementScale=e.displacementScale,this.displacementBias=e.displacementBias,this}}const M_=`void main() {
	gl_Position = vec4( position, 1.0 );
}`,x_=`uniform sampler2D shadow_pass;
uniform vec2 resolution;
uniform float radius;
#include <packing>
void main() {
	const float samples = float( VSM_SAMPLES );
	float mean = 0.0;
	float squared_mean = 0.0;
	float uvStride = samples <= 1.0 ? 0.0 : 2.0 / ( samples - 1.0 );
	float uvStart = samples <= 1.0 ? 0.0 : - 1.0;
	for ( float i = 0.0; i < samples; i ++ ) {
		float uvOffset = uvStart + i * uvStride;
		#ifdef HORIZONTAL_PASS
			vec2 distribution = unpackRGBATo2Half( texture2D( shadow_pass, ( gl_FragCoord.xy + vec2( uvOffset, 0.0 ) * radius ) / resolution ) );
			mean += distribution.x;
			squared_mean += distribution.y * distribution.y + distribution.x * distribution.x;
		#else
			float depth = unpackRGBAToDepth( texture2D( shadow_pass, ( gl_FragCoord.xy + vec2( 0.0, uvOffset ) * radius ) / resolution ) );
			mean += depth;
			squared_mean += depth * depth;
		#endif
	}
	mean = mean / samples;
	squared_mean = squared_mean / samples;
	float std_dev = sqrt( squared_mean - mean * mean );
	gl_FragColor = pack2HalfToRGBA( vec2( mean, std_dev ) );
}`;function S_(i,e,t){let n=new Yo;const s=new st,r=new st,o=new Xt,a=new v_({depthPacking:gh}),l=new b_,c={},f=t.maxTextureSize,h={[ci]:un,[un]:ci,[zn]:zn},u=new $n({defines:{VSM_SAMPLES:8},uniforms:{shadow_pass:{value:null},resolution:{value:new st},radius:{value:4}},vertexShader:M_,fragmentShader:x_}),p=u.clone();p.defines.HORIZONTAL_PASS=1;const g=new sn;g.setAttribute("position",new On(new Float32Array([-1,-1,.5,3,-1,.5,-1,3,.5]),3));const v=new Ee(g,u),m=this;this.enabled=!1,this.autoUpdate=!0,this.needsUpdate=!1,this.type=tu,this.render=function(x,y,T){if(m.enabled===!1||m.autoUpdate===!1&&m.needsUpdate===!1||x.length===0)return;const L=i.getRenderTarget(),w=i.getActiveCubeFace(),_=i.getActiveMipmapLevel(),S=i.state;S.setBlending(li),S.buffers.color.setClear(1,1,1,1),S.buffers.depth.setTest(!0),S.setScissorTest(!1);for(let B=0,k=x.length;B<k;B++){const C=x[B],U=C.shadow;if(U===void 0){console.warn("THREE.WebGLShadowMap:",C,"has no shadow.");continue}if(U.autoUpdate===!1&&U.needsUpdate===!1)continue;s.copy(U.mapSize);const N=U.getFrameExtents();if(s.multiply(N),r.copy(U.mapSize),(s.x>f||s.y>f)&&(s.x>f&&(r.x=Math.floor(f/N.x),s.x=r.x*N.x,U.mapSize.x=r.x),s.y>f&&(r.y=Math.floor(f/N.y),s.y=r.y*N.y,U.mapSize.y=r.y)),U.map===null){const D=this.type!==Ts?{minFilter:$t,magFilter:$t}:{};U.map=new fi(s.x,s.y,D),U.map.texture.name=C.name+".shadowMap",U.camera.updateProjectionMatrix()}i.setRenderTarget(U.map),i.clear();const j=U.getViewportCount();for(let D=0;D<j;D++){const V=U.getViewport(D);o.set(r.x*V.x,r.y*V.y,r.x*V.z,r.y*V.w),S.viewport(o),U.updateMatrices(C,D),n=U.getFrustum(),b(y,T,U.camera,C,this.type)}U.isPointLightShadow!==!0&&this.type===Ts&&d(U,T),U.needsUpdate=!1}m.needsUpdate=!1,i.setRenderTarget(L,w,_)};function d(x,y){const T=e.update(v);u.defines.VSM_SAMPLES!==x.blurSamples&&(u.defines.VSM_SAMPLES=x.blurSamples,p.defines.VSM_SAMPLES=x.blurSamples,u.needsUpdate=!0,p.needsUpdate=!0),x.mapPass===null&&(x.mapPass=new fi(s.x,s.y)),u.uniforms.shadow_pass.value=x.map.texture,u.uniforms.resolution.value=x.mapSize,u.uniforms.radius.value=x.radius,i.setRenderTarget(x.mapPass),i.clear(),i.renderBufferDirect(y,null,T,u,v,null),p.uniforms.shadow_pass.value=x.mapPass.texture,p.uniforms.resolution.value=x.mapSize,p.uniforms.radius.value=x.radius,i.setRenderTarget(x.map),i.clear(),i.renderBufferDirect(y,null,T,p,v,null)}function M(x,y,T,L){let w=null;const _=T.isPointLight===!0?x.customDistanceMaterial:x.customDepthMaterial;if(_!==void 0)w=_;else if(w=T.isPointLight===!0?l:a,i.localClippingEnabled&&y.clipShadows===!0&&Array.isArray(y.clippingPlanes)&&y.clippingPlanes.length!==0||y.displacementMap&&y.displacementScale!==0||y.alphaMap&&y.alphaTest>0||y.map&&y.alphaTest>0){const S=w.uuid,B=y.uuid;let k=c[S];k===void 0&&(k={},c[S]=k);let C=k[B];C===void 0&&(C=w.clone(),k[B]=C),w=C}if(w.visible=y.visible,w.wireframe=y.wireframe,L===Ts?w.side=y.shadowSide!==null?y.shadowSide:y.side:w.side=y.shadowSide!==null?y.shadowSide:h[y.side],w.alphaMap=y.alphaMap,w.alphaTest=y.alphaTest,w.map=y.map,w.clipShadows=y.clipShadows,w.clippingPlanes=y.clippingPlanes,w.clipIntersection=y.clipIntersection,w.displacementMap=y.displacementMap,w.displacementScale=y.displacementScale,w.displacementBias=y.displacementBias,w.wireframeLinewidth=y.wireframeLinewidth,w.linewidth=y.linewidth,T.isPointLight===!0&&w.isMeshDistanceMaterial===!0){const S=i.properties.get(w);S.light=T}return w}function b(x,y,T,L,w){if(x.visible===!1)return;if(x.layers.test(y.layers)&&(x.isMesh||x.isLine||x.isPoints)&&(x.castShadow||x.receiveShadow&&w===Ts)&&(!x.frustumCulled||n.intersectsObject(x))){x.modelViewMatrix.multiplyMatrices(T.matrixWorldInverse,x.matrixWorld);const B=e.update(x),k=x.material;if(Array.isArray(k)){const C=B.groups;for(let U=0,N=C.length;U<N;U++){const j=C[U],D=k[j.materialIndex];if(D&&D.visible){const V=M(x,D,L,w);i.renderBufferDirect(T,null,B,V,x,j)}}}else if(k.visible){const C=M(x,k,L,w);i.renderBufferDirect(T,null,B,C,x,null)}}const S=x.children;for(let B=0,k=S.length;B<k;B++)b(S[B],y,T,L,w)}}function y_(i,e,t){const n=t.isWebGL2;function s(){let O=!1;const q=new Xt;let re=null;const ye=new Xt(0,0,0,0);return{setMask:function(De){re!==De&&!O&&(i.colorMask(De,De,De,De),re=De)},setLocked:function(De){O=De},setClear:function(De,lt,ft,Pt,Ln){Ln===!0&&(De*=Pt,lt*=Pt,ft*=Pt),q.set(De,lt,ft,Pt),ye.equals(q)===!1&&(i.clearColor(De,lt,ft,Pt),ye.copy(q))},reset:function(){O=!1,re=null,ye.set(-1,0,0,0)}}}function r(){let O=!1,q=null,re=null,ye=null;return{setTest:function(De){De?H(2929):Se(2929)},setMask:function(De){q!==De&&!O&&(i.depthMask(De),q=De)},setFunc:function(De){if(re!==De){switch(De){case Bf:i.depthFunc(512);break;case Gf:i.depthFunc(519);break;case Hf:i.depthFunc(513);break;case Lo:i.depthFunc(515);break;case Vf:i.depthFunc(514);break;case Wf:i.depthFunc(518);break;case jf:i.depthFunc(516);break;case Xf:i.depthFunc(517);break;default:i.depthFunc(515)}re=De}},setLocked:function(De){O=De},setClear:function(De){ye!==De&&(i.clearDepth(De),ye=De)},reset:function(){O=!1,q=null,re=null,ye=null}}}function o(){let O=!1,q=null,re=null,ye=null,De=null,lt=null,ft=null,Pt=null,Ln=null;return{setTest:function(Tt){O||(Tt?H(2960):Se(2960))},setMask:function(Tt){q!==Tt&&!O&&(i.stencilMask(Tt),q=Tt)},setFunc:function(Tt,rn,vn){(re!==Tt||ye!==rn||De!==vn)&&(i.stencilFunc(Tt,rn,vn),re=Tt,ye=rn,De=vn)},setOp:function(Tt,rn,vn){(lt!==Tt||ft!==rn||Pt!==vn)&&(i.stencilOp(Tt,rn,vn),lt=Tt,ft=rn,Pt=vn)},setLocked:function(Tt){O=Tt},setClear:function(Tt){Ln!==Tt&&(i.clearStencil(Tt),Ln=Tt)},reset:function(){O=!1,q=null,re=null,ye=null,De=null,lt=null,ft=null,Pt=null,Ln=null}}}const a=new s,l=new r,c=new o,f=new WeakMap,h=new WeakMap;let u={},p={},g=new WeakMap,v=[],m=null,d=!1,M=null,b=null,x=null,y=null,T=null,L=null,w=null,_=!1,S=null,B=null,k=null,C=null,U=null;const N=i.getParameter(35661);let j=!1,D=0;const V=i.getParameter(7938);V.indexOf("WebGL")!==-1?(D=parseFloat(/^WebGL (\d)/.exec(V)[1]),j=D>=1):V.indexOf("OpenGL ES")!==-1&&(D=parseFloat(/^OpenGL ES (\d)/.exec(V)[1]),j=D>=2);let W=null,Q={};const oe=i.getParameter(3088),ee=i.getParameter(2978),z=new Xt().fromArray(oe),K=new Xt().fromArray(ee);function pe(O,q,re){const ye=new Uint8Array(4),De=i.createTexture();i.bindTexture(O,De),i.texParameteri(O,10241,9728),i.texParameteri(O,10240,9728);for(let lt=0;lt<re;lt++)i.texImage2D(q+lt,0,6408,1,1,0,6408,5121,ye);return De}const ae={};ae[3553]=pe(3553,3553,1),ae[34067]=pe(34067,34069,6),a.setClear(0,0,0,1),l.setClear(1),c.setClear(0),H(2929),l.setFunc(Lo),Mt(!1),nt(ca),H(2884),xe(li);function H(O){u[O]!==!0&&(i.enable(O),u[O]=!0)}function Se(O){u[O]!==!1&&(i.disable(O),u[O]=!1)}function ve(O,q){return p[O]!==q?(i.bindFramebuffer(O,q),p[O]=q,n&&(O===36009&&(p[36160]=q),O===36160&&(p[36009]=q)),!0):!1}function se(O,q){let re=v,ye=!1;if(O)if(re=g.get(q),re===void 0&&(re=[],g.set(q,re)),O.isWebGLMultipleRenderTargets){const De=O.texture;if(re.length!==De.length||re[0]!==36064){for(let lt=0,ft=De.length;lt<ft;lt++)re[lt]=36064+lt;re.length=De.length,ye=!0}}else re[0]!==36064&&(re[0]=36064,ye=!0);else re[0]!==1029&&(re[0]=1029,ye=!0);ye&&(t.isWebGL2?i.drawBuffers(re):e.get("WEBGL_draw_buffers").drawBuffersWEBGL(re))}function me(O){return m!==O?(i.useProgram(O),m=O,!0):!1}const Ie={[Ji]:32774,[Pf]:32778,[Lf]:32779};if(n)Ie[da]=32775,Ie[pa]=32776;else{const O=e.get("EXT_blend_minmax");O!==null&&(Ie[da]=O.MIN_EXT,Ie[pa]=O.MAX_EXT)}const ce={[Rf]:0,[Df]:1,[If]:768,[iu]:770,[Ff]:776,[Nf]:774,[zf]:772,[Uf]:769,[su]:771,[Of]:775,[kf]:773};function xe(O,q,re,ye,De,lt,ft,Pt){if(O===li){d===!0&&(Se(3042),d=!1);return}if(d===!1&&(H(3042),d=!0),O!==Cf){if(O!==M||Pt!==_){if((b!==Ji||T!==Ji)&&(i.blendEquation(32774),b=Ji,T=Ji),Pt)switch(O){case is:i.blendFuncSeparate(1,771,1,771);break;case ua:i.blendFunc(1,1);break;case fa:i.blendFuncSeparate(0,769,0,1);break;case ha:i.blendFuncSeparate(0,768,0,770);break;default:console.error("THREE.WebGLState: Invalid blending: ",O);break}else switch(O){case is:i.blendFuncSeparate(770,771,1,771);break;case ua:i.blendFunc(770,1);break;case fa:i.blendFuncSeparate(0,769,0,1);break;case ha:i.blendFunc(0,768);break;default:console.error("THREE.WebGLState: Invalid blending: ",O);break}x=null,y=null,L=null,w=null,M=O,_=Pt}return}De=De||q,lt=lt||re,ft=ft||ye,(q!==b||De!==T)&&(i.blendEquationSeparate(Ie[q],Ie[De]),b=q,T=De),(re!==x||ye!==y||lt!==L||ft!==w)&&(i.blendFuncSeparate(ce[re],ce[ye],ce[lt],ce[ft]),x=re,y=ye,L=lt,w=ft),M=O,_=!1}function Xe(O,q){O.side===zn?Se(2884):H(2884);let re=O.side===un;q&&(re=!re),Mt(re),O.blending===is&&O.transparent===!1?xe(li):xe(O.blending,O.blendEquation,O.blendSrc,O.blendDst,O.blendEquationAlpha,O.blendSrcAlpha,O.blendDstAlpha,O.premultipliedAlpha),l.setFunc(O.depthFunc),l.setTest(O.depthTest),l.setMask(O.depthWrite),a.setMask(O.colorWrite);const ye=O.stencilWrite;c.setTest(ye),ye&&(c.setMask(O.stencilWriteMask),c.setFunc(O.stencilFunc,O.stencilRef,O.stencilFuncMask),c.setOp(O.stencilFail,O.stencilZFail,O.stencilZPass)),Ye(O.polygonOffset,O.polygonOffsetFactor,O.polygonOffsetUnits),O.alphaToCoverage===!0?H(32926):Se(32926)}function Mt(O){S!==O&&(O?i.frontFace(2304):i.frontFace(2305),S=O)}function nt(O){O!==Tf?(H(2884),O!==B&&(O===ca?i.cullFace(1029):O===Af?i.cullFace(1028):i.cullFace(1032))):Se(2884),B=O}function Le(O){O!==k&&(j&&i.lineWidth(O),k=O)}function Ye(O,q,re){O?(H(32823),(C!==q||U!==re)&&(i.polygonOffset(q,re),C=q,U=re)):Se(32823)}function ht(O){O?H(3089):Se(3089)}function dt(O){O===void 0&&(O=33984+N-1),W!==O&&(i.activeTexture(O),W=O)}function R(O,q,re){re===void 0&&(W===null?re=33984+N-1:re=W);let ye=Q[re];ye===void 0&&(ye={type:void 0,texture:void 0},Q[re]=ye),(ye.type!==O||ye.texture!==q)&&(W!==re&&(i.activeTexture(re),W=re),i.bindTexture(O,q||ae[O]),ye.type=O,ye.texture=q)}function A(){const O=Q[W];O!==void 0&&O.type!==void 0&&(i.bindTexture(O.type,null),O.type=void 0,O.texture=void 0)}function $(){try{i.compressedTexImage2D.apply(i,arguments)}catch(O){console.error("THREE.WebGLState:",O)}}function fe(){try{i.compressedTexImage3D.apply(i,arguments)}catch(O){console.error("THREE.WebGLState:",O)}}function de(){try{i.texSubImage2D.apply(i,arguments)}catch(O){console.error("THREE.WebGLState:",O)}}function ge(){try{i.texSubImage3D.apply(i,arguments)}catch(O){console.error("THREE.WebGLState:",O)}}function ze(){try{i.compressedTexSubImage2D.apply(i,arguments)}catch(O){console.error("THREE.WebGLState:",O)}}function Te(){try{i.compressedTexSubImage3D.apply(i,arguments)}catch(O){console.error("THREE.WebGLState:",O)}}function te(){try{i.texStorage2D.apply(i,arguments)}catch(O){console.error("THREE.WebGLState:",O)}}function Ce(){try{i.texStorage3D.apply(i,arguments)}catch(O){console.error("THREE.WebGLState:",O)}}function Ue(){try{i.texImage2D.apply(i,arguments)}catch(O){console.error("THREE.WebGLState:",O)}}function Pe(){try{i.texImage3D.apply(i,arguments)}catch(O){console.error("THREE.WebGLState:",O)}}function we(O){z.equals(O)===!1&&(i.scissor(O.x,O.y,O.z,O.w),z.copy(O))}function Re(O){K.equals(O)===!1&&(i.viewport(O.x,O.y,O.z,O.w),K.copy(O))}function He(O,q){let re=h.get(q);re===void 0&&(re=new WeakMap,h.set(q,re));let ye=re.get(O);ye===void 0&&(ye=i.getUniformBlockIndex(q,O.name),re.set(O,ye))}function tt(O,q){const ye=h.get(q).get(O);f.get(q)!==ye&&(i.uniformBlockBinding(q,ye,O.__bindingPointIndex),f.set(q,ye))}function gt(){i.disable(3042),i.disable(2884),i.disable(2929),i.disable(32823),i.disable(3089),i.disable(2960),i.disable(32926),i.blendEquation(32774),i.blendFunc(1,0),i.blendFuncSeparate(1,0,1,0),i.colorMask(!0,!0,!0,!0),i.clearColor(0,0,0,0),i.depthMask(!0),i.depthFunc(513),i.clearDepth(1),i.stencilMask(4294967295),i.stencilFunc(519,0,4294967295),i.stencilOp(7680,7680,7680),i.clearStencil(0),i.cullFace(1029),i.frontFace(2305),i.polygonOffset(0,0),i.activeTexture(33984),i.bindFramebuffer(36160,null),n===!0&&(i.bindFramebuffer(36009,null),i.bindFramebuffer(36008,null)),i.useProgram(null),i.lineWidth(1),i.scissor(0,0,i.canvas.width,i.canvas.height),i.viewport(0,0,i.canvas.width,i.canvas.height),u={},W=null,Q={},p={},g=new WeakMap,v=[],m=null,d=!1,M=null,b=null,x=null,y=null,T=null,L=null,w=null,_=!1,S=null,B=null,k=null,C=null,U=null,z.set(0,0,i.canvas.width,i.canvas.height),K.set(0,0,i.canvas.width,i.canvas.height),a.reset(),l.reset(),c.reset()}return{buffers:{color:a,depth:l,stencil:c},enable:H,disable:Se,bindFramebuffer:ve,drawBuffers:se,useProgram:me,setBlending:xe,setMaterial:Xe,setFlipSided:Mt,setCullFace:nt,setLineWidth:Le,setPolygonOffset:Ye,setScissorTest:ht,activeTexture:dt,bindTexture:R,unbindTexture:A,compressedTexImage2D:$,compressedTexImage3D:fe,texImage2D:Ue,texImage3D:Pe,updateUBOMapping:He,uniformBlockBinding:tt,texStorage2D:te,texStorage3D:Ce,texSubImage2D:de,texSubImage3D:ge,compressedTexSubImage2D:ze,compressedTexSubImage3D:Te,scissor:we,viewport:Re,reset:gt}}function w_(i,e,t,n,s,r,o){const a=s.isWebGL2,l=s.maxTextures,c=s.maxCubemapSize,f=s.maxTextureSize,h=s.maxSamples,u=e.has("WEBGL_multisampled_render_to_texture")?e.get("WEBGL_multisampled_render_to_texture"):null,p=typeof navigator=="undefined"?!1:/OculusBrowser/g.test(navigator.userAgent),g=new WeakMap;let v;const m=new WeakMap;let d=!1;try{d=typeof OffscreenCanvas!="undefined"&&new OffscreenCanvas(1,1).getContext("2d")!==null}catch{}function M(R,A){return d?new OffscreenCanvas(R,A):Bs("canvas")}function b(R,A,$,fe){let de=1;if((R.width>fe||R.height>fe)&&(de=fe/Math.max(R.width,R.height)),de<1||A===!0)if(typeof HTMLImageElement!="undefined"&&R instanceof HTMLImageElement||typeof HTMLCanvasElement!="undefined"&&R instanceof HTMLCanvasElement||typeof ImageBitmap!="undefined"&&R instanceof ImageBitmap){const ge=A?fu:Math.floor,ze=ge(de*R.width),Te=ge(de*R.height);v===void 0&&(v=M(ze,Te));const te=$?M(ze,Te):v;return te.width=ze,te.height=Te,te.getContext("2d").drawImage(R,0,0,ze,Te),console.warn("THREE.WebGLRenderer: Texture has been resized from ("+R.width+"x"+R.height+") to ("+ze+"x"+Te+")."),te}else return"data"in R&&console.warn("THREE.WebGLRenderer: Image in DataTexture is too big ("+R.width+"x"+R.height+")."),R;return R}function x(R){return ko(R.width)&&ko(R.height)}function y(R){return a?!1:R.wrapS!==An||R.wrapT!==An||R.minFilter!==$t&&R.minFilter!==Mn}function T(R,A){return R.generateMipmaps&&A&&R.minFilter!==$t&&R.minFilter!==Mn}function L(R){i.generateMipmap(R)}function w(R,A,$,fe,de=!1){if(a===!1)return A;if(R!==null){if(i[R]!==void 0)return i[R];console.warn("THREE.WebGLRenderer: Attempt to use non-existing WebGL internal format '"+R+"'")}let ge=A;return A===6403&&($===5126&&(ge=33326),$===5131&&(ge=33325),$===5121&&(ge=33321)),A===33319&&($===5126&&(ge=33328),$===5131&&(ge=33327),$===5121&&(ge=33323)),A===6408&&($===5126&&(ge=34836),$===5131&&(ge=34842),$===5121&&(ge=fe===vt&&de===!1?35907:32856),$===32819&&(ge=32854),$===32820&&(ge=32855)),(ge===33325||ge===33326||ge===33327||ge===33328||ge===34842||ge===34836)&&e.get("EXT_color_buffer_float"),ge}function _(R,A,$){return T(R,$)===!0||R.isFramebufferTexture&&R.minFilter!==$t&&R.minFilter!==Mn?Math.log2(Math.max(A.width,A.height))+1:R.mipmaps!==void 0&&R.mipmaps.length>0?R.mipmaps.length:R.isCompressedTexture&&Array.isArray(R.image)?A.mipmaps.length:1}function S(R){return R===$t||R===ma||R===qr?9728:9729}function B(R){const A=R.target;A.removeEventListener("dispose",B),C(A),A.isVideoTexture&&g.delete(A)}function k(R){const A=R.target;A.removeEventListener("dispose",k),N(A)}function C(R){const A=n.get(R);if(A.__webglInit===void 0)return;const $=R.source,fe=m.get($);if(fe){const de=fe[A.__cacheKey];de.usedTimes--,de.usedTimes===0&&U(R),Object.keys(fe).length===0&&m.delete($)}n.remove(R)}function U(R){const A=n.get(R);i.deleteTexture(A.__webglTexture);const $=R.source,fe=m.get($);delete fe[A.__cacheKey],o.memory.textures--}function N(R){const A=R.texture,$=n.get(R),fe=n.get(A);if(fe.__webglTexture!==void 0&&(i.deleteTexture(fe.__webglTexture),o.memory.textures--),R.depthTexture&&R.depthTexture.dispose(),R.isWebGLCubeRenderTarget)for(let de=0;de<6;de++)i.deleteFramebuffer($.__webglFramebuffer[de]),$.__webglDepthbuffer&&i.deleteRenderbuffer($.__webglDepthbuffer[de]);else{if(i.deleteFramebuffer($.__webglFramebuffer),$.__webglDepthbuffer&&i.deleteRenderbuffer($.__webglDepthbuffer),$.__webglMultisampledFramebuffer&&i.deleteFramebuffer($.__webglMultisampledFramebuffer),$.__webglColorRenderbuffer)for(let de=0;de<$.__webglColorRenderbuffer.length;de++)$.__webglColorRenderbuffer[de]&&i.deleteRenderbuffer($.__webglColorRenderbuffer[de]);$.__webglDepthRenderbuffer&&i.deleteRenderbuffer($.__webglDepthRenderbuffer)}if(R.isWebGLMultipleRenderTargets)for(let de=0,ge=A.length;de<ge;de++){const ze=n.get(A[de]);ze.__webglTexture&&(i.deleteTexture(ze.__webglTexture),o.memory.textures--),n.remove(A[de])}n.remove(A),n.remove(R)}let j=0;function D(){j=0}function V(){const R=j;return R>=l&&console.warn("THREE.WebGLTextures: Trying to use "+R+" texture units while this GPU supports only "+l),j+=1,R}function W(R){const A=[];return A.push(R.wrapS),A.push(R.wrapT),A.push(R.wrapR||0),A.push(R.magFilter),A.push(R.minFilter),A.push(R.anisotropy),A.push(R.internalFormat),A.push(R.format),A.push(R.type),A.push(R.generateMipmaps),A.push(R.premultiplyAlpha),A.push(R.flipY),A.push(R.unpackAlignment),A.push(R.encoding),A.join()}function Q(R,A){const $=n.get(R);if(R.isVideoTexture&&ht(R),R.isRenderTargetTexture===!1&&R.version>0&&$.__version!==R.version){const fe=R.image;if(fe===null)console.warn("THREE.WebGLRenderer: Texture marked for update but no image data found.");else if(fe.complete===!1)console.warn("THREE.WebGLRenderer: Texture marked for update but image is incomplete");else{Se($,R,A);return}}t.bindTexture(3553,$.__webglTexture,33984+A)}function oe(R,A){const $=n.get(R);if(R.version>0&&$.__version!==R.version){Se($,R,A);return}t.bindTexture(35866,$.__webglTexture,33984+A)}function ee(R,A){const $=n.get(R);if(R.version>0&&$.__version!==R.version){Se($,R,A);return}t.bindTexture(32879,$.__webglTexture,33984+A)}function z(R,A){const $=n.get(R);if(R.version>0&&$.__version!==R.version){ve($,R,A);return}t.bindTexture(34067,$.__webglTexture,33984+A)}const K={[Io]:10497,[An]:33071,[Uo]:33648},pe={[$t]:9728,[ma]:9984,[qr]:9986,[Mn]:9729,[$f]:9985,[ks]:9987};function ae(R,A,$){if($?(i.texParameteri(R,10242,K[A.wrapS]),i.texParameteri(R,10243,K[A.wrapT]),(R===32879||R===35866)&&i.texParameteri(R,32882,K[A.wrapR]),i.texParameteri(R,10240,pe[A.magFilter]),i.texParameteri(R,10241,pe[A.minFilter])):(i.texParameteri(R,10242,33071),i.texParameteri(R,10243,33071),(R===32879||R===35866)&&i.texParameteri(R,32882,33071),(A.wrapS!==An||A.wrapT!==An)&&console.warn("THREE.WebGLRenderer: Texture is not power of two. Texture.wrapS and Texture.wrapT should be set to THREE.ClampToEdgeWrapping."),i.texParameteri(R,10240,S(A.magFilter)),i.texParameteri(R,10241,S(A.minFilter)),A.minFilter!==$t&&A.minFilter!==Mn&&console.warn("THREE.WebGLRenderer: Texture is not power of two. Texture.minFilter should be set to THREE.NearestFilter or THREE.LinearFilter.")),e.has("EXT_texture_filter_anisotropic")===!0){const fe=e.get("EXT_texture_filter_anisotropic");if(A.magFilter===$t||A.minFilter!==qr&&A.minFilter!==ks||A.type===Ci&&e.has("OES_texture_float_linear")===!1||a===!1&&A.type===Ns&&e.has("OES_texture_half_float_linear")===!1)return;(A.anisotropy>1||n.get(A).__currentAnisotropy)&&(i.texParameterf(R,fe.TEXTURE_MAX_ANISOTROPY_EXT,Math.min(A.anisotropy,s.getMaxAnisotropy())),n.get(A).__currentAnisotropy=A.anisotropy)}}function H(R,A){let $=!1;R.__webglInit===void 0&&(R.__webglInit=!0,A.addEventListener("dispose",B));const fe=A.source;let de=m.get(fe);de===void 0&&(de={},m.set(fe,de));const ge=W(A);if(ge!==R.__cacheKey){de[ge]===void 0&&(de[ge]={texture:i.createTexture(),usedTimes:0},o.memory.textures++,$=!0),de[ge].usedTimes++;const ze=de[R.__cacheKey];ze!==void 0&&(de[R.__cacheKey].usedTimes--,ze.usedTimes===0&&U(A)),R.__cacheKey=ge,R.__webglTexture=de[ge].texture}return $}function Se(R,A,$){let fe=3553;(A.isDataArrayTexture||A.isCompressedArrayTexture)&&(fe=35866),A.isData3DTexture&&(fe=32879);const de=H(R,A),ge=A.source;t.bindTexture(fe,R.__webglTexture,33984+$);const ze=n.get(ge);if(ge.version!==ze.__version||de===!0){t.activeTexture(33984+$),i.pixelStorei(37440,A.flipY),i.pixelStorei(37441,A.premultiplyAlpha),i.pixelStorei(3317,A.unpackAlignment),i.pixelStorei(37443,0);const Te=y(A)&&x(A.image)===!1;let te=b(A.image,Te,!1,f);te=dt(A,te);const Ce=x(te)||a,Ue=r.convert(A.format,A.encoding);let Pe=r.convert(A.type),we=w(A.internalFormat,Ue,Pe,A.encoding,A.isVideoTexture);ae(fe,A,Ce);let Re;const He=A.mipmaps,tt=a&&A.isVideoTexture!==!0,gt=ze.__version===void 0||de===!0,O=_(A,te,Ce);if(A.isDepthTexture)we=6402,a?A.type===Ci?we=36012:A.type===Ai?we=33190:A.type===ss?we=35056:we=33189:A.type===Ci&&console.error("WebGLRenderer: Floating point depth texture requires WebGL2."),A.format===Pi&&we===6402&&A.type!==lu&&A.type!==Ai&&(console.warn("THREE.WebGLRenderer: Use UnsignedShortType or UnsignedIntType for DepthFormat DepthTexture."),A.type=Ai,Pe=r.convert(A.type)),A.format===cs&&we===6402&&(we=34041,A.type!==ss&&(console.warn("THREE.WebGLRenderer: Use UnsignedInt248Type for DepthStencilFormat DepthTexture."),A.type=ss,Pe=r.convert(A.type))),gt&&(tt?t.texStorage2D(3553,1,we,te.width,te.height):t.texImage2D(3553,0,we,te.width,te.height,0,Ue,Pe,null));else if(A.isDataTexture)if(He.length>0&&Ce){tt&&gt&&t.texStorage2D(3553,O,we,He[0].width,He[0].height);for(let q=0,re=He.length;q<re;q++)Re=He[q],tt?t.texSubImage2D(3553,q,0,0,Re.width,Re.height,Ue,Pe,Re.data):t.texImage2D(3553,q,we,Re.width,Re.height,0,Ue,Pe,Re.data);A.generateMipmaps=!1}else tt?(gt&&t.texStorage2D(3553,O,we,te.width,te.height),t.texSubImage2D(3553,0,0,0,te.width,te.height,Ue,Pe,te.data)):t.texImage2D(3553,0,we,te.width,te.height,0,Ue,Pe,te.data);else if(A.isCompressedTexture)if(A.isCompressedArrayTexture){tt&&gt&&t.texStorage3D(35866,O,we,He[0].width,He[0].height,te.depth);for(let q=0,re=He.length;q<re;q++)Re=He[q],A.format!==Cn?Ue!==null?tt?t.compressedTexSubImage3D(35866,q,0,0,0,Re.width,Re.height,te.depth,Ue,Re.data,0,0):t.compressedTexImage3D(35866,q,we,Re.width,Re.height,te.depth,0,Re.data,0,0):console.warn("THREE.WebGLRenderer: Attempt to load unsupported compressed texture format in .uploadTexture()"):tt?t.texSubImage3D(35866,q,0,0,0,Re.width,Re.height,te.depth,Ue,Pe,Re.data):t.texImage3D(35866,q,we,Re.width,Re.height,te.depth,0,Ue,Pe,Re.data)}else{tt&&gt&&t.texStorage2D(3553,O,we,He[0].width,He[0].height);for(let q=0,re=He.length;q<re;q++)Re=He[q],A.format!==Cn?Ue!==null?tt?t.compressedTexSubImage2D(3553,q,0,0,Re.width,Re.height,Ue,Re.data):t.compressedTexImage2D(3553,q,we,Re.width,Re.height,0,Re.data):console.warn("THREE.WebGLRenderer: Attempt to load unsupported compressed texture format in .uploadTexture()"):tt?t.texSubImage2D(3553,q,0,0,Re.width,Re.height,Ue,Pe,Re.data):t.texImage2D(3553,q,we,Re.width,Re.height,0,Ue,Pe,Re.data)}else if(A.isDataArrayTexture)tt?(gt&&t.texStorage3D(35866,O,we,te.width,te.height,te.depth),t.texSubImage3D(35866,0,0,0,0,te.width,te.height,te.depth,Ue,Pe,te.data)):t.texImage3D(35866,0,we,te.width,te.height,te.depth,0,Ue,Pe,te.data);else if(A.isData3DTexture)tt?(gt&&t.texStorage3D(32879,O,we,te.width,te.height,te.depth),t.texSubImage3D(32879,0,0,0,0,te.width,te.height,te.depth,Ue,Pe,te.data)):t.texImage3D(32879,0,we,te.width,te.height,te.depth,0,Ue,Pe,te.data);else if(A.isFramebufferTexture){if(gt)if(tt)t.texStorage2D(3553,O,we,te.width,te.height);else{let q=te.width,re=te.height;for(let ye=0;ye<O;ye++)t.texImage2D(3553,ye,we,q,re,0,Ue,Pe,null),q>>=1,re>>=1}}else if(He.length>0&&Ce){tt&&gt&&t.texStorage2D(3553,O,we,He[0].width,He[0].height);for(let q=0,re=He.length;q<re;q++)Re=He[q],tt?t.texSubImage2D(3553,q,0,0,Ue,Pe,Re):t.texImage2D(3553,q,we,Ue,Pe,Re);A.generateMipmaps=!1}else tt?(gt&&t.texStorage2D(3553,O,we,te.width,te.height),t.texSubImage2D(3553,0,0,0,Ue,Pe,te)):t.texImage2D(3553,0,we,Ue,Pe,te);T(A,Ce)&&L(fe),ze.__version=ge.version,A.onUpdate&&A.onUpdate(A)}R.__version=A.version}function ve(R,A,$){if(A.image.length!==6)return;const fe=H(R,A),de=A.source;t.bindTexture(34067,R.__webglTexture,33984+$);const ge=n.get(de);if(de.version!==ge.__version||fe===!0){t.activeTexture(33984+$),i.pixelStorei(37440,A.flipY),i.pixelStorei(37441,A.premultiplyAlpha),i.pixelStorei(3317,A.unpackAlignment),i.pixelStorei(37443,0);const ze=A.isCompressedTexture||A.image[0].isCompressedTexture,Te=A.image[0]&&A.image[0].isDataTexture,te=[];for(let q=0;q<6;q++)!ze&&!Te?te[q]=b(A.image[q],!1,!0,c):te[q]=Te?A.image[q].image:A.image[q],te[q]=dt(A,te[q]);const Ce=te[0],Ue=x(Ce)||a,Pe=r.convert(A.format,A.encoding),we=r.convert(A.type),Re=w(A.internalFormat,Pe,we,A.encoding),He=a&&A.isVideoTexture!==!0,tt=ge.__version===void 0||fe===!0;let gt=_(A,Ce,Ue);ae(34067,A,Ue);let O;if(ze){He&&tt&&t.texStorage2D(34067,gt,Re,Ce.width,Ce.height);for(let q=0;q<6;q++){O=te[q].mipmaps;for(let re=0;re<O.length;re++){const ye=O[re];A.format!==Cn?Pe!==null?He?t.compressedTexSubImage2D(34069+q,re,0,0,ye.width,ye.height,Pe,ye.data):t.compressedTexImage2D(34069+q,re,Re,ye.width,ye.height,0,ye.data):console.warn("THREE.WebGLRenderer: Attempt to load unsupported compressed texture format in .setTextureCube()"):He?t.texSubImage2D(34069+q,re,0,0,ye.width,ye.height,Pe,we,ye.data):t.texImage2D(34069+q,re,Re,ye.width,ye.height,0,Pe,we,ye.data)}}}else{O=A.mipmaps,He&&tt&&(O.length>0&&gt++,t.texStorage2D(34067,gt,Re,te[0].width,te[0].height));for(let q=0;q<6;q++)if(Te){He?t.texSubImage2D(34069+q,0,0,0,te[q].width,te[q].height,Pe,we,te[q].data):t.texImage2D(34069+q,0,Re,te[q].width,te[q].height,0,Pe,we,te[q].data);for(let re=0;re<O.length;re++){const De=O[re].image[q].image;He?t.texSubImage2D(34069+q,re+1,0,0,De.width,De.height,Pe,we,De.data):t.texImage2D(34069+q,re+1,Re,De.width,De.height,0,Pe,we,De.data)}}else{He?t.texSubImage2D(34069+q,0,0,0,Pe,we,te[q]):t.texImage2D(34069+q,0,Re,Pe,we,te[q]);for(let re=0;re<O.length;re++){const ye=O[re];He?t.texSubImage2D(34069+q,re+1,0,0,Pe,we,ye.image[q]):t.texImage2D(34069+q,re+1,Re,Pe,we,ye.image[q])}}}T(A,Ue)&&L(34067),ge.__version=de.version,A.onUpdate&&A.onUpdate(A)}R.__version=A.version}function se(R,A,$,fe,de){const ge=r.convert($.format,$.encoding),ze=r.convert($.type),Te=w($.internalFormat,ge,ze,$.encoding);n.get(A).__hasExternalTextures||(de===32879||de===35866?t.texImage3D(de,0,Te,A.width,A.height,A.depth,0,ge,ze,null):t.texImage2D(de,0,Te,A.width,A.height,0,ge,ze,null)),t.bindFramebuffer(36160,R),Ye(A)?u.framebufferTexture2DMultisampleEXT(36160,fe,de,n.get($).__webglTexture,0,Le(A)):(de===3553||de>=34069&&de<=34074)&&i.framebufferTexture2D(36160,fe,de,n.get($).__webglTexture,0),t.bindFramebuffer(36160,null)}function me(R,A,$){if(i.bindRenderbuffer(36161,R),A.depthBuffer&&!A.stencilBuffer){let fe=33189;if($||Ye(A)){const de=A.depthTexture;de&&de.isDepthTexture&&(de.type===Ci?fe=36012:de.type===Ai&&(fe=33190));const ge=Le(A);Ye(A)?u.renderbufferStorageMultisampleEXT(36161,ge,fe,A.width,A.height):i.renderbufferStorageMultisample(36161,ge,fe,A.width,A.height)}else i.renderbufferStorage(36161,fe,A.width,A.height);i.framebufferRenderbuffer(36160,36096,36161,R)}else if(A.depthBuffer&&A.stencilBuffer){const fe=Le(A);$&&Ye(A)===!1?i.renderbufferStorageMultisample(36161,fe,35056,A.width,A.height):Ye(A)?u.renderbufferStorageMultisampleEXT(36161,fe,35056,A.width,A.height):i.renderbufferStorage(36161,34041,A.width,A.height),i.framebufferRenderbuffer(36160,33306,36161,R)}else{const fe=A.isWebGLMultipleRenderTargets===!0?A.texture:[A.texture];for(let de=0;de<fe.length;de++){const ge=fe[de],ze=r.convert(ge.format,ge.encoding),Te=r.convert(ge.type),te=w(ge.internalFormat,ze,Te,ge.encoding),Ce=Le(A);$&&Ye(A)===!1?i.renderbufferStorageMultisample(36161,Ce,te,A.width,A.height):Ye(A)?u.renderbufferStorageMultisampleEXT(36161,Ce,te,A.width,A.height):i.renderbufferStorage(36161,te,A.width,A.height)}}i.bindRenderbuffer(36161,null)}function Ie(R,A){if(A&&A.isWebGLCubeRenderTarget)throw new Error("Depth Texture with cube render targets is not supported");if(t.bindFramebuffer(36160,R),!(A.depthTexture&&A.depthTexture.isDepthTexture))throw new Error("renderTarget.depthTexture must be an instance of THREE.DepthTexture");(!n.get(A.depthTexture).__webglTexture||A.depthTexture.image.width!==A.width||A.depthTexture.image.height!==A.height)&&(A.depthTexture.image.width=A.width,A.depthTexture.image.height=A.height,A.depthTexture.needsUpdate=!0),Q(A.depthTexture,0);const fe=n.get(A.depthTexture).__webglTexture,de=Le(A);if(A.depthTexture.format===Pi)Ye(A)?u.framebufferTexture2DMultisampleEXT(36160,36096,3553,fe,0,de):i.framebufferTexture2D(36160,36096,3553,fe,0);else if(A.depthTexture.format===cs)Ye(A)?u.framebufferTexture2DMultisampleEXT(36160,33306,3553,fe,0,de):i.framebufferTexture2D(36160,33306,3553,fe,0);else throw new Error("Unknown depthTexture format")}function ce(R){const A=n.get(R),$=R.isWebGLCubeRenderTarget===!0;if(R.depthTexture&&!A.__autoAllocateDepthBuffer){if($)throw new Error("target.depthTexture not supported in Cube render targets");Ie(A.__webglFramebuffer,R)}else if($){A.__webglDepthbuffer=[];for(let fe=0;fe<6;fe++)t.bindFramebuffer(36160,A.__webglFramebuffer[fe]),A.__webglDepthbuffer[fe]=i.createRenderbuffer(),me(A.__webglDepthbuffer[fe],R,!1)}else t.bindFramebuffer(36160,A.__webglFramebuffer),A.__webglDepthbuffer=i.createRenderbuffer(),me(A.__webglDepthbuffer,R,!1);t.bindFramebuffer(36160,null)}function xe(R,A,$){const fe=n.get(R);A!==void 0&&se(fe.__webglFramebuffer,R,R.texture,36064,3553),$!==void 0&&ce(R)}function Xe(R){const A=R.texture,$=n.get(R),fe=n.get(A);R.addEventListener("dispose",k),R.isWebGLMultipleRenderTargets!==!0&&(fe.__webglTexture===void 0&&(fe.__webglTexture=i.createTexture()),fe.__version=A.version,o.memory.textures++);const de=R.isWebGLCubeRenderTarget===!0,ge=R.isWebGLMultipleRenderTargets===!0,ze=x(R)||a;if(de){$.__webglFramebuffer=[];for(let Te=0;Te<6;Te++)$.__webglFramebuffer[Te]=i.createFramebuffer()}else{if($.__webglFramebuffer=i.createFramebuffer(),ge)if(s.drawBuffers){const Te=R.texture;for(let te=0,Ce=Te.length;te<Ce;te++){const Ue=n.get(Te[te]);Ue.__webglTexture===void 0&&(Ue.__webglTexture=i.createTexture(),o.memory.textures++)}}else console.warn("THREE.WebGLRenderer: WebGLMultipleRenderTargets can only be used with WebGL2 or WEBGL_draw_buffers extension.");if(a&&R.samples>0&&Ye(R)===!1){const Te=ge?A:[A];$.__webglMultisampledFramebuffer=i.createFramebuffer(),$.__webglColorRenderbuffer=[],t.bindFramebuffer(36160,$.__webglMultisampledFramebuffer);for(let te=0;te<Te.length;te++){const Ce=Te[te];$.__webglColorRenderbuffer[te]=i.createRenderbuffer(),i.bindRenderbuffer(36161,$.__webglColorRenderbuffer[te]);const Ue=r.convert(Ce.format,Ce.encoding),Pe=r.convert(Ce.type),we=w(Ce.internalFormat,Ue,Pe,Ce.encoding,R.isXRRenderTarget===!0),Re=Le(R);i.renderbufferStorageMultisample(36161,Re,we,R.width,R.height),i.framebufferRenderbuffer(36160,36064+te,36161,$.__webglColorRenderbuffer[te])}i.bindRenderbuffer(36161,null),R.depthBuffer&&($.__webglDepthRenderbuffer=i.createRenderbuffer(),me($.__webglDepthRenderbuffer,R,!0)),t.bindFramebuffer(36160,null)}}if(de){t.bindTexture(34067,fe.__webglTexture),ae(34067,A,ze);for(let Te=0;Te<6;Te++)se($.__webglFramebuffer[Te],R,A,36064,34069+Te);T(A,ze)&&L(34067),t.unbindTexture()}else if(ge){const Te=R.texture;for(let te=0,Ce=Te.length;te<Ce;te++){const Ue=Te[te],Pe=n.get(Ue);t.bindTexture(3553,Pe.__webglTexture),ae(3553,Ue,ze),se($.__webglFramebuffer,R,Ue,36064+te,3553),T(Ue,ze)&&L(3553)}t.unbindTexture()}else{let Te=3553;(R.isWebGL3DRenderTarget||R.isWebGLArrayRenderTarget)&&(a?Te=R.isWebGL3DRenderTarget?32879:35866:console.error("THREE.WebGLTextures: THREE.Data3DTexture and THREE.DataArrayTexture only supported with WebGL2.")),t.bindTexture(Te,fe.__webglTexture),ae(Te,A,ze),se($.__webglFramebuffer,R,A,36064,Te),T(A,ze)&&L(Te),t.unbindTexture()}R.depthBuffer&&ce(R)}function Mt(R){const A=x(R)||a,$=R.isWebGLMultipleRenderTargets===!0?R.texture:[R.texture];for(let fe=0,de=$.length;fe<de;fe++){const ge=$[fe];if(T(ge,A)){const ze=R.isWebGLCubeRenderTarget?34067:3553,Te=n.get(ge).__webglTexture;t.bindTexture(ze,Te),L(ze),t.unbindTexture()}}}function nt(R){if(a&&R.samples>0&&Ye(R)===!1){const A=R.isWebGLMultipleRenderTargets?R.texture:[R.texture],$=R.width,fe=R.height;let de=16384;const ge=[],ze=R.stencilBuffer?33306:36096,Te=n.get(R),te=R.isWebGLMultipleRenderTargets===!0;if(te)for(let Ce=0;Ce<A.length;Ce++)t.bindFramebuffer(36160,Te.__webglMultisampledFramebuffer),i.framebufferRenderbuffer(36160,36064+Ce,36161,null),t.bindFramebuffer(36160,Te.__webglFramebuffer),i.framebufferTexture2D(36009,36064+Ce,3553,null,0);t.bindFramebuffer(36008,Te.__webglMultisampledFramebuffer),t.bindFramebuffer(36009,Te.__webglFramebuffer);for(let Ce=0;Ce<A.length;Ce++){ge.push(36064+Ce),R.depthBuffer&&ge.push(ze);const Ue=Te.__ignoreDepthValues!==void 0?Te.__ignoreDepthValues:!1;if(Ue===!1&&(R.depthBuffer&&(de|=256),R.stencilBuffer&&(de|=1024)),te&&i.framebufferRenderbuffer(36008,36064,36161,Te.__webglColorRenderbuffer[Ce]),Ue===!0&&(i.invalidateFramebuffer(36008,[ze]),i.invalidateFramebuffer(36009,[ze])),te){const Pe=n.get(A[Ce]).__webglTexture;i.framebufferTexture2D(36009,36064,3553,Pe,0)}i.blitFramebuffer(0,0,$,fe,0,0,$,fe,de,9728),p&&i.invalidateFramebuffer(36008,ge)}if(t.bindFramebuffer(36008,null),t.bindFramebuffer(36009,null),te)for(let Ce=0;Ce<A.length;Ce++){t.bindFramebuffer(36160,Te.__webglMultisampledFramebuffer),i.framebufferRenderbuffer(36160,36064+Ce,36161,Te.__webglColorRenderbuffer[Ce]);const Ue=n.get(A[Ce]).__webglTexture;t.bindFramebuffer(36160,Te.__webglFramebuffer),i.framebufferTexture2D(36009,36064+Ce,3553,Ue,0)}t.bindFramebuffer(36009,Te.__webglMultisampledFramebuffer)}}function Le(R){return Math.min(h,R.samples)}function Ye(R){const A=n.get(R);return a&&R.samples>0&&e.has("WEBGL_multisampled_render_to_texture")===!0&&A.__useRenderToTexture!==!1}function ht(R){const A=o.render.frame;g.get(R)!==A&&(g.set(R,A),R.update())}function dt(R,A){const $=R.encoding,fe=R.format,de=R.type;return R.isCompressedTexture===!0||R.isVideoTexture===!0||R.format===zo||$!==ui&&($===vt?a===!1?e.has("EXT_sRGB")===!0&&fe===Cn?(R.format=zo,R.minFilter=Mn,R.generateMipmaps=!1):A=du.sRGBToLinear(A):(fe!==Cn||de!==Li)&&console.warn("THREE.WebGLTextures: sRGB encoded textures have to use RGBAFormat and UnsignedByteType."):console.error("THREE.WebGLTextures: Unsupported texture encoding:",$)),A}this.allocateTextureUnit=V,this.resetTextureUnits=D,this.setTexture2D=Q,this.setTexture2DArray=oe,this.setTexture3D=ee,this.setTextureCube=z,this.rebindTextures=xe,this.setupRenderTarget=Xe,this.updateRenderTargetMipmap=Mt,this.updateMultisampleRenderTarget=nt,this.setupDepthRenderbuffer=ce,this.setupFrameBufferTexture=se,this.useMultisampledRTT=Ye}function E_(i,e,t){const n=t.isWebGL2;function s(r,o=null){let a;if(r===Li)return 5121;if(r===ih)return 32819;if(r===sh)return 32820;if(r===eh)return 5120;if(r===th)return 5122;if(r===lu)return 5123;if(r===nh)return 5124;if(r===Ai)return 5125;if(r===Ci)return 5126;if(r===Ns)return n?5131:(a=e.get("OES_texture_half_float"),a!==null?a.HALF_FLOAT_OES:null);if(r===rh)return 6406;if(r===Cn)return 6408;if(r===oh)return 6409;if(r===ah)return 6410;if(r===Pi)return 6402;if(r===cs)return 34041;if(r===zo)return a=e.get("EXT_sRGB"),a!==null?a.SRGB_ALPHA_EXT:null;if(r===lh)return 6403;if(r===ch)return 36244;if(r===uh)return 33319;if(r===fh)return 33320;if(r===hh)return 36249;if(r===Yr||r===Zr||r===Kr||r===Qr)if(o===vt)if(a=e.get("WEBGL_compressed_texture_s3tc_srgb"),a!==null){if(r===Yr)return a.COMPRESSED_SRGB_S3TC_DXT1_EXT;if(r===Zr)return a.COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT;if(r===Kr)return a.COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT;if(r===Qr)return a.COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT}else return null;else if(a=e.get("WEBGL_compressed_texture_s3tc"),a!==null){if(r===Yr)return a.COMPRESSED_RGB_S3TC_DXT1_EXT;if(r===Zr)return a.COMPRESSED_RGBA_S3TC_DXT1_EXT;if(r===Kr)return a.COMPRESSED_RGBA_S3TC_DXT3_EXT;if(r===Qr)return a.COMPRESSED_RGBA_S3TC_DXT5_EXT}else return null;if(r===ga||r===_a||r===va||r===ba)if(a=e.get("WEBGL_compressed_texture_pvrtc"),a!==null){if(r===ga)return a.COMPRESSED_RGB_PVRTC_4BPPV1_IMG;if(r===_a)return a.COMPRESSED_RGB_PVRTC_2BPPV1_IMG;if(r===va)return a.COMPRESSED_RGBA_PVRTC_4BPPV1_IMG;if(r===ba)return a.COMPRESSED_RGBA_PVRTC_2BPPV1_IMG}else return null;if(r===dh)return a=e.get("WEBGL_compressed_texture_etc1"),a!==null?a.COMPRESSED_RGB_ETC1_WEBGL:null;if(r===Ma||r===xa)if(a=e.get("WEBGL_compressed_texture_etc"),a!==null){if(r===Ma)return o===vt?a.COMPRESSED_SRGB8_ETC2:a.COMPRESSED_RGB8_ETC2;if(r===xa)return o===vt?a.COMPRESSED_SRGB8_ALPHA8_ETC2_EAC:a.COMPRESSED_RGBA8_ETC2_EAC}else return null;if(r===Sa||r===ya||r===wa||r===Ea||r===Ta||r===Aa||r===Ca||r===Pa||r===La||r===Ra||r===Da||r===Ia||r===Ua||r===za)if(a=e.get("WEBGL_compressed_texture_astc"),a!==null){if(r===Sa)return o===vt?a.COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR:a.COMPRESSED_RGBA_ASTC_4x4_KHR;if(r===ya)return o===vt?a.COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR:a.COMPRESSED_RGBA_ASTC_5x4_KHR;if(r===wa)return o===vt?a.COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR:a.COMPRESSED_RGBA_ASTC_5x5_KHR;if(r===Ea)return o===vt?a.COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR:a.COMPRESSED_RGBA_ASTC_6x5_KHR;if(r===Ta)return o===vt?a.COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR:a.COMPRESSED_RGBA_ASTC_6x6_KHR;if(r===Aa)return o===vt?a.COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR:a.COMPRESSED_RGBA_ASTC_8x5_KHR;if(r===Ca)return o===vt?a.COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR:a.COMPRESSED_RGBA_ASTC_8x6_KHR;if(r===Pa)return o===vt?a.COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR:a.COMPRESSED_RGBA_ASTC_8x8_KHR;if(r===La)return o===vt?a.COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR:a.COMPRESSED_RGBA_ASTC_10x5_KHR;if(r===Ra)return o===vt?a.COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR:a.COMPRESSED_RGBA_ASTC_10x6_KHR;if(r===Da)return o===vt?a.COMPRESSED_SRGB8_ALPHA8_ASTC_10x8_KHR:a.COMPRESSED_RGBA_ASTC_10x8_KHR;if(r===Ia)return o===vt?a.COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR:a.COMPRESSED_RGBA_ASTC_10x10_KHR;if(r===Ua)return o===vt?a.COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR:a.COMPRESSED_RGBA_ASTC_12x10_KHR;if(r===za)return o===vt?a.COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR:a.COMPRESSED_RGBA_ASTC_12x12_KHR}else return null;if(r===Jr)if(a=e.get("EXT_texture_compression_bptc"),a!==null){if(r===Jr)return o===vt?a.COMPRESSED_SRGB_ALPHA_BPTC_UNORM_EXT:a.COMPRESSED_RGBA_BPTC_UNORM_EXT}else return null;if(r===ph||r===ka||r===Na||r===Oa)if(a=e.get("EXT_texture_compression_rgtc"),a!==null){if(r===Jr)return a.COMPRESSED_RED_RGTC1_EXT;if(r===ka)return a.COMPRESSED_SIGNED_RED_RGTC1_EXT;if(r===Na)return a.COMPRESSED_RED_GREEN_RGTC2_EXT;if(r===Oa)return a.COMPRESSED_SIGNED_RED_GREEN_RGTC2_EXT}else return null;return r===ss?n?34042:(a=e.get("WEBGL_depth_texture"),a!==null?a.UNSIGNED_INT_24_8_WEBGL:null):i[r]!==void 0?i[r]:null}return{convert:s}}class T_ extends _n{constructor(e=[]){super(),this.isArrayCamera=!0,this.cameras=e}}class dr extends Ut{constructor(){super(),this.isGroup=!0,this.type="Group"}}const A_={type:"move"};class xo{constructor(){this._targetRay=null,this._grip=null,this._hand=null}getHandSpace(){return this._hand===null&&(this._hand=new dr,this._hand.matrixAutoUpdate=!1,this._hand.visible=!1,this._hand.joints={},this._hand.inputState={pinching:!1}),this._hand}getTargetRaySpace(){return this._targetRay===null&&(this._targetRay=new dr,this._targetRay.matrixAutoUpdate=!1,this._targetRay.visible=!1,this._targetRay.hasLinearVelocity=!1,this._targetRay.linearVelocity=new G,this._targetRay.hasAngularVelocity=!1,this._targetRay.angularVelocity=new G),this._targetRay}getGripSpace(){return this._grip===null&&(this._grip=new dr,this._grip.matrixAutoUpdate=!1,this._grip.visible=!1,this._grip.hasLinearVelocity=!1,this._grip.linearVelocity=new G,this._grip.hasAngularVelocity=!1,this._grip.angularVelocity=new G),this._grip}dispatchEvent(e){return this._targetRay!==null&&this._targetRay.dispatchEvent(e),this._grip!==null&&this._grip.dispatchEvent(e),this._hand!==null&&this._hand.dispatchEvent(e),this}connect(e){if(e&&e.hand){const t=this._hand;if(t)for(const n of e.hand.values())this._getHandJoint(t,n)}return this.dispatchEvent({type:"connected",data:e}),this}disconnect(e){return this.dispatchEvent({type:"disconnected",data:e}),this._targetRay!==null&&(this._targetRay.visible=!1),this._grip!==null&&(this._grip.visible=!1),this._hand!==null&&(this._hand.visible=!1),this}update(e,t,n){let s=null,r=null,o=null;const a=this._targetRay,l=this._grip,c=this._hand;if(e&&t.session.visibilityState!=="visible-blurred"){if(c&&e.hand){o=!0;for(const v of e.hand.values()){const m=t.getJointPose(v,n),d=this._getHandJoint(c,v);m!==null&&(d.matrix.fromArray(m.transform.matrix),d.matrix.decompose(d.position,d.rotation,d.scale),d.jointRadius=m.radius),d.visible=m!==null}const f=c.joints["index-finger-tip"],h=c.joints["thumb-tip"],u=f.position.distanceTo(h.position),p=.02,g=.005;c.inputState.pinching&&u>p+g?(c.inputState.pinching=!1,this.dispatchEvent({type:"pinchend",handedness:e.handedness,target:this})):!c.inputState.pinching&&u<=p-g&&(c.inputState.pinching=!0,this.dispatchEvent({type:"pinchstart",handedness:e.handedness,target:this}))}else l!==null&&e.gripSpace&&(r=t.getPose(e.gripSpace,n),r!==null&&(l.matrix.fromArray(r.transform.matrix),l.matrix.decompose(l.position,l.rotation,l.scale),r.linearVelocity?(l.hasLinearVelocity=!0,l.linearVelocity.copy(r.linearVelocity)):l.hasLinearVelocity=!1,r.angularVelocity?(l.hasAngularVelocity=!0,l.angularVelocity.copy(r.angularVelocity)):l.hasAngularVelocity=!1));a!==null&&(s=t.getPose(e.targetRaySpace,n),s===null&&r!==null&&(s=r),s!==null&&(a.matrix.fromArray(s.transform.matrix),a.matrix.decompose(a.position,a.rotation,a.scale),s.linearVelocity?(a.hasLinearVelocity=!0,a.linearVelocity.copy(s.linearVelocity)):a.hasLinearVelocity=!1,s.angularVelocity?(a.hasAngularVelocity=!0,a.angularVelocity.copy(s.angularVelocity)):a.hasAngularVelocity=!1,this.dispatchEvent(A_)))}return a!==null&&(a.visible=s!==null),l!==null&&(l.visible=r!==null),c!==null&&(c.visible=o!==null),this}_getHandJoint(e,t){if(e.joints[t.jointName]===void 0){const n=new dr;n.matrixAutoUpdate=!1,n.visible=!1,e.joints[t.jointName]=n,e.add(n)}return e.joints[t.jointName]}}class C_ extends fn{constructor(e,t,n,s,r,o,a,l,c,f){if(f=f!==void 0?f:Pi,f!==Pi&&f!==cs)throw new Error("DepthTexture format must be either THREE.DepthFormat or THREE.DepthStencilFormat");n===void 0&&f===Pi&&(n=Ai),n===void 0&&f===cs&&(n=ss),super(null,s,r,o,a,l,f,n,c),this.isDepthTexture=!0,this.image={width:e,height:t},this.magFilter=a!==void 0?a:$t,this.minFilter=l!==void 0?l:$t,this.flipY=!1,this.generateMipmaps=!1}}class P_ extends ds{constructor(e,t){super();const n=this;let s=null,r=1,o=null,a="local-floor",l=1,c=null,f=null,h=null,u=null,p=null,g=null;const v=t.getContextAttributes();let m=null,d=null;const M=[],b=[],x=new Set,y=new Map,T=new _n;T.layers.enable(1),T.viewport=new Xt;const L=new _n;L.layers.enable(2),L.viewport=new Xt;const w=[T,L],_=new T_;_.layers.enable(1),_.layers.enable(2);let S=null,B=null;this.cameraAutoUpdate=!0,this.enabled=!1,this.isPresenting=!1,this.getController=function(z){let K=M[z];return K===void 0&&(K=new xo,M[z]=K),K.getTargetRaySpace()},this.getControllerGrip=function(z){let K=M[z];return K===void 0&&(K=new xo,M[z]=K),K.getGripSpace()},this.getHand=function(z){let K=M[z];return K===void 0&&(K=new xo,M[z]=K),K.getHandSpace()};function k(z){const K=b.indexOf(z.inputSource);if(K===-1)return;const pe=M[K];pe!==void 0&&pe.dispatchEvent({type:z.type,data:z.inputSource})}function C(){s.removeEventListener("select",k),s.removeEventListener("selectstart",k),s.removeEventListener("selectend",k),s.removeEventListener("squeeze",k),s.removeEventListener("squeezestart",k),s.removeEventListener("squeezeend",k),s.removeEventListener("end",C),s.removeEventListener("inputsourceschange",U);for(let z=0;z<M.length;z++){const K=b[z];K!==null&&(b[z]=null,M[z].disconnect(K))}S=null,B=null,e.setRenderTarget(m),p=null,u=null,h=null,s=null,d=null,ee.stop(),n.isPresenting=!1,n.dispatchEvent({type:"sessionend"})}this.setFramebufferScaleFactor=function(z){r=z,n.isPresenting===!0&&console.warn("THREE.WebXRManager: Cannot change framebuffer scale while presenting.")},this.setReferenceSpaceType=function(z){a=z,n.isPresenting===!0&&console.warn("THREE.WebXRManager: Cannot change reference space type while presenting.")},this.getReferenceSpace=function(){return c||o},this.setReferenceSpace=function(z){c=z},this.getBaseLayer=function(){return u!==null?u:p},this.getBinding=function(){return h},this.getFrame=function(){return g},this.getSession=function(){return s},this.setSession=async function(z){if(s=z,s!==null){if(m=e.getRenderTarget(),s.addEventListener("select",k),s.addEventListener("selectstart",k),s.addEventListener("selectend",k),s.addEventListener("squeeze",k),s.addEventListener("squeezestart",k),s.addEventListener("squeezeend",k),s.addEventListener("end",C),s.addEventListener("inputsourceschange",U),v.xrCompatible!==!0&&await t.makeXRCompatible(),s.renderState.layers===void 0||e.capabilities.isWebGL2===!1){const K={antialias:s.renderState.layers===void 0?v.antialias:!0,alpha:v.alpha,depth:v.depth,stencil:v.stencil,framebufferScaleFactor:r};p=new XRWebGLLayer(s,t,K),s.updateRenderState({baseLayer:p}),d=new fi(p.framebufferWidth,p.framebufferHeight,{format:Cn,type:Li,encoding:e.outputEncoding,stencilBuffer:v.stencil})}else{let K=null,pe=null,ae=null;v.depth&&(ae=v.stencil?35056:33190,K=v.stencil?cs:Pi,pe=v.stencil?ss:Ai);const H={colorFormat:32856,depthFormat:ae,scaleFactor:r};h=new XRWebGLBinding(s,t),u=h.createProjectionLayer(H),s.updateRenderState({layers:[u]}),d=new fi(u.textureWidth,u.textureHeight,{format:Cn,type:Li,depthTexture:new C_(u.textureWidth,u.textureHeight,pe,void 0,void 0,void 0,void 0,void 0,void 0,K),stencilBuffer:v.stencil,encoding:e.outputEncoding,samples:v.antialias?4:0});const Se=e.properties.get(d);Se.__ignoreDepthValues=u.ignoreDepthValues}d.isXRRenderTarget=!0,this.setFoveation(l),c=null,o=await s.requestReferenceSpace(a),ee.setContext(s),ee.start(),n.isPresenting=!0,n.dispatchEvent({type:"sessionstart"})}};function U(z){for(let K=0;K<z.removed.length;K++){const pe=z.removed[K],ae=b.indexOf(pe);ae>=0&&(b[ae]=null,M[ae].disconnect(pe))}for(let K=0;K<z.added.length;K++){const pe=z.added[K];let ae=b.indexOf(pe);if(ae===-1){for(let Se=0;Se<M.length;Se++)if(Se>=b.length){b.push(pe),ae=Se;break}else if(b[Se]===null){b[Se]=pe,ae=Se;break}if(ae===-1)break}const H=M[ae];H&&H.connect(pe)}}const N=new G,j=new G;function D(z,K,pe){N.setFromMatrixPosition(K.matrixWorld),j.setFromMatrixPosition(pe.matrixWorld);const ae=N.distanceTo(j),H=K.projectionMatrix.elements,Se=pe.projectionMatrix.elements,ve=H[14]/(H[10]-1),se=H[14]/(H[10]+1),me=(H[9]+1)/H[5],Ie=(H[9]-1)/H[5],ce=(H[8]-1)/H[0],xe=(Se[8]+1)/Se[0],Xe=ve*ce,Mt=ve*xe,nt=ae/(-ce+xe),Le=nt*-ce;K.matrixWorld.decompose(z.position,z.quaternion,z.scale),z.translateX(Le),z.translateZ(nt),z.matrixWorld.compose(z.position,z.quaternion,z.scale),z.matrixWorldInverse.copy(z.matrixWorld).invert();const Ye=ve+nt,ht=se+nt,dt=Xe-Le,R=Mt+(ae-Le),A=me*se/ht*Ye,$=Ie*se/ht*Ye;z.projectionMatrix.makePerspective(dt,R,A,$,Ye,ht),z.projectionMatrixInverse.copy(z.projectionMatrix).invert()}function V(z,K){K===null?z.matrixWorld.copy(z.matrix):z.matrixWorld.multiplyMatrices(K.matrixWorld,z.matrix),z.matrixWorldInverse.copy(z.matrixWorld).invert()}this.updateCamera=function(z){if(s===null)return;_.near=L.near=T.near=z.near,_.far=L.far=T.far=z.far,(S!==_.near||B!==_.far)&&(s.updateRenderState({depthNear:_.near,depthFar:_.far}),S=_.near,B=_.far);const K=z.parent,pe=_.cameras;V(_,K);for(let ae=0;ae<pe.length;ae++)V(pe[ae],K);pe.length===2?D(_,T,L):_.projectionMatrix.copy(T.projectionMatrix),W(z,_,K)};function W(z,K,pe){pe===null?z.matrix.copy(K.matrixWorld):(z.matrix.copy(pe.matrixWorld),z.matrix.invert(),z.matrix.multiply(K.matrixWorld)),z.matrix.decompose(z.position,z.quaternion,z.scale),z.updateMatrixWorld(!0);const ae=z.children;for(let H=0,Se=ae.length;H<Se;H++)ae[H].updateMatrixWorld(!0);z.projectionMatrix.copy(K.projectionMatrix),z.projectionMatrixInverse.copy(K.projectionMatrixInverse),z.isPerspectiveCamera&&(z.fov=Fs*2*Math.atan(1/z.projectionMatrix.elements[5]),z.zoom=1)}this.getCamera=function(){return _},this.getFoveation=function(){if(!(u===null&&p===null))return l},this.setFoveation=function(z){l=z,u!==null&&(u.fixedFoveation=z),p!==null&&p.fixedFoveation!==void 0&&(p.fixedFoveation=z)},this.getPlanes=function(){return x};let Q=null;function oe(z,K){if(f=K.getViewerPose(c||o),g=K,f!==null){const pe=f.views;p!==null&&(e.setRenderTargetFramebuffer(d,p.framebuffer),e.setRenderTarget(d));let ae=!1;pe.length!==_.cameras.length&&(_.cameras.length=0,ae=!0);for(let H=0;H<pe.length;H++){const Se=pe[H];let ve=null;if(p!==null)ve=p.getViewport(Se);else{const me=h.getViewSubImage(u,Se);ve=me.viewport,H===0&&(e.setRenderTargetTextures(d,me.colorTexture,u.ignoreDepthValues?void 0:me.depthStencilTexture),e.setRenderTarget(d))}let se=w[H];se===void 0&&(se=new _n,se.layers.enable(H),se.viewport=new Xt,w[H]=se),se.matrix.fromArray(Se.transform.matrix),se.matrix.decompose(se.position,se.quaternion,se.scale),se.projectionMatrix.fromArray(Se.projectionMatrix),se.projectionMatrixInverse.copy(se.projectionMatrix).invert(),se.viewport.set(ve.x,ve.y,ve.width,ve.height),H===0&&(_.matrix.copy(se.matrix),_.matrix.decompose(_.position,_.quaternion,_.scale)),ae===!0&&_.cameras.push(se)}}for(let pe=0;pe<M.length;pe++){const ae=b[pe],H=M[pe];ae!==null&&H!==void 0&&H.update(ae,K,c||o)}if(Q&&Q(z,K),K.detectedPlanes){n.dispatchEvent({type:"planesdetected",data:K.detectedPlanes});let pe=null;for(const ae of x)K.detectedPlanes.has(ae)||(pe===null&&(pe=[]),pe.push(ae));if(pe!==null)for(const ae of pe)x.delete(ae),y.delete(ae),n.dispatchEvent({type:"planeremoved",data:ae});for(const ae of K.detectedPlanes)if(!x.has(ae))x.add(ae),y.set(ae,K.lastChangedTime),n.dispatchEvent({type:"planeadded",data:ae});else{const H=y.get(ae);ae.lastChangedTime>H&&(y.set(ae,ae.lastChangedTime),n.dispatchEvent({type:"planechanged",data:ae}))}}g=null}const ee=new yu;ee.setAnimationLoop(oe),this.setAnimationLoop=function(z){Q=z},this.dispose=function(){}}}function L_(i,e){function t(m,d){m.matrixAutoUpdate===!0&&m.updateMatrix(),d.value.copy(m.matrix)}function n(m,d){d.color.getRGB(m.fogColor.value,bu(i)),d.isFog?(m.fogNear.value=d.near,m.fogFar.value=d.far):d.isFogExp2&&(m.fogDensity.value=d.density)}function s(m,d,M,b,x){d.isMeshBasicMaterial||d.isMeshLambertMaterial?r(m,d):d.isMeshToonMaterial?(r(m,d),h(m,d)):d.isMeshPhongMaterial?(r(m,d),f(m,d)):d.isMeshStandardMaterial?(r(m,d),u(m,d),d.isMeshPhysicalMaterial&&p(m,d,x)):d.isMeshMatcapMaterial?(r(m,d),g(m,d)):d.isMeshDepthMaterial?r(m,d):d.isMeshDistanceMaterial?(r(m,d),v(m,d)):d.isMeshNormalMaterial?r(m,d):d.isLineBasicMaterial?(o(m,d),d.isLineDashedMaterial&&a(m,d)):d.isPointsMaterial?l(m,d,M,b):d.isSpriteMaterial?c(m,d):d.isShadowMaterial?(m.color.value.copy(d.color),m.opacity.value=d.opacity):d.isShaderMaterial&&(d.uniformsNeedUpdate=!1)}function r(m,d){m.opacity.value=d.opacity,d.color&&m.diffuse.value.copy(d.color),d.emissive&&m.emissive.value.copy(d.emissive).multiplyScalar(d.emissiveIntensity),d.map&&(m.map.value=d.map,t(d.map,m.mapTransform)),d.alphaMap&&(m.alphaMap.value=d.alphaMap,t(d.alphaMap,m.alphaMapTransform)),d.bumpMap&&(m.bumpMap.value=d.bumpMap,t(d.bumpMap,m.bumpMapTransform),m.bumpScale.value=d.bumpScale,d.side===un&&(m.bumpScale.value*=-1)),d.normalMap&&(m.normalMap.value=d.normalMap,t(d.normalMap,m.normalMapTransform),m.normalScale.value.copy(d.normalScale),d.side===un&&m.normalScale.value.negate()),d.displacementMap&&(m.displacementMap.value=d.displacementMap,t(d.displacementMap,m.displacementMapTransform),m.displacementScale.value=d.displacementScale,m.displacementBias.value=d.displacementBias),d.emissiveMap&&(m.emissiveMap.value=d.emissiveMap,t(d.emissiveMap,m.emissiveMapTransform)),d.specularMap&&(m.specularMap.value=d.specularMap,t(d.specularMap,m.specularMapTransform)),d.alphaTest>0&&(m.alphaTest.value=d.alphaTest);const M=e.get(d).envMap;if(M&&(m.envMap.value=M,m.flipEnvMap.value=M.isCubeTexture&&M.isRenderTargetTexture===!1?-1:1,m.reflectivity.value=d.reflectivity,m.ior.value=d.ior,m.refractionRatio.value=d.refractionRatio),d.lightMap){m.lightMap.value=d.lightMap;const b=i.useLegacyLights===!0?Math.PI:1;m.lightMapIntensity.value=d.lightMapIntensity*b,t(d.lightMap,m.lightMapTransform)}d.aoMap&&(m.aoMap.value=d.aoMap,m.aoMapIntensity.value=d.aoMapIntensity,t(d.aoMap,m.aoMapTransform))}function o(m,d){m.diffuse.value.copy(d.color),m.opacity.value=d.opacity,d.map&&(m.map.value=d.map,t(d.map,m.mapTransform))}function a(m,d){m.dashSize.value=d.dashSize,m.totalSize.value=d.dashSize+d.gapSize,m.scale.value=d.scale}function l(m,d,M,b){m.diffuse.value.copy(d.color),m.opacity.value=d.opacity,m.size.value=d.size*M,m.scale.value=b*.5,d.map&&(m.map.value=d.map,t(d.map,m.uvTransform)),d.alphaMap&&(m.alphaMap.value=d.alphaMap),d.alphaTest>0&&(m.alphaTest.value=d.alphaTest)}function c(m,d){m.diffuse.value.copy(d.color),m.opacity.value=d.opacity,m.rotation.value=d.rotation,d.map&&(m.map.value=d.map,t(d.map,m.mapTransform)),d.alphaMap&&(m.alphaMap.value=d.alphaMap),d.alphaTest>0&&(m.alphaTest.value=d.alphaTest)}function f(m,d){m.specular.value.copy(d.specular),m.shininess.value=Math.max(d.shininess,1e-4)}function h(m,d){d.gradientMap&&(m.gradientMap.value=d.gradientMap)}function u(m,d){m.metalness.value=d.metalness,d.metalnessMap&&(m.metalnessMap.value=d.metalnessMap,t(d.metalnessMap,m.metalnessMapTransform)),m.roughness.value=d.roughness,d.roughnessMap&&(m.roughnessMap.value=d.roughnessMap,t(d.roughnessMap,m.roughnessMapTransform)),e.get(d).envMap&&(m.envMapIntensity.value=d.envMapIntensity)}function p(m,d,M){m.ior.value=d.ior,d.sheen>0&&(m.sheenColor.value.copy(d.sheenColor).multiplyScalar(d.sheen),m.sheenRoughness.value=d.sheenRoughness,d.sheenColorMap&&(m.sheenColorMap.value=d.sheenColorMap,t(d.sheenColorMap,m.sheenColorMapTransform)),d.sheenRoughnessMap&&(m.sheenRoughnessMap.value=d.sheenRoughnessMap,t(d.sheenRoughnessMap,m.sheenRoughnessMapTransform))),d.clearcoat>0&&(m.clearcoat.value=d.clearcoat,m.clearcoatRoughness.value=d.clearcoatRoughness,d.clearcoatMap&&(m.clearcoatMap.value=d.clearcoatMap,t(d.clearcoatMap,m.clearcoatMapTransform)),d.clearcoatRoughnessMap&&(m.clearcoatRoughnessMap.value=d.clearcoatRoughnessMap,t(d.clearcoatRoughnessMap,m.clearcoatRoughnessMapTransform)),d.clearcoatNormalMap&&(m.clearcoatNormalMap.value=d.clearcoatNormalMap,t(d.clearcoatNormalMap,m.clearcoatNormalMapTransform),m.clearcoatNormalScale.value.copy(d.clearcoatNormalScale),d.side===un&&m.clearcoatNormalScale.value.negate())),d.iridescence>0&&(m.iridescence.value=d.iridescence,m.iridescenceIOR.value=d.iridescenceIOR,m.iridescenceThicknessMinimum.value=d.iridescenceThicknessRange[0],m.iridescenceThicknessMaximum.value=d.iridescenceThicknessRange[1],d.iridescenceMap&&(m.iridescenceMap.value=d.iridescenceMap,t(d.iridescenceMap,m.iridescenceMapTransform)),d.iridescenceThicknessMap&&(m.iridescenceThicknessMap.value=d.iridescenceThicknessMap,t(d.iridescenceThicknessMap,m.iridescenceThicknessMapTransform))),d.transmission>0&&(m.transmission.value=d.transmission,m.transmissionSamplerMap.value=M.texture,m.transmissionSamplerSize.value.set(M.width,M.height),d.transmissionMap&&(m.transmissionMap.value=d.transmissionMap,t(d.transmissionMap,m.transmissionMapTransform)),m.thickness.value=d.thickness,d.thicknessMap&&(m.thicknessMap.value=d.thicknessMap,t(d.thicknessMap,m.thicknessMapTransform)),m.attenuationDistance.value=d.attenuationDistance,m.attenuationColor.value.copy(d.attenuationColor)),m.specularIntensity.value=d.specularIntensity,m.specularColor.value.copy(d.specularColor),d.specularColorMap&&(m.specularColorMap.value=d.specularColorMap,t(d.specularColorMap,m.specularColorMapTransform)),d.specularIntensityMap&&(m.specularIntensityMap.value=d.specularIntensityMap,t(d.specularIntensityMap,m.specularIntensityMapTransform))}function g(m,d){d.matcap&&(m.matcap.value=d.matcap)}function v(m,d){const M=e.get(d).light;m.referencePosition.value.setFromMatrixPosition(M.matrixWorld),m.nearDistance.value=M.shadow.camera.near,m.farDistance.value=M.shadow.camera.far}return{refreshFogUniforms:n,refreshMaterialUniforms:s}}function R_(i,e,t,n){let s={},r={},o=[];const a=t.isWebGL2?i.getParameter(35375):0;function l(M,b){const x=b.program;n.uniformBlockBinding(M,x)}function c(M,b){let x=s[M.id];x===void 0&&(g(M),x=f(M),s[M.id]=x,M.addEventListener("dispose",m));const y=b.program;n.updateUBOMapping(M,y);const T=e.render.frame;r[M.id]!==T&&(u(M),r[M.id]=T)}function f(M){const b=h();M.__bindingPointIndex=b;const x=i.createBuffer(),y=M.__size,T=M.usage;return i.bindBuffer(35345,x),i.bufferData(35345,y,T),i.bindBuffer(35345,null),i.bindBufferBase(35345,b,x),x}function h(){for(let M=0;M<a;M++)if(o.indexOf(M)===-1)return o.push(M),M;return console.error("THREE.WebGLRenderer: Maximum number of simultaneously usable uniforms groups reached."),0}function u(M){const b=s[M.id],x=M.uniforms,y=M.__cache;i.bindBuffer(35345,b);for(let T=0,L=x.length;T<L;T++){const w=x[T];if(p(w,T,y)===!0){const _=w.__offset,S=Array.isArray(w.value)?w.value:[w.value];let B=0;for(let k=0;k<S.length;k++){const C=S[k],U=v(C);typeof C=="number"?(w.__data[0]=C,i.bufferSubData(35345,_+B,w.__data)):C.isMatrix3?(w.__data[0]=C.elements[0],w.__data[1]=C.elements[1],w.__data[2]=C.elements[2],w.__data[3]=C.elements[0],w.__data[4]=C.elements[3],w.__data[5]=C.elements[4],w.__data[6]=C.elements[5],w.__data[7]=C.elements[0],w.__data[8]=C.elements[6],w.__data[9]=C.elements[7],w.__data[10]=C.elements[8],w.__data[11]=C.elements[0]):(C.toArray(w.__data,B),B+=U.storage/Float32Array.BYTES_PER_ELEMENT)}i.bufferSubData(35345,_,w.__data)}}i.bindBuffer(35345,null)}function p(M,b,x){const y=M.value;if(x[b]===void 0){if(typeof y=="number")x[b]=y;else{const T=Array.isArray(y)?y:[y],L=[];for(let w=0;w<T.length;w++)L.push(T[w].clone());x[b]=L}return!0}else if(typeof y=="number"){if(x[b]!==y)return x[b]=y,!0}else{const T=Array.isArray(x[b])?x[b]:[x[b]],L=Array.isArray(y)?y:[y];for(let w=0;w<T.length;w++){const _=T[w];if(_.equals(L[w])===!1)return _.copy(L[w]),!0}}return!1}function g(M){const b=M.uniforms;let x=0;const y=16;let T=0;for(let L=0,w=b.length;L<w;L++){const _=b[L],S={boundary:0,storage:0},B=Array.isArray(_.value)?_.value:[_.value];for(let k=0,C=B.length;k<C;k++){const U=B[k],N=v(U);S.boundary+=N.boundary,S.storage+=N.storage}if(_.__data=new Float32Array(S.storage/Float32Array.BYTES_PER_ELEMENT),_.__offset=x,L>0){T=x%y;const k=y-T;T!==0&&k-S.boundary<0&&(x+=y-T,_.__offset=x)}x+=S.storage}return T=x%y,T>0&&(x+=y-T),M.__size=x,M.__cache={},this}function v(M){const b={boundary:0,storage:0};return typeof M=="number"?(b.boundary=4,b.storage=4):M.isVector2?(b.boundary=8,b.storage=8):M.isVector3||M.isColor?(b.boundary=16,b.storage=12):M.isVector4?(b.boundary=16,b.storage=16):M.isMatrix3?(b.boundary=48,b.storage=48):M.isMatrix4?(b.boundary=64,b.storage=64):M.isTexture?console.warn("THREE.WebGLRenderer: Texture samplers can not be part of an uniforms group."):console.warn("THREE.WebGLRenderer: Unsupported uniform value type.",M),b}function m(M){const b=M.target;b.removeEventListener("dispose",m);const x=o.indexOf(b.__bindingPointIndex);o.splice(x,1),i.deleteBuffer(s[b.id]),delete s[b.id],delete r[b.id]}function d(){for(const M in s)i.deleteBuffer(s[M]);o=[],s={},r={}}return{bind:l,update:c,dispose:d}}function D_(){const i=Bs("canvas");return i.style.display="block",i}class Pu{constructor(e={}){const{canvas:t=D_(),context:n=null,depth:s=!0,stencil:r=!0,alpha:o=!1,antialias:a=!1,premultipliedAlpha:l=!0,preserveDrawingBuffer:c=!1,powerPreference:f="default",failIfMajorPerformanceCaveat:h=!1}=e;this.isWebGLRenderer=!0;let u;n!==null?u=n.getContextAttributes().alpha:u=o;let p=null,g=null;const v=[],m=[];this.domElement=t,this.debug={checkShaderErrors:!0,onShaderError:null},this.autoClear=!0,this.autoClearColor=!0,this.autoClearDepth=!0,this.autoClearStencil=!0,this.sortObjects=!0,this.clippingPlanes=[],this.localClippingEnabled=!1,this.outputEncoding=ui,this.useLegacyLights=!0,this.toneMapping=Nn,this.toneMappingExposure=1;const d=this;let M=!1,b=0,x=0,y=null,T=-1,L=null;const w=new Xt,_=new Xt;let S=null,B=t.width,k=t.height,C=1,U=null,N=null;const j=new Xt(0,0,B,k),D=new Xt(0,0,B,k);let V=!1;const W=new Yo;let Q=!1,oe=!1,ee=null;const z=new Ct,K=new G,pe={background:null,fog:null,environment:null,overrideMaterial:null,isScene:!0};function ae(){return y===null?C:1}let H=n;function Se(P,Z){for(let ne=0;ne<P.length;ne++){const X=P[ne],ie=t.getContext(X,Z);if(ie!==null)return ie}return null}try{const P={alpha:!0,depth:s,stencil:r,antialias:a,premultipliedAlpha:l,preserveDrawingBuffer:c,powerPreference:f,failIfMajorPerformanceCaveat:h};if("setAttribute"in t&&t.setAttribute("data-engine",`three.js r${Wo}`),t.addEventListener("webglcontextlost",Re,!1),t.addEventListener("webglcontextrestored",He,!1),t.addEventListener("webglcontextcreationerror",tt,!1),H===null){const Z=["webgl2","webgl","experimental-webgl"];if(d.isWebGL1Renderer===!0&&Z.shift(),H=Se(Z,P),H===null)throw Se(Z)?new Error("Error creating WebGL context with your selected attributes."):new Error("Error creating WebGL context.")}H.getShaderPrecisionFormat===void 0&&(H.getShaderPrecisionFormat=function(){return{rangeMin:1,rangeMax:1,precision:1}})}catch(P){throw console.error("THREE.WebGLRenderer: "+P.message),P}let ve,se,me,Ie,ce,xe,Xe,Mt,nt,Le,Ye,ht,dt,R,A,$,fe,de,ge,ze,Te,te,Ce,Ue;function Pe(){ve=new Vm(H),se=new Nm(H,ve,e),ve.init(se),te=new E_(H,ve,se),me=new y_(H,ve,se),Ie=new Xm,ce=new c_,xe=new w_(H,ve,me,ce,se,te,Ie),Xe=new Fm(d),Mt=new Hm(d),nt=new sd(H,se),Ce=new zm(H,ve,nt,se),Le=new Wm(H,nt,Ie,Ce),Ye=new Km(H,Le,nt,Ie),ge=new Zm(H,se,xe),$=new Om(ce),ht=new l_(d,Xe,Mt,ve,se,Ce,$),dt=new L_(d,ce),R=new f_,A=new __(ve,se),de=new Um(d,Xe,Mt,me,Ye,u,l),fe=new S_(d,Ye,se),Ue=new R_(H,Ie,se,me),ze=new km(H,ve,Ie,se),Te=new jm(H,ve,Ie,se),Ie.programs=ht.programs,d.capabilities=se,d.extensions=ve,d.properties=ce,d.renderLists=R,d.shadowMap=fe,d.state=me,d.info=Ie}Pe();const we=new P_(d,H);this.xr=we,this.getContext=function(){return H},this.getContextAttributes=function(){return H.getContextAttributes()},this.forceContextLoss=function(){const P=ve.get("WEBGL_lose_context");P&&P.loseContext()},this.forceContextRestore=function(){const P=ve.get("WEBGL_lose_context");P&&P.restoreContext()},this.getPixelRatio=function(){return C},this.setPixelRatio=function(P){P!==void 0&&(C=P,this.setSize(B,k,!1))},this.getSize=function(P){return P.set(B,k)},this.setSize=function(P,Z,ne=!0){if(we.isPresenting){console.warn("THREE.WebGLRenderer: Can't change size while VR device is presenting.");return}B=P,k=Z,t.width=Math.floor(P*C),t.height=Math.floor(Z*C),ne===!0&&(t.style.width=P+"px",t.style.height=Z+"px"),this.setViewport(0,0,P,Z)},this.getDrawingBufferSize=function(P){return P.set(B*C,k*C).floor()},this.setDrawingBufferSize=function(P,Z,ne){B=P,k=Z,C=ne,t.width=Math.floor(P*ne),t.height=Math.floor(Z*ne),this.setViewport(0,0,P,Z)},this.getCurrentViewport=function(P){return P.copy(w)},this.getViewport=function(P){return P.copy(j)},this.setViewport=function(P,Z,ne,X){P.isVector4?j.set(P.x,P.y,P.z,P.w):j.set(P,Z,ne,X),me.viewport(w.copy(j).multiplyScalar(C).floor())},this.getScissor=function(P){return P.copy(D)},this.setScissor=function(P,Z,ne,X){P.isVector4?D.set(P.x,P.y,P.z,P.w):D.set(P,Z,ne,X),me.scissor(_.copy(D).multiplyScalar(C).floor())},this.getScissorTest=function(){return V},this.setScissorTest=function(P){me.setScissorTest(V=P)},this.setOpaqueSort=function(P){U=P},this.setTransparentSort=function(P){N=P},this.getClearColor=function(P){return P.copy(de.getClearColor())},this.setClearColor=function(){de.setClearColor.apply(de,arguments)},this.getClearAlpha=function(){return de.getClearAlpha()},this.setClearAlpha=function(){de.setClearAlpha.apply(de,arguments)},this.clear=function(P=!0,Z=!0,ne=!0){let X=0;P&&(X|=16384),Z&&(X|=256),ne&&(X|=1024),H.clear(X)},this.clearColor=function(){this.clear(!0,!1,!1)},this.clearDepth=function(){this.clear(!1,!0,!1)},this.clearStencil=function(){this.clear(!1,!1,!0)},this.dispose=function(){t.removeEventListener("webglcontextlost",Re,!1),t.removeEventListener("webglcontextrestored",He,!1),t.removeEventListener("webglcontextcreationerror",tt,!1),R.dispose(),A.dispose(),ce.dispose(),Xe.dispose(),Mt.dispose(),Ye.dispose(),Ce.dispose(),Ue.dispose(),ht.dispose(),we.dispose(),we.removeEventListener("sessionstart",De),we.removeEventListener("sessionend",lt),ee&&(ee.dispose(),ee=null),ft.stop()};function Re(P){P.preventDefault(),console.log("THREE.WebGLRenderer: Context Lost."),M=!0}function He(){console.log("THREE.WebGLRenderer: Context Restored."),M=!1;const P=Ie.autoReset,Z=fe.enabled,ne=fe.autoUpdate,X=fe.needsUpdate,ie=fe.type;Pe(),Ie.autoReset=P,fe.enabled=Z,fe.autoUpdate=ne,fe.needsUpdate=X,fe.type=ie}function tt(P){console.error("THREE.WebGLRenderer: A WebGL context could not be created. Reason: ",P.statusMessage)}function gt(P){const Z=P.target;Z.removeEventListener("dispose",gt),O(Z)}function O(P){q(P),ce.remove(P)}function q(P){const Z=ce.get(P).programs;Z!==void 0&&(Z.forEach(function(ne){ht.releaseProgram(ne)}),P.isShaderMaterial&&ht.releaseShaderCache(P))}this.renderBufferDirect=function(P,Z,ne,X,ie,ke){Z===null&&(Z=pe);const Ge=ie.isMesh&&ie.matrixWorld.determinant()<0,Ve=Fr(P,Z,ne,X,ie);me.setMaterial(X,Ge);let je=ne.index,Ze=1;X.wireframe===!0&&(je=Le.getWireframeAttribute(ne),Ze=2);const Ke=ne.drawRange,$e=ne.attributes.position;let ct=Ke.start*Ze,jt=(Ke.start+Ke.count)*Ze;ke!==null&&(ct=Math.max(ct,ke.start*Ze),jt=Math.min(jt,(ke.start+ke.count)*Ze)),je!==null?(ct=Math.max(ct,0),jt=Math.min(jt,je.count)):$e!=null&&(ct=Math.max(ct,0),jt=Math.min(jt,$e.count));const hn=jt-ct;if(hn<0||hn===1/0)return;Ce.setup(ie,X,Ve,ne,je);let Wn,Y=ze;if(je!==null&&(Wn=nt.get(je),Y=Te,Y.setIndex(Wn)),ie.isMesh)X.wireframe===!0?(me.setLineWidth(X.wireframeLinewidth*ae()),Y.setMode(1)):Y.setMode(4);else if(ie.isLine){let We=X.linewidth;We===void 0&&(We=1),me.setLineWidth(We*ae()),ie.isLineSegments?Y.setMode(1):ie.isLineLoop?Y.setMode(2):Y.setMode(3)}else ie.isPoints?Y.setMode(0):ie.isSprite&&Y.setMode(4);if(ie.isInstancedMesh)Y.renderInstances(ct,hn,ie.count);else if(ne.isInstancedBufferGeometry){const We=ne._maxInstanceCount!==void 0?ne._maxInstanceCount:1/0,_t=Math.min(ne.instanceCount,We);Y.renderInstances(ct,hn,_t)}else Y.render(ct,hn)},this.compile=function(P,Z){function ne(X,ie,ke){X.transparent===!0&&X.side===zn&&X.forceSinglePass===!1?(X.side=un,X.needsUpdate=!0,Di(X,ie,ke),X.side=ci,X.needsUpdate=!0,Di(X,ie,ke),X.side=zn):Di(X,ie,ke)}g=A.get(P),g.init(),m.push(g),P.traverseVisible(function(X){X.isLight&&X.layers.test(Z.layers)&&(g.pushLight(X),X.castShadow&&g.pushShadow(X))}),g.setupLights(d.useLegacyLights),P.traverse(function(X){const ie=X.material;if(ie)if(Array.isArray(ie))for(let ke=0;ke<ie.length;ke++){const Ge=ie[ke];ne(Ge,P,X)}else ne(ie,P,X)}),m.pop(),g=null};let re=null;function ye(P){re&&re(P)}function De(){ft.stop()}function lt(){ft.start()}const ft=new yu;ft.setAnimationLoop(ye),typeof self!="undefined"&&ft.setContext(self),this.setAnimationLoop=function(P){re=P,we.setAnimationLoop(P),P===null?ft.stop():ft.start()},we.addEventListener("sessionstart",De),we.addEventListener("sessionend",lt),this.render=function(P,Z){if(Z!==void 0&&Z.isCamera!==!0){console.error("THREE.WebGLRenderer.render: camera is not an instance of THREE.Camera.");return}if(M===!0)return;P.matrixWorldAutoUpdate===!0&&P.updateMatrixWorld(),Z.parent===null&&Z.matrixWorldAutoUpdate===!0&&Z.updateMatrixWorld(),we.enabled===!0&&we.isPresenting===!0&&(we.cameraAutoUpdate===!0&&we.updateCamera(Z),Z=we.getCamera()),P.isScene===!0&&P.onBeforeRender(d,P,Z,y),g=A.get(P,m.length),g.init(),m.push(g),z.multiplyMatrices(Z.projectionMatrix,Z.matrixWorldInverse),W.setFromProjectionMatrix(z),oe=this.localClippingEnabled,Q=$.init(this.clippingPlanes,oe),p=R.get(P,v.length),p.init(),v.push(p),Pt(P,Z,0,d.sortObjects),p.finish(),d.sortObjects===!0&&p.sort(U,N),Q===!0&&$.beginShadows();const ne=g.state.shadowsArray;if(fe.render(ne,P,Z),Q===!0&&$.endShadows(),this.info.autoReset===!0&&this.info.reset(),de.render(p,P),g.setupLights(d.useLegacyLights),Z.isArrayCamera){const X=Z.cameras;for(let ie=0,ke=X.length;ie<ke;ie++){const Ge=X[ie];Ln(p,P,Ge,Ge.viewport)}}else Ln(p,P,Z);y!==null&&(xe.updateMultisampleRenderTarget(y),xe.updateRenderTargetMipmap(y)),P.isScene===!0&&P.onAfterRender(d,P,Z),Ce.resetDefaultState(),T=-1,L=null,m.pop(),m.length>0?g=m[m.length-1]:g=null,v.pop(),v.length>0?p=v[v.length-1]:p=null};function Pt(P,Z,ne,X){if(P.visible===!1)return;if(P.layers.test(Z.layers)){if(P.isGroup)ne=P.renderOrder;else if(P.isLOD)P.autoUpdate===!0&&P.update(Z);else if(P.isLight)g.pushLight(P),P.castShadow&&g.pushShadow(P);else if(P.isSprite){if(!P.frustumCulled||W.intersectsSprite(P)){X&&K.setFromMatrixPosition(P.matrixWorld).applyMatrix4(z);const Ge=Ye.update(P),Ve=P.material;Ve.visible&&p.push(P,Ge,Ve,ne,K.z,null)}}else if((P.isMesh||P.isLine||P.isPoints)&&(P.isSkinnedMesh&&P.skeleton.frame!==Ie.render.frame&&(P.skeleton.update(),P.skeleton.frame=Ie.render.frame),!P.frustumCulled||W.intersectsObject(P))){X&&K.setFromMatrixPosition(P.matrixWorld).applyMatrix4(z);const Ge=Ye.update(P),Ve=P.material;if(Array.isArray(Ve)){const je=Ge.groups;for(let Ze=0,Ke=je.length;Ze<Ke;Ze++){const $e=je[Ze],ct=Ve[$e.materialIndex];ct&&ct.visible&&p.push(P,Ge,ct,ne,K.z,$e)}}else Ve.visible&&p.push(P,Ge,Ve,ne,K.z,null)}}const ke=P.children;for(let Ge=0,Ve=ke.length;Ge<Ve;Ge++)Pt(ke[Ge],Z,ne,X)}function Ln(P,Z,ne,X){const ie=P.opaque,ke=P.transmissive,Ge=P.transparent;g.setupLightsView(ne),Q===!0&&$.setGlobalState(d.clippingPlanes,ne),ke.length>0&&Tt(ie,ke,Z,ne),X&&me.viewport(w.copy(X)),ie.length>0&&rn(ie,Z,ne),ke.length>0&&rn(ke,Z,ne),Ge.length>0&&rn(Ge,Z,ne),me.buffers.depth.setTest(!0),me.buffers.depth.setMask(!0),me.buffers.color.setMask(!0),me.setPolygonOffset(!1)}function Tt(P,Z,ne,X){if(ee===null){const Ve=se.isWebGL2;ee=new fi(1024,1024,{generateMipmaps:!0,type:ve.has("EXT_color_buffer_half_float")?Ns:Li,minFilter:ks,samples:Ve&&a===!0?4:0})}const ie=d.getRenderTarget();d.setRenderTarget(ee),d.clear();const ke=d.toneMapping;d.toneMapping=Nn,rn(P,ne,X),xe.updateMultisampleRenderTarget(ee),xe.updateRenderTargetMipmap(ee);let Ge=!1;for(let Ve=0,je=Z.length;Ve<je;Ve++){const Ze=Z[Ve],Ke=Ze.object,$e=Ze.geometry,ct=Ze.material,jt=Ze.group;if(ct.side===zn&&Ke.layers.test(X.layers)){const hn=ct.side;ct.side=un,ct.needsUpdate=!0,vn(Ke,ne,X,$e,ct,jt),ct.side=hn,ct.needsUpdate=!0,Ge=!0}}Ge===!0&&(xe.updateMultisampleRenderTarget(ee),xe.updateRenderTargetMipmap(ee)),d.setRenderTarget(ie),d.toneMapping=ke}function rn(P,Z,ne){const X=Z.isScene===!0?Z.overrideMaterial:null;for(let ie=0,ke=P.length;ie<ke;ie++){const Ge=P[ie],Ve=Ge.object,je=Ge.geometry,Ze=X===null?Ge.material:X,Ke=Ge.group;Ve.layers.test(ne.layers)&&vn(Ve,Z,ne,je,Ze,Ke)}}function vn(P,Z,ne,X,ie,ke){P.onBeforeRender(d,Z,ne,X,ie,ke),P.modelViewMatrix.multiplyMatrices(ne.matrixWorldInverse,P.matrixWorld),P.normalMatrix.getNormalMatrix(P.modelViewMatrix),ie.onBeforeRender(d,Z,ne,X,P,ke),ie.transparent===!0&&ie.side===zn&&ie.forceSinglePass===!1?(ie.side=un,ie.needsUpdate=!0,d.renderBufferDirect(ne,Z,X,ie,P,ke),ie.side=ci,ie.needsUpdate=!0,d.renderBufferDirect(ne,Z,X,ie,P,ke),ie.side=zn):d.renderBufferDirect(ne,Z,X,ie,P,ke),P.onAfterRender(d,Z,ne,X,ie,ke)}function Di(P,Z,ne){Z.isScene!==!0&&(Z=pe);const X=ce.get(P),ie=g.state.lights,ke=g.state.shadowsArray,Ge=ie.state.version,Ve=ht.getParameters(P,ie.state,ke,Z,ne),je=ht.getProgramCacheKey(Ve);let Ze=X.programs;X.environment=P.isMeshStandardMaterial?Z.environment:null,X.fog=Z.fog,X.envMap=(P.isMeshStandardMaterial?Mt:Xe).get(P.envMap||X.environment),Ze===void 0&&(P.addEventListener("dispose",gt),Ze=new Map,X.programs=Ze);let Ke=Ze.get(je);if(Ke!==void 0){if(X.currentProgram===Ke&&X.lightsStateVersion===Ge)return js(P,Ve),Ke}else Ve.uniforms=ht.getUniforms(P),P.onBuild(ne,Ve,d),P.onBeforeCompile(Ve,d),Ke=ht.acquireProgram(Ve,je),Ze.set(je,Ke),X.uniforms=Ve.uniforms;const $e=X.uniforms;(!P.isShaderMaterial&&!P.isRawShaderMaterial||P.clipping===!0)&&($e.clippingPlanes=$.uniform),js(P,Ve),X.needsLights=Gr(P),X.lightsStateVersion=Ge,X.needsLights&&($e.ambientLightColor.value=ie.state.ambient,$e.lightProbe.value=ie.state.probe,$e.directionalLights.value=ie.state.directional,$e.directionalLightShadows.value=ie.state.directionalShadow,$e.spotLights.value=ie.state.spot,$e.spotLightShadows.value=ie.state.spotShadow,$e.rectAreaLights.value=ie.state.rectArea,$e.ltc_1.value=ie.state.rectAreaLTC1,$e.ltc_2.value=ie.state.rectAreaLTC2,$e.pointLights.value=ie.state.point,$e.pointLightShadows.value=ie.state.pointShadow,$e.hemisphereLights.value=ie.state.hemi,$e.directionalShadowMap.value=ie.state.directionalShadowMap,$e.directionalShadowMatrix.value=ie.state.directionalShadowMatrix,$e.spotShadowMap.value=ie.state.spotShadowMap,$e.spotLightMatrix.value=ie.state.spotLightMatrix,$e.spotLightMap.value=ie.state.spotLightMap,$e.pointShadowMap.value=ie.state.pointShadowMap,$e.pointShadowMatrix.value=ie.state.pointShadowMatrix);const ct=Ke.getUniforms(),jt=Mr.seqWithValue(ct.seq,$e);return X.currentProgram=Ke,X.uniformsList=jt,Ke}function js(P,Z){const ne=ce.get(P);ne.outputEncoding=Z.outputEncoding,ne.instancing=Z.instancing,ne.skinning=Z.skinning,ne.morphTargets=Z.morphTargets,ne.morphNormals=Z.morphNormals,ne.morphColors=Z.morphColors,ne.morphTargetsCount=Z.morphTargetsCount,ne.numClippingPlanes=Z.numClippingPlanes,ne.numIntersection=Z.numClipIntersection,ne.vertexAlphas=Z.vertexAlphas,ne.vertexTangents=Z.vertexTangents,ne.toneMapping=Z.toneMapping}function Fr(P,Z,ne,X,ie){Z.isScene!==!0&&(Z=pe),xe.resetTextureUnits();const ke=Z.fog,Ge=X.isMeshStandardMaterial?Z.environment:null,Ve=y===null?d.outputEncoding:y.isXRRenderTarget===!0?y.texture.encoding:ui,je=(X.isMeshStandardMaterial?Mt:Xe).get(X.envMap||Ge),Ze=X.vertexColors===!0&&!!ne.attributes.color&&ne.attributes.color.itemSize===4,Ke=!!X.normalMap&&!!ne.attributes.tangent,$e=!!ne.morphAttributes.position,ct=!!ne.morphAttributes.normal,jt=!!ne.morphAttributes.color,hn=X.toneMapped?d.toneMapping:Nn,Wn=ne.morphAttributes.position||ne.morphAttributes.normal||ne.morphAttributes.color,Y=Wn!==void 0?Wn.length:0,We=ce.get(X),_t=g.state.lights;if(Q===!0&&(oe===!0||P!==L)){const dn=P===L&&X.id===T;$.setState(X,P,dn)}let Nt=!1;X.version===We.__version?(We.needsLights&&We.lightsStateVersion!==_t.state.version||We.outputEncoding!==Ve||ie.isInstancedMesh&&We.instancing===!1||!ie.isInstancedMesh&&We.instancing===!0||ie.isSkinnedMesh&&We.skinning===!1||!ie.isSkinnedMesh&&We.skinning===!0||We.envMap!==je||X.fog===!0&&We.fog!==ke||We.numClippingPlanes!==void 0&&(We.numClippingPlanes!==$.numPlanes||We.numIntersection!==$.numIntersection)||We.vertexAlphas!==Ze||We.vertexTangents!==Ke||We.morphTargets!==$e||We.morphNormals!==ct||We.morphColors!==jt||We.toneMapping!==hn||se.isWebGL2===!0&&We.morphTargetsCount!==Y)&&(Nt=!0):(Nt=!0,We.__version=X.version);let gi=We.currentProgram;Nt===!0&&(gi=Di(X,Z,ie));let ia=!1,vs=!1,Hr=!1;const Qt=gi.getUniforms(),_i=We.uniforms;if(me.useProgram(gi.program)&&(ia=!0,vs=!0,Hr=!0),X.id!==T&&(T=X.id,vs=!0),ia||L!==P){if(Qt.setValue(H,"projectionMatrix",P.projectionMatrix),se.logarithmicDepthBuffer&&Qt.setValue(H,"logDepthBufFC",2/(Math.log(P.far+1)/Math.LN2)),L!==P&&(L=P,vs=!0,Hr=!0),X.isShaderMaterial||X.isMeshPhongMaterial||X.isMeshToonMaterial||X.isMeshStandardMaterial||X.envMap){const dn=Qt.map.cameraPosition;dn!==void 0&&dn.setValue(H,K.setFromMatrixPosition(P.matrixWorld))}(X.isMeshPhongMaterial||X.isMeshToonMaterial||X.isMeshLambertMaterial||X.isMeshBasicMaterial||X.isMeshStandardMaterial||X.isShaderMaterial)&&Qt.setValue(H,"isOrthographic",P.isOrthographicCamera===!0),(X.isMeshPhongMaterial||X.isMeshToonMaterial||X.isMeshLambertMaterial||X.isMeshBasicMaterial||X.isMeshStandardMaterial||X.isShaderMaterial||X.isShadowMaterial||ie.isSkinnedMesh)&&Qt.setValue(H,"viewMatrix",P.matrixWorldInverse)}if(ie.isSkinnedMesh){Qt.setOptional(H,ie,"bindMatrix"),Qt.setOptional(H,ie,"bindMatrixInverse");const dn=ie.skeleton;dn&&(se.floatVertexTextures?(dn.boneTexture===null&&dn.computeBoneTexture(),Qt.setValue(H,"boneTexture",dn.boneTexture,xe),Qt.setValue(H,"boneTextureSize",dn.boneTextureSize)):console.warn("THREE.WebGLRenderer: SkinnedMesh can only be used with WebGL 2. With WebGL 1 OES_texture_float and vertex textures support is required."))}const Vr=ne.morphAttributes;if((Vr.position!==void 0||Vr.normal!==void 0||Vr.color!==void 0&&se.isWebGL2===!0)&&ge.update(ie,ne,gi),(vs||We.receiveShadow!==ie.receiveShadow)&&(We.receiveShadow=ie.receiveShadow,Qt.setValue(H,"receiveShadow",ie.receiveShadow)),X.isMeshGouraudMaterial&&X.envMap!==null&&(_i.envMap.value=je,_i.flipEnvMap.value=je.isCubeTexture&&je.isRenderTargetTexture===!1?-1:1),vs&&(Qt.setValue(H,"toneMappingExposure",d.toneMappingExposure),We.needsLights&&Br(_i,Hr),ke&&X.fog===!0&&dt.refreshFogUniforms(_i,ke),dt.refreshMaterialUniforms(_i,X,C,k,ee),Mr.upload(H,We.uniformsList,_i,xe)),X.isShaderMaterial&&X.uniformsNeedUpdate===!0&&(Mr.upload(H,We.uniformsList,_i,xe),X.uniformsNeedUpdate=!1),X.isSpriteMaterial&&Qt.setValue(H,"center",ie.center),Qt.setValue(H,"modelViewMatrix",ie.modelViewMatrix),Qt.setValue(H,"normalMatrix",ie.normalMatrix),Qt.setValue(H,"modelMatrix",ie.matrixWorld),X.isShaderMaterial||X.isRawShaderMaterial){const dn=X.uniformsGroups;for(let Wr=0,tf=dn.length;Wr<tf;Wr++)if(se.isWebGL2){const sa=dn[Wr];Ue.update(sa,gi),Ue.bind(sa,gi)}else console.warn("THREE.WebGLRenderer: Uniform Buffer Objects can only be used with WebGL 2.")}return gi}function Br(P,Z){P.ambientLightColor.needsUpdate=Z,P.lightProbe.needsUpdate=Z,P.directionalLights.needsUpdate=Z,P.directionalLightShadows.needsUpdate=Z,P.pointLights.needsUpdate=Z,P.pointLightShadows.needsUpdate=Z,P.spotLights.needsUpdate=Z,P.spotLightShadows.needsUpdate=Z,P.rectAreaLights.needsUpdate=Z,P.hemisphereLights.needsUpdate=Z}function Gr(P){return P.isMeshLambertMaterial||P.isMeshToonMaterial||P.isMeshPhongMaterial||P.isMeshStandardMaterial||P.isShadowMaterial||P.isShaderMaterial&&P.lights===!0}this.getActiveCubeFace=function(){return b},this.getActiveMipmapLevel=function(){return x},this.getRenderTarget=function(){return y},this.setRenderTargetTextures=function(P,Z,ne){ce.get(P.texture).__webglTexture=Z,ce.get(P.depthTexture).__webglTexture=ne;const X=ce.get(P);X.__hasExternalTextures=!0,X.__hasExternalTextures&&(X.__autoAllocateDepthBuffer=ne===void 0,X.__autoAllocateDepthBuffer||ve.has("WEBGL_multisampled_render_to_texture")===!0&&(console.warn("THREE.WebGLRenderer: Render-to-texture extension was disabled because an external texture was provided"),X.__useRenderToTexture=!1))},this.setRenderTargetFramebuffer=function(P,Z){const ne=ce.get(P);ne.__webglFramebuffer=Z,ne.__useDefaultFramebuffer=Z===void 0},this.setRenderTarget=function(P,Z=0,ne=0){y=P,b=Z,x=ne;let X=!0,ie=null,ke=!1,Ge=!1;if(P){const je=ce.get(P);je.__useDefaultFramebuffer!==void 0?(me.bindFramebuffer(36160,null),X=!1):je.__webglFramebuffer===void 0?xe.setupRenderTarget(P):je.__hasExternalTextures&&xe.rebindTextures(P,ce.get(P.texture).__webglTexture,ce.get(P.depthTexture).__webglTexture);const Ze=P.texture;(Ze.isData3DTexture||Ze.isDataArrayTexture||Ze.isCompressedArrayTexture)&&(Ge=!0);const Ke=ce.get(P).__webglFramebuffer;P.isWebGLCubeRenderTarget?(ie=Ke[Z],ke=!0):se.isWebGL2&&P.samples>0&&xe.useMultisampledRTT(P)===!1?ie=ce.get(P).__webglMultisampledFramebuffer:ie=Ke,w.copy(P.viewport),_.copy(P.scissor),S=P.scissorTest}else w.copy(j).multiplyScalar(C).floor(),_.copy(D).multiplyScalar(C).floor(),S=V;if(me.bindFramebuffer(36160,ie)&&se.drawBuffers&&X&&me.drawBuffers(P,ie),me.viewport(w),me.scissor(_),me.setScissorTest(S),ke){const je=ce.get(P.texture);H.framebufferTexture2D(36160,36064,34069+Z,je.__webglTexture,ne)}else if(Ge){const je=ce.get(P.texture),Ze=Z||0;H.framebufferTextureLayer(36160,36064,je.__webglTexture,ne||0,Ze)}T=-1},this.readRenderTargetPixels=function(P,Z,ne,X,ie,ke,Ge){if(!(P&&P.isWebGLRenderTarget)){console.error("THREE.WebGLRenderer.readRenderTargetPixels: renderTarget is not THREE.WebGLRenderTarget.");return}let Ve=ce.get(P).__webglFramebuffer;if(P.isWebGLCubeRenderTarget&&Ge!==void 0&&(Ve=Ve[Ge]),Ve){me.bindFramebuffer(36160,Ve);try{const je=P.texture,Ze=je.format,Ke=je.type;if(Ze!==Cn&&te.convert(Ze)!==H.getParameter(35739)){console.error("THREE.WebGLRenderer.readRenderTargetPixels: renderTarget is not in RGBA or implementation defined format.");return}const $e=Ke===Ns&&(ve.has("EXT_color_buffer_half_float")||se.isWebGL2&&ve.has("EXT_color_buffer_float"));if(Ke!==Li&&te.convert(Ke)!==H.getParameter(35738)&&!(Ke===Ci&&(se.isWebGL2||ve.has("OES_texture_float")||ve.has("WEBGL_color_buffer_float")))&&!$e){console.error("THREE.WebGLRenderer.readRenderTargetPixels: renderTarget is not in UnsignedByteType or implementation defined type.");return}Z>=0&&Z<=P.width-X&&ne>=0&&ne<=P.height-ie&&H.readPixels(Z,ne,X,ie,te.convert(Ze),te.convert(Ke),ke)}finally{const je=y!==null?ce.get(y).__webglFramebuffer:null;me.bindFramebuffer(36160,je)}}},this.copyFramebufferToTexture=function(P,Z,ne=0){const X=Math.pow(2,-ne),ie=Math.floor(Z.image.width*X),ke=Math.floor(Z.image.height*X);xe.setTexture2D(Z,0),H.copyTexSubImage2D(3553,ne,0,0,P.x,P.y,ie,ke),me.unbindTexture()},this.copyTextureToTexture=function(P,Z,ne,X=0){const ie=Z.image.width,ke=Z.image.height,Ge=te.convert(ne.format),Ve=te.convert(ne.type);xe.setTexture2D(ne,0),H.pixelStorei(37440,ne.flipY),H.pixelStorei(37441,ne.premultiplyAlpha),H.pixelStorei(3317,ne.unpackAlignment),Z.isDataTexture?H.texSubImage2D(3553,X,P.x,P.y,ie,ke,Ge,Ve,Z.image.data):Z.isCompressedTexture?H.compressedTexSubImage2D(3553,X,P.x,P.y,Z.mipmaps[0].width,Z.mipmaps[0].height,Ge,Z.mipmaps[0].data):H.texSubImage2D(3553,X,P.x,P.y,Ge,Ve,Z.image),X===0&&ne.generateMipmaps&&H.generateMipmap(3553),me.unbindTexture()},this.copyTextureToTexture3D=function(P,Z,ne,X,ie=0){if(d.isWebGL1Renderer){console.warn("THREE.WebGLRenderer.copyTextureToTexture3D: can only be used with WebGL2.");return}const ke=P.max.x-P.min.x+1,Ge=P.max.y-P.min.y+1,Ve=P.max.z-P.min.z+1,je=te.convert(X.format),Ze=te.convert(X.type);let Ke;if(X.isData3DTexture)xe.setTexture3D(X,0),Ke=32879;else if(X.isDataArrayTexture)xe.setTexture2DArray(X,0),Ke=35866;else{console.warn("THREE.WebGLRenderer.copyTextureToTexture3D: only supports THREE.DataTexture3D and THREE.DataTexture2DArray.");return}H.pixelStorei(37440,X.flipY),H.pixelStorei(37441,X.premultiplyAlpha),H.pixelStorei(3317,X.unpackAlignment);const $e=H.getParameter(3314),ct=H.getParameter(32878),jt=H.getParameter(3316),hn=H.getParameter(3315),Wn=H.getParameter(32877),Y=ne.isCompressedTexture?ne.mipmaps[0]:ne.image;H.pixelStorei(3314,Y.width),H.pixelStorei(32878,Y.height),H.pixelStorei(3316,P.min.x),H.pixelStorei(3315,P.min.y),H.pixelStorei(32877,P.min.z),ne.isDataTexture||ne.isData3DTexture?H.texSubImage3D(Ke,ie,Z.x,Z.y,Z.z,ke,Ge,Ve,je,Ze,Y.data):ne.isCompressedArrayTexture?(console.warn("THREE.WebGLRenderer.copyTextureToTexture3D: untested support for compressed srcTexture."),H.compressedTexSubImage3D(Ke,ie,Z.x,Z.y,Z.z,ke,Ge,Ve,je,Y.data)):H.texSubImage3D(Ke,ie,Z.x,Z.y,Z.z,ke,Ge,Ve,je,Ze,Y),H.pixelStorei(3314,$e),H.pixelStorei(32878,ct),H.pixelStorei(3316,jt),H.pixelStorei(3315,hn),H.pixelStorei(32877,Wn),ie===0&&X.generateMipmaps&&H.generateMipmap(Ke),me.unbindTexture()},this.initTexture=function(P){P.isCubeTexture?xe.setTextureCube(P,0):P.isData3DTexture?xe.setTexture3D(P,0):P.isDataArrayTexture||P.isCompressedArrayTexture?xe.setTexture2DArray(P,0):xe.setTexture2D(P,0),me.unbindTexture()},this.resetState=function(){b=0,x=0,y=null,me.reset(),Ce.reset()},typeof __THREE_DEVTOOLS__!="undefined"&&__THREE_DEVTOOLS__.dispatchEvent(new CustomEvent("observe",{detail:this}))}get physicallyCorrectLights(){return console.warn("THREE.WebGLRenderer: the property .physicallyCorrectLights has been removed. Set renderer.useLegacyLights instead."),!this.useLegacyLights}set physicallyCorrectLights(e){console.warn("THREE.WebGLRenderer: the property .physicallyCorrectLights has been removed. Set renderer.useLegacyLights instead."),this.useLegacyLights=!e}}class I_ extends Pu{}I_.prototype.isWebGL1Renderer=!0;class U_ extends Ut{constructor(){super(),this.isScene=!0,this.type="Scene",this.background=null,this.environment=null,this.fog=null,this.backgroundBlurriness=0,this.backgroundIntensity=1,this.overrideMaterial=null,typeof __THREE_DEVTOOLS__!="undefined"&&__THREE_DEVTOOLS__.dispatchEvent(new CustomEvent("observe",{detail:this}))}copy(e,t){return super.copy(e,t),e.background!==null&&(this.background=e.background.clone()),e.environment!==null&&(this.environment=e.environment.clone()),e.fog!==null&&(this.fog=e.fog.clone()),this.backgroundBlurriness=e.backgroundBlurriness,this.backgroundIntensity=e.backgroundIntensity,e.overrideMaterial!==null&&(this.overrideMaterial=e.overrideMaterial.clone()),this.matrixAutoUpdate=e.matrixAutoUpdate,this}toJSON(e){const t=super.toJSON(e);return this.fog!==null&&(t.object.fog=this.fog.toJSON()),this.backgroundBlurriness>0&&(t.object.backgroundBlurriness=this.backgroundBlurriness),this.backgroundIntensity!==1&&(t.object.backgroundIntensity=this.backgroundIntensity),t}get autoUpdate(){return console.warn("THREE.Scene: autoUpdate was renamed to matrixWorldAutoUpdate in r144."),this.matrixWorldAutoUpdate}set autoUpdate(e){console.warn("THREE.Scene: autoUpdate was renamed to matrixWorldAutoUpdate in r144."),this.matrixWorldAutoUpdate=e}}class Lu extends ms{constructor(e){super(),this.isLineBasicMaterial=!0,this.type="LineBasicMaterial",this.color=new ut(16777215),this.map=null,this.linewidth=1,this.linecap="round",this.linejoin="round",this.fog=!0,this.setValues(e)}copy(e){return super.copy(e),this.color.copy(e.color),this.map=e.map,this.linewidth=e.linewidth,this.linecap=e.linecap,this.linejoin=e.linejoin,this.fog=e.fog,this}}const wl=new G,El=new G,Tl=new Ct,So=new Xo,pr=new Dr;class si extends Ut{constructor(e=new sn,t=new Lu){super(),this.isLine=!0,this.type="Line",this.geometry=e,this.material=t,this.updateMorphTargets()}copy(e,t){return super.copy(e,t),this.material=e.material,this.geometry=e.geometry,this}computeLineDistances(){const e=this.geometry;if(e.index===null){const t=e.attributes.position,n=[0];for(let s=1,r=t.count;s<r;s++)wl.fromBufferAttribute(t,s-1),El.fromBufferAttribute(t,s),n[s]=n[s-1],n[s]+=wl.distanceTo(El);e.setAttribute("lineDistance",new Et(n,1))}else console.warn("THREE.Line.computeLineDistances(): Computation only possible with non-indexed BufferGeometry.");return this}raycast(e,t){const n=this.geometry,s=this.matrixWorld,r=e.params.Line.threshold,o=n.drawRange;if(n.boundingSphere===null&&n.computeBoundingSphere(),pr.copy(n.boundingSphere),pr.applyMatrix4(s),pr.radius+=r,e.ray.intersectsSphere(pr)===!1)return;Tl.copy(s).invert(),So.copy(e.ray).applyMatrix4(Tl);const a=r/((this.scale.x+this.scale.y+this.scale.z)/3),l=a*a,c=new G,f=new G,h=new G,u=new G,p=this.isLineSegments?2:1,g=n.index,m=n.attributes.position;if(g!==null){const d=Math.max(0,o.start),M=Math.min(g.count,o.start+o.count);for(let b=d,x=M-1;b<x;b+=p){const y=g.getX(b),T=g.getX(b+1);if(c.fromBufferAttribute(m,y),f.fromBufferAttribute(m,T),So.distanceSqToSegment(c,f,u,h)>l)continue;u.applyMatrix4(this.matrixWorld);const w=e.ray.origin.distanceTo(u);w<e.near||w>e.far||t.push({distance:w,point:h.clone().applyMatrix4(this.matrixWorld),index:b,face:null,faceIndex:null,object:this})}}else{const d=Math.max(0,o.start),M=Math.min(m.count,o.start+o.count);for(let b=d,x=M-1;b<x;b+=p){if(c.fromBufferAttribute(m,b),f.fromBufferAttribute(m,b+1),So.distanceSqToSegment(c,f,u,h)>l)continue;u.applyMatrix4(this.matrixWorld);const T=e.ray.origin.distanceTo(u);T<e.near||T>e.far||t.push({distance:T,point:h.clone().applyMatrix4(this.matrixWorld),index:b,face:null,faceIndex:null,object:this})}}}updateMorphTargets(){const t=this.geometry.morphAttributes,n=Object.keys(t);if(n.length>0){const s=t[n[0]];if(s!==void 0){this.morphTargetInfluences=[],this.morphTargetDictionary={};for(let r=0,o=s.length;r<o;r++){const a=s[r].name||String(r);this.morphTargetInfluences.push(0),this.morphTargetDictionary[a]=r}}}}}class Kt extends sn{constructor(e=1,t=1,n=1,s=32,r=1,o=!1,a=0,l=Math.PI*2){super(),this.type="CylinderGeometry",this.parameters={radiusTop:e,radiusBottom:t,height:n,radialSegments:s,heightSegments:r,openEnded:o,thetaStart:a,thetaLength:l};const c=this;s=Math.floor(s),r=Math.floor(r);const f=[],h=[],u=[],p=[];let g=0;const v=[],m=n/2;let d=0;M(),o===!1&&(e>0&&b(!0),t>0&&b(!1)),this.setIndex(f),this.setAttribute("position",new Et(h,3)),this.setAttribute("normal",new Et(u,3)),this.setAttribute("uv",new Et(p,2));function M(){const x=new G,y=new G;let T=0;const L=(t-e)/n;for(let w=0;w<=r;w++){const _=[],S=w/r,B=S*(t-e)+e;for(let k=0;k<=s;k++){const C=k/s,U=C*l+a,N=Math.sin(U),j=Math.cos(U);y.x=B*N,y.y=-S*n+m,y.z=B*j,h.push(y.x,y.y,y.z),x.set(N,L,j).normalize(),u.push(x.x,x.y,x.z),p.push(C,1-S),_.push(g++)}v.push(_)}for(let w=0;w<s;w++)for(let _=0;_<r;_++){const S=v[_][w],B=v[_+1][w],k=v[_+1][w+1],C=v[_][w+1];f.push(S,B,C),f.push(B,k,C),T+=6}c.addGroup(d,T,0),d+=T}function b(x){const y=g,T=new st,L=new G;let w=0;const _=x===!0?e:t,S=x===!0?1:-1;for(let k=1;k<=s;k++)h.push(0,m*S,0),u.push(0,S,0),p.push(.5,.5),g++;const B=g;for(let k=0;k<=s;k++){const U=k/s*l+a,N=Math.cos(U),j=Math.sin(U);L.x=_*j,L.y=m*S,L.z=_*N,h.push(L.x,L.y,L.z),u.push(0,S,0),T.x=N*.5+.5,T.y=j*.5*S+.5,p.push(T.x,T.y),g++}for(let k=0;k<s;k++){const C=y+k,U=B+k;x===!0?f.push(U,U+1,C):f.push(U+1,U,C),w+=3}c.addGroup(d,w,x===!0?1:2),d+=w}}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new Kt(e.radiusTop,e.radiusBottom,e.height,e.radialSegments,e.heightSegments,e.openEnded,e.thetaStart,e.thetaLength)}}class Ko extends sn{constructor(e=[],t=[],n=1,s=0){super(),this.type="PolyhedronGeometry",this.parameters={vertices:e,indices:t,radius:n,detail:s};const r=[],o=[];a(s),c(n),f(),this.setAttribute("position",new Et(r,3)),this.setAttribute("normal",new Et(r.slice(),3)),this.setAttribute("uv",new Et(o,2)),s===0?this.computeVertexNormals():this.normalizeNormals();function a(M){const b=new G,x=new G,y=new G;for(let T=0;T<t.length;T+=3)p(t[T+0],b),p(t[T+1],x),p(t[T+2],y),l(b,x,y,M)}function l(M,b,x,y){const T=y+1,L=[];for(let w=0;w<=T;w++){L[w]=[];const _=M.clone().lerp(x,w/T),S=b.clone().lerp(x,w/T),B=T-w;for(let k=0;k<=B;k++)k===0&&w===T?L[w][k]=_:L[w][k]=_.clone().lerp(S,k/B)}for(let w=0;w<T;w++)for(let _=0;_<2*(T-w)-1;_++){const S=Math.floor(_/2);_%2===0?(u(L[w][S+1]),u(L[w+1][S]),u(L[w][S])):(u(L[w][S+1]),u(L[w+1][S+1]),u(L[w+1][S]))}}function c(M){const b=new G;for(let x=0;x<r.length;x+=3)b.x=r[x+0],b.y=r[x+1],b.z=r[x+2],b.normalize().multiplyScalar(M),r[x+0]=b.x,r[x+1]=b.y,r[x+2]=b.z}function f(){const M=new G;for(let b=0;b<r.length;b+=3){M.x=r[b+0],M.y=r[b+1],M.z=r[b+2];const x=m(M)/2/Math.PI+.5,y=d(M)/Math.PI+.5;o.push(x,1-y)}g(),h()}function h(){for(let M=0;M<o.length;M+=6){const b=o[M+0],x=o[M+2],y=o[M+4],T=Math.max(b,x,y),L=Math.min(b,x,y);T>.9&&L<.1&&(b<.2&&(o[M+0]+=1),x<.2&&(o[M+2]+=1),y<.2&&(o[M+4]+=1))}}function u(M){r.push(M.x,M.y,M.z)}function p(M,b){const x=M*3;b.x=e[x+0],b.y=e[x+1],b.z=e[x+2]}function g(){const M=new G,b=new G,x=new G,y=new G,T=new st,L=new st,w=new st;for(let _=0,S=0;_<r.length;_+=9,S+=6){M.set(r[_+0],r[_+1],r[_+2]),b.set(r[_+3],r[_+4],r[_+5]),x.set(r[_+6],r[_+7],r[_+8]),T.set(o[S+0],o[S+1]),L.set(o[S+2],o[S+3]),w.set(o[S+4],o[S+5]),y.copy(M).add(b).add(x).divideScalar(3);const B=m(y);v(T,S+0,M,B),v(L,S+2,b,B),v(w,S+4,x,B)}}function v(M,b,x,y){y<0&&M.x===1&&(o[b]=M.x-1),x.x===0&&x.z===0&&(o[b]=y/2/Math.PI+.5)}function m(M){return Math.atan2(M.z,-M.x)}function d(M){return Math.atan2(-M.y,Math.sqrt(M.x*M.x+M.z*M.z))}}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new Ko(e.vertices,e.indices,e.radius,e.details)}}class es extends Ko{constructor(e=1,t=0){const n=[1,0,0,-1,0,0,0,1,0,0,-1,0,0,0,1,0,0,-1],s=[0,2,4,0,4,3,0,3,5,0,5,2,1,2,5,1,5,3,1,3,4,1,4,2];super(n,s,e,t),this.type="OctahedronGeometry",this.parameters={radius:e,detail:t}}static fromJSON(e){return new es(e.radius,e.detail)}}class Qo extends sn{constructor(e=1,t=32,n=16,s=0,r=Math.PI*2,o=0,a=Math.PI){super(),this.type="SphereGeometry",this.parameters={radius:e,widthSegments:t,heightSegments:n,phiStart:s,phiLength:r,thetaStart:o,thetaLength:a},t=Math.max(3,Math.floor(t)),n=Math.max(2,Math.floor(n));const l=Math.min(o+a,Math.PI);let c=0;const f=[],h=new G,u=new G,p=[],g=[],v=[],m=[];for(let d=0;d<=n;d++){const M=[],b=d/n;let x=0;d===0&&o===0?x=.5/t:d===n&&l===Math.PI&&(x=-.5/t);for(let y=0;y<=t;y++){const T=y/t;h.x=-e*Math.cos(s+T*r)*Math.sin(o+b*a),h.y=e*Math.cos(o+b*a),h.z=e*Math.sin(s+T*r)*Math.sin(o+b*a),g.push(h.x,h.y,h.z),u.copy(h).normalize(),v.push(u.x,u.y,u.z),m.push(T+x,1-b),M.push(c++)}f.push(M)}for(let d=0;d<n;d++)for(let M=0;M<t;M++){const b=f[d][M+1],x=f[d][M],y=f[d+1][M],T=f[d+1][M+1];(d!==0||o>0)&&p.push(b,x,T),(d!==n-1||l<Math.PI)&&p.push(x,y,T)}this.setIndex(p),this.setAttribute("position",new Et(g,3)),this.setAttribute("normal",new Et(v,3)),this.setAttribute("uv",new Et(m,2))}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new Qo(e.radius,e.widthSegments,e.heightSegments,e.phiStart,e.phiLength,e.thetaStart,e.thetaLength)}}class Ti extends sn{constructor(e=1,t=.4,n=12,s=48,r=Math.PI*2){super(),this.type="TorusGeometry",this.parameters={radius:e,tube:t,radialSegments:n,tubularSegments:s,arc:r},n=Math.floor(n),s=Math.floor(s);const o=[],a=[],l=[],c=[],f=new G,h=new G,u=new G;for(let p=0;p<=n;p++)for(let g=0;g<=s;g++){const v=g/s*r,m=p/n*Math.PI*2;h.x=(e+t*Math.cos(m))*Math.cos(v),h.y=(e+t*Math.cos(m))*Math.sin(v),h.z=t*Math.sin(m),a.push(h.x,h.y,h.z),f.x=e*Math.cos(v),f.y=e*Math.sin(v),u.subVectors(h,f).normalize(),l.push(u.x,u.y,u.z),c.push(g/s),c.push(p/n)}for(let p=1;p<=n;p++)for(let g=1;g<=s;g++){const v=(s+1)*p+g-1,m=(s+1)*(p-1)+g-1,d=(s+1)*(p-1)+g,M=(s+1)*p+g;o.push(v,m,M),o.push(m,d,M)}this.setIndex(o),this.setAttribute("position",new Et(a,3)),this.setAttribute("normal",new Et(l,3)),this.setAttribute("uv",new Et(c,2))}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new Ti(e.radius,e.tube,e.radialSegments,e.tubularSegments,e.arc)}}class Ru extends ms{constructor(e){super(),this.isMeshStandardMaterial=!0,this.defines={STANDARD:""},this.type="MeshStandardMaterial",this.color=new ut(16777215),this.roughness=1,this.metalness=0,this.map=null,this.lightMap=null,this.lightMapIntensity=1,this.aoMap=null,this.aoMapIntensity=1,this.emissive=new ut(0),this.emissiveIntensity=1,this.emissiveMap=null,this.bumpMap=null,this.bumpScale=1,this.normalMap=null,this.normalMapType=cu,this.normalScale=new st(1,1),this.displacementMap=null,this.displacementScale=1,this.displacementBias=0,this.roughnessMap=null,this.metalnessMap=null,this.alphaMap=null,this.envMap=null,this.envMapIntensity=1,this.wireframe=!1,this.wireframeLinewidth=1,this.wireframeLinecap="round",this.wireframeLinejoin="round",this.flatShading=!1,this.fog=!0,this.setValues(e)}copy(e){return super.copy(e),this.defines={STANDARD:""},this.color.copy(e.color),this.roughness=e.roughness,this.metalness=e.metalness,this.map=e.map,this.lightMap=e.lightMap,this.lightMapIntensity=e.lightMapIntensity,this.aoMap=e.aoMap,this.aoMapIntensity=e.aoMapIntensity,this.emissive.copy(e.emissive),this.emissiveMap=e.emissiveMap,this.emissiveIntensity=e.emissiveIntensity,this.bumpMap=e.bumpMap,this.bumpScale=e.bumpScale,this.normalMap=e.normalMap,this.normalMapType=e.normalMapType,this.normalScale.copy(e.normalScale),this.displacementMap=e.displacementMap,this.displacementScale=e.displacementScale,this.displacementBias=e.displacementBias,this.roughnessMap=e.roughnessMap,this.metalnessMap=e.metalnessMap,this.alphaMap=e.alphaMap,this.envMap=e.envMap,this.envMapIntensity=e.envMapIntensity,this.wireframe=e.wireframe,this.wireframeLinewidth=e.wireframeLinewidth,this.wireframeLinecap=e.wireframeLinecap,this.wireframeLinejoin=e.wireframeLinejoin,this.flatShading=e.flatShading,this.fog=e.fog,this}}const Al={enabled:!1,files:{},add:function(i,e){this.enabled!==!1&&(this.files[i]=e)},get:function(i){if(this.enabled!==!1)return this.files[i]},remove:function(i){delete this.files[i]},clear:function(){this.files={}}};class z_{constructor(e,t,n){const s=this;let r=!1,o=0,a=0,l;const c=[];this.onStart=void 0,this.onLoad=e,this.onProgress=t,this.onError=n,this.itemStart=function(f){a++,r===!1&&s.onStart!==void 0&&s.onStart(f,o,a),r=!0},this.itemEnd=function(f){o++,s.onProgress!==void 0&&s.onProgress(f,o,a),o===a&&(r=!1,s.onLoad!==void 0&&s.onLoad())},this.itemError=function(f){s.onError!==void 0&&s.onError(f)},this.resolveURL=function(f){return l?l(f):f},this.setURLModifier=function(f){return l=f,this},this.addHandler=function(f,h){return c.push(f,h),this},this.removeHandler=function(f){const h=c.indexOf(f);return h!==-1&&c.splice(h,2),this},this.getHandler=function(f){for(let h=0,u=c.length;h<u;h+=2){const p=c[h],g=c[h+1];if(p.global&&(p.lastIndex=0),p.test(f))return g}return null}}}const Du=new z_;class Iu{constructor(e){this.manager=e!==void 0?e:Du,this.crossOrigin="anonymous",this.withCredentials=!1,this.path="",this.resourcePath="",this.requestHeader={}}load(){}loadAsync(e,t){const n=this;return new Promise(function(s,r){n.load(e,s,t,r)})}parse(){}setCrossOrigin(e){return this.crossOrigin=e,this}setWithCredentials(e){return this.withCredentials=e,this}setPath(e){return this.path=e,this}setResourcePath(e){return this.resourcePath=e,this}setRequestHeader(e){return this.requestHeader=e,this}}class k_ extends Iu{constructor(e){super(e)}load(e,t,n,s){this.path!==void 0&&(e=this.path+e),e=this.manager.resolveURL(e);const r=this,o=Al.get(e);if(o!==void 0)return r.manager.itemStart(e),setTimeout(function(){t&&t(o),r.manager.itemEnd(e)},0),o;const a=Bs("img");function l(){f(),Al.add(e,this),t&&t(this),r.manager.itemEnd(e)}function c(h){f(),s&&s(h),r.manager.itemError(e),r.manager.itemEnd(e)}function f(){a.removeEventListener("load",l,!1),a.removeEventListener("error",c,!1)}return a.addEventListener("load",l,!1),a.addEventListener("error",c,!1),e.slice(0,5)!=="data:"&&this.crossOrigin!==void 0&&(a.crossOrigin=this.crossOrigin),r.manager.itemStart(e),a.src=e,a}}class Cl extends Iu{constructor(e){super(e)}load(e,t,n,s){const r=new fn,o=new k_(this.manager);return o.setCrossOrigin(this.crossOrigin),o.setPath(this.path),o.load(e,function(a){r.image=a,r.needsUpdate=!0,t!==void 0&&t(r)},n,s),r}}class Uu{constructor(e=!0){this.autoStart=e,this.startTime=0,this.oldTime=0,this.elapsedTime=0,this.running=!1}start(){this.startTime=Pl(),this.oldTime=this.startTime,this.elapsedTime=0,this.running=!0}stop(){this.getElapsedTime(),this.running=!1,this.autoStart=!1}getElapsedTime(){return this.getDelta(),this.elapsedTime}getDelta(){let e=0;if(this.autoStart&&!this.running)return this.start(),0;if(this.running){const t=Pl();e=(t-this.oldTime)/1e3,this.oldTime=t,this.elapsedTime+=e}return e}}function Pl(){return(typeof performance=="undefined"?Date:performance).now()}class zu{constructor(e,t,n=0,s=1/0){this.ray=new Xo(e,t),this.near=n,this.far=s,this.camera=null,this.layers=new qo,this.params={Mesh:{},Line:{threshold:1},LOD:{},Points:{threshold:1},Sprite:{}}}set(e,t){this.ray.set(e,t)}setFromCamera(e,t){t.isPerspectiveCamera?(this.ray.origin.setFromMatrixPosition(t.matrixWorld),this.ray.direction.set(e.x,e.y,.5).unproject(t).sub(this.ray.origin).normalize(),this.camera=t):t.isOrthographicCamera?(this.ray.origin.set(e.x,e.y,(t.near+t.far)/(t.near-t.far)).unproject(t),this.ray.direction.set(0,0,-1).transformDirection(t.matrixWorld),this.camera=t):console.error("THREE.Raycaster: Unsupported camera type: "+t.type)}intersectObject(e,t=!0,n=[]){return Oo(e,this,n,t),n.sort(Ll),n}intersectObjects(e,t=!0,n=[]){for(let s=0,r=e.length;s<r;s++)Oo(e[s],this,n,t);return n.sort(Ll),n}}function Ll(i,e){return i.distance-e.distance}function Oo(i,e,t,n){if(i.layers.test(e.layers)&&i.raycast(e,t),n===!0){const s=i.children;for(let r=0,o=s.length;r<o;r++)Oo(s[r],e,t,!0)}}typeof __THREE_DEVTOOLS__!="undefined"&&__THREE_DEVTOOLS__.dispatchEvent(new CustomEvent("register",{detail:{revision:Wo}}));typeof window!="undefined"&&(window.__THREE__?console.warn("WARNING: Multiple instances of Three.js being imported."):window.__THREE__=Wo);const N_=Je({fallbackResourceName:"debug",allowEscapeKey:!0}),O_=Je(window.GetParentResourceName?window.GetParentResourceName():di(N_).DEBUG_RESOURCE_NAME),Jo=Je(window.GetParentResourceName?"nui://sn_properties/web/assets":"assets"),$o=Je(!window.invokeNative),Fo=Je(5),Rl=Je(!1),xr=Je({}),Sr=Je({}),Bo=Je(["all","house","lights","sofas","beds","wardrobes","storage","electronics","kitchen","chairs","tables","foods","bathroom","shelves","decor","wallart","doors","walls","floors","plants","carpets","jewelry","office","misc"]),Go=Je([{id:4,model:"apa_mp_h_lit_lamptable_21",price:999,section:"lamps",options:[{id:1,model:"apa_mp_h_lit_lamptable_21",price:999,section:"lamps"},{id:1,model:"apa_mp_h_lit_lamptable_21",price:999,section:"lamps"}]},{id:1,model:"apa_mp_h_lit_lamptable_21",price:999,section:"lamps"},{id:1,model:"apa_mp_h_lit_lamptable_21",price:999,section:"lamps"},{id:1,model:"apa_mp_h_lit_lamptable_21",price:999,section:"lamps"},{id:1,model:"apa_mp_h_lit_lamptable_21",price:999,section:"lamps"},{id:1,model:"apa_mp_h_lit_lamptable_21",price:999,section:"lamps"},{id:1,model:"apa_mp_h_lit_lamptable_21",price:999,section:"lamps"},{id:1,model:"apa_mp_h_lit_lamptable_21",price:999,section:"lamps"},{id:1,model:"apa_mp_h_lit_lamptable_21",price:999,section:"lamps"},{id:1,model:"apa_mp_h_lit_lamptable_21",price:999,section:"lamps"},{id:1,model:"apa_mp_h_lit_lamptable_21",price:999,section:"lamps"},{id:1,model:"apa_mp_h_lit_lamptable_21",price:999,section:"lamps"}]),Cr=Je([]),F_={transformSnap:Je(.001),rotationSnap:Je(1)},Lt={cameraPosition:Je({x:0,y:0,z:1}),cameraLookAt:Je({x:0,y:0,z:10}),objectPosition:Je({x:0,y:0,z:10}),objectEuler:Je(new mi(0,0,0,"ZXY")),entity:Je(0),selectedType:Je("catalog"),selectedID:Je(0),selectedColors:Je(1),selectedParent:Je(-1)},ku=di($o),B_=di(O_),G_=[];async function it(i,e={}){if(ku==!0){const s=await H_(i,e);return Promise.resolve(s)}const t={method:"post",headers:{"Content-Type":"application/json; charset=UTF-8"},body:JSON.stringify(e)};return await(await fetch(`https://${B_}/${i}`,t)).json()}function It(i,e){const t=n=>{const{action:s,data:r}=n.data;s===i&&e(r)};Pr(()=>window.addEventListener("message",t)),wt(()=>window.removeEventListener("message",t))}async function H_(i,e){if(!ku)return;const t=G_[i];return t===void 0?(console.log(`[DEBUG] ${i} event does not have a debugger.`),{}):await t(e)}const V_=`${di(Jo)}/ui/missing_image.png`;function mr(i,e){return new Promise((t,n)=>{const s=`${di(Jo)}/${i}/${e}.png`,r=new Image;r.onload=()=>t(s),r.onerror=()=>t(V_),r.src=s})}async function W_(i,e){return new Promise((t,n)=>{const s=`https://nui-img/${i}?t=${String(Math.round(new Date().getTime()/1e3))}`,r=new Image;r.onload=()=>{try{const o=document.createElement("canvas"),a=o.getContext("2d");if(!a)throw new Error("Failed to get 2D context.");o.width=r.width,o.height=r.height,a.drawImage(r,0,0),a.fillStyle=`rgba(${e.r}, ${e.g}, ${e.b}, ${e.a/255})`,a.globalCompositeOperation="source-atop",a.fillRect(0,0,o.width,o.height),t(o.toDataURL("image/png"))}catch(o){console.error("Error processing image:",o),n(o)}finally{(r.complete||r.complete===void 0)&&(r.src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAkCAIAAACIS8SLAAAAKklEQVRIie3NMQEAAAgDILV/55nBww8K0Enq2XwHDofD4XA4HA6Hw+E4Wwq6A0U+bfCEAAAAAElFTkSuQmCC",r.src=s),r.remove()}},r.onerror=o=>{console.error("Image load failed:",o),n("Image load error")},r.src=s})}const j_={uniforms:{tDiffuse:{value:null},opacity:{value:1}},vertexShader:`

		varying vec2 vUv;

		void main() {

			vUv = uv;
			gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );

		}`,fragmentShader:`

		uniform float opacity;

		uniform sampler2D tDiffuse;

		varying vec2 vUv;

		void main() {

			gl_FragColor = texture2D( tDiffuse, vUv );
			gl_FragColor.a *= opacity;


		}`};class kr{constructor(){this.isPass=!0,this.enabled=!0,this.needsSwap=!0,this.clear=!1,this.renderToScreen=!1}setSize(){}render(){console.error("THREE.Pass: .render() must be implemented in derived pass.")}dispose(){}}const X_=new wu(-1,1,1,-1,0,1),ea=new sn;ea.setAttribute("position",new Et([-1,3,0,-1,-1,0,3,-1,0],3));ea.setAttribute("uv",new Et([0,2,0,0,2,0],2));class q_{constructor(e){this._mesh=new Ee(ea,e)}dispose(){this._mesh.geometry.dispose()}render(e){e.render(this._mesh,X_)}get material(){return this._mesh.material}set material(e){this._mesh.material=e}}class Y_ extends kr{constructor(e,t){super(),this.textureID=t!==void 0?t:"tDiffuse",e instanceof $n?(this.uniforms=e.uniforms,this.material=e):e&&(this.uniforms=Mu.clone(e.uniforms),this.material=new $n({defines:Object.assign({},e.defines),uniforms:this.uniforms,vertexShader:e.vertexShader,fragmentShader:e.fragmentShader})),this.fsQuad=new q_(this.material)}render(e,t,n){this.uniforms[this.textureID]&&(this.uniforms[this.textureID].value=n.texture),this.fsQuad.material=this.material,this.renderToScreen?(e.setRenderTarget(null),this.fsQuad.render(e)):(e.setRenderTarget(t),this.clear&&e.clear(e.autoClearColor,e.autoClearDepth,e.autoClearStencil),this.fsQuad.render(e))}dispose(){this.material.dispose(),this.fsQuad.dispose()}}class Dl extends kr{constructor(e,t){super(),this.scene=e,this.camera=t,this.clear=!0,this.needsSwap=!1,this.inverse=!1}render(e,t,n){const s=e.getContext(),r=e.state;r.buffers.color.setMask(!1),r.buffers.depth.setMask(!1),r.buffers.color.setLocked(!0),r.buffers.depth.setLocked(!0);let o,a;this.inverse?(o=0,a=1):(o=1,a=0),r.buffers.stencil.setTest(!0),r.buffers.stencil.setOp(s.REPLACE,s.REPLACE,s.REPLACE),r.buffers.stencil.setFunc(s.ALWAYS,o,4294967295),r.buffers.stencil.setClear(a),r.buffers.stencil.setLocked(!0),e.setRenderTarget(n),this.clear&&e.clear(),e.render(this.scene,this.camera),e.setRenderTarget(t),this.clear&&e.clear(),e.render(this.scene,this.camera),r.buffers.color.setLocked(!1),r.buffers.depth.setLocked(!1),r.buffers.stencil.setLocked(!1),r.buffers.stencil.setFunc(s.EQUAL,1,4294967295),r.buffers.stencil.setOp(s.KEEP,s.KEEP,s.KEEP),r.buffers.stencil.setLocked(!0)}}class Z_ extends kr{constructor(){super(),this.needsSwap=!1}render(e){e.state.buffers.stencil.setLocked(!1),e.state.buffers.stencil.setTest(!1)}}class K_{constructor(e,t){if(this.renderer=e,t===void 0){const n=e.getSize(new st);this._pixelRatio=e.getPixelRatio(),this._width=n.width,this._height=n.height,t=new fi(this._width*this._pixelRatio,this._height*this._pixelRatio),t.texture.name="EffectComposer.rt1"}else this._pixelRatio=1,this._width=t.width,this._height=t.height;this.renderTarget1=t,this.renderTarget2=t.clone(),this.renderTarget2.texture.name="EffectComposer.rt2",this.writeBuffer=this.renderTarget1,this.readBuffer=this.renderTarget2,this.renderToScreen=!0,this.passes=[],this.copyPass=new Y_(j_),this.clock=new Uu}swapBuffers(){const e=this.readBuffer;this.readBuffer=this.writeBuffer,this.writeBuffer=e}addPass(e){this.passes.push(e),e.setSize(this._width*this._pixelRatio,this._height*this._pixelRatio)}insertPass(e,t){this.passes.splice(t,0,e),e.setSize(this._width*this._pixelRatio,this._height*this._pixelRatio)}removePass(e){const t=this.passes.indexOf(e);t!==-1&&this.passes.splice(t,1)}isLastEnabledPass(e){for(let t=e+1;t<this.passes.length;t++)if(this.passes[t].enabled)return!1;return!0}render(e){e===void 0&&(e=this.clock.getDelta());const t=this.renderer.getRenderTarget();let n=!1;for(let s=0,r=this.passes.length;s<r;s++){const o=this.passes[s];if(o.enabled!==!1){if(o.renderToScreen=this.renderToScreen&&this.isLastEnabledPass(s),o.render(this.renderer,this.writeBuffer,this.readBuffer,e,n),o.needsSwap){if(n){const a=this.renderer.getContext(),l=this.renderer.state.buffers.stencil;l.setFunc(a.NOTEQUAL,1,4294967295),this.copyPass.render(this.renderer,this.writeBuffer,this.readBuffer,e),l.setFunc(a.EQUAL,1,4294967295)}this.swapBuffers()}Dl!==void 0&&(o instanceof Dl?n=!0:o instanceof Z_&&(n=!1))}}this.renderer.setRenderTarget(t)}reset(e){if(e===void 0){const t=this.renderer.getSize(new st);this._pixelRatio=this.renderer.getPixelRatio(),this._width=t.width,this._height=t.height,e=this.renderTarget1.clone(),e.setSize(this._width*this._pixelRatio,this._height*this._pixelRatio)}this.renderTarget1.dispose(),this.renderTarget2.dispose(),this.renderTarget1=e,this.renderTarget2=e.clone(),this.writeBuffer=this.renderTarget1,this.readBuffer=this.renderTarget2}setSize(e,t){this._width=e,this._height=t;const n=this._width*this._pixelRatio,s=this._height*this._pixelRatio;this.renderTarget1.setSize(n,s),this.renderTarget2.setSize(n,s);for(let r=0;r<this.passes.length;r++)this.passes[r].setSize(n,s)}setPixelRatio(e){this._pixelRatio=e,this.setSize(this._width,this._height)}dispose(){this.renderTarget1.dispose(),this.renderTarget2.dispose(),this.copyPass.dispose()}}class Nu extends kr{constructor(e,t,n,s,r){super(),this.scene=e,this.camera=t,this.overrideMaterial=n,this.clearColor=s,this.clearAlpha=r!==void 0?r:0,this.clear=!0,this.clearDepth=!1,this.needsSwap=!1,this._oldClearColor=new ut}render(e,t,n){const s=e.autoClear;e.autoClear=!1;let r,o;this.overrideMaterial!==void 0&&(o=this.scene.overrideMaterial,this.scene.overrideMaterial=this.overrideMaterial),this.clearColor&&(e.getClearColor(this._oldClearColor),r=e.getClearAlpha(),e.setClearColor(this.clearColor,this.clearAlpha)),this.clearDepth&&e.clearDepth(),e.setRenderTarget(this.renderToScreen?null:n),this.clear&&e.clear(e.autoClearColor,e.autoClearDepth,e.autoClearStencil),e.render(this.scene,this.camera),this.clearColor&&e.setClearColor(this._oldClearColor,r),this.overrideMaterial!==void 0&&(this.scene.overrideMaterial=o),e.autoClear=s}}const Q_=(i,e,t)=>{i.renderer=new Pu({powerPreference:"high-performance",canvas:e,antialias:!0,alpha:!0,...t}),i.composer=new K_(i.renderer),i.composer.addPass(new Nu(i.scene,di(i.camera)))},Il=(i,e,t)=>{!i.renderer||(e?i.renderer.outputEncoding=ui:i.renderer.outputEncoding=vt,t?i.renderer.toneMapping=Nn:i.renderer.toneMapping=ou)},Ul=(i,e,t)=>{var n,s,r,o,a,l,c,f;!i.renderer||!i.composer||((s=(n=i.renderer).setSize)==null||s.call(n,e.width,e.height),(o=(r=i.renderer).setPixelRatio)==null||o.call(r,t),(l=(a=i.composer).setSize)==null||l.call(a,e.width,e.height),(f=(c=i.composer).setPixelRatio)==null||f.call(c,t))},zl=(i,e,t)=>{!i.renderer||(i.renderer.shadowMap.enabled=e,i.renderer.shadowMap.type=t)},kn=i=>i.userData,J_=(i,e)=>{i.pointer.update(t=>i.renderer?t.set(e.offsetX/i.renderer.domElement.clientWidth*2-1,-(e.offsetY/i.renderer.domElement.clientHeight)*2+1):t)},Ou=(i,e,t,n)=>(i.raycaster.setFromCamera(e,t),i.raycaster.intersectObjects(n,!1)),$_=(i,e)=>i.object.uuid!==e.object.uuid||i.instanceId!==e.instanceId,e0=(i,e,t)=>{let n;const s=i.camera.subscribe(c=>n=c);wt(s);let r;const o=i.pointer.subscribe(c=>r=c);wt(o);let a;const l=c=>{var u,p;c.preventDefault();const f=c.type;i.pointerOverCanvas.set(!0),t.pointerInvalidated=!0,J_(i,c);const h=t0(e,r,n);if(f==="pointerdown"&&(a=h?{object:h.object,instanceId:h.instanceId}:null),f==="click"){if(!n0(h,a)){a=null;return}a=null}!h||(p=(u=kn(h.object)).eventDispatcher)==null||p.call(u,f,{...h,event:c})};return{onClick:l,onContextMenu:l,onPointerUp:l,onPointerDown:l,onPointerMove:l}};function t0(i,e,t){if(i.interactiveObjects.size===0||i.raycastableObjects.size===0)return null;const n=Ou(i,e,t,Array.from(i.raycastableObjects));return n.length===0||!i.interactiveObjects.has(n[0].object)?null:n[0]}function n0(i,e){return!i||!e?!1:i.object.uuid===e.object.uuid&&i.instanceId===e.instanceId}const i0=(i,e)=>{let t;const n=i.pointerOverCanvas.subscribe(c=>t=c);wt(n);let s;const r=i.camera.subscribe(c=>s=c);wt(r);let o;const a=i.pointer.subscribe(c=>o=c);return wt(a),{raycast:()=>{var h,u,p,g,v,m,d,M;if(e.interactiveObjects.size===0||e.raycastableObjects.size===0)return;const c=t?Ou(e,o,s,Array.from(e.raycastableObjects)):[],f=c.length&&e.interactiveObjects.has(c[0].object)?c[0]:null;f?e.lastIntersection?e.lastIntersection&&$_(e.lastIntersection,f)&&((m=(v=kn(e.lastIntersection.object)).eventDispatcher)==null||m.call(v,"pointerleave",e.lastIntersection),(M=(d=kn(f.object)).eventDispatcher)==null||M.call(d,"pointerenter",f)):(g=(p=kn(f.object)).eventDispatcher)==null||g.call(p,"pointerenter",f):e.lastIntersection&&((u=(h=kn(e.lastIntersection.object)).eventDispatcher)==null||u.call(h,"pointerleave",e.lastIntersection)),e.lastIntersection=f}}},Nr=typeof window!="undefined",s0=i=>{if(!Nr)return;let e;const t=()=>{i(),e=requestAnimationFrame(t)};t(),wt(()=>{!e||cancelAnimationFrame(e)})},r0=(i,e)=>{if(e.frameHandlers.size===0)return;if(e.debugFrameloop){let s=0;e.frameHandlers.forEach(r=>{r.debugFrameloopMessage?e.invalidations[r.debugFrameloopMessage]=r.debugFrameloopMessage in e.invalidations?e.invalidations[r.debugFrameloopMessage]+1:1:++s}),s>0&&(e.invalidations.onFrame=e.frameHandlers.size)}const t=Array.from(e.frameHandlers).reduce((s,r)=>r.order?!0:s,!1),n=i.clock.getDelta();t?Array.from(e.frameHandlers).sort((s,r)=>{var o,a;return((o=s.order)!=null?o:0)>((a=r.order)!=null?a:0)?1:-1}).forEach(s=>s.fn(i,n)):e.frameHandlers.forEach(s=>s.fn(i,n))},o0=i=>{!i.debugFrameloop||(i.frame+=1,console.log(`frame: ${i.frame}${Object.keys(i.invalidations).length>0?", requested by \u21B4":""}`),Object.keys(i.invalidations).length>0&&console.table(i.invalidations),i.invalidations={})},a0=(i,e,t,n)=>{let s=di(i.camera);const r=i.camera.subscribe(a=>s=a);wt(r);const{raycast:o}=i0(i,e);s0(()=>{n.dispose();const a=t.frameloop==="always"||t.frameloop==="demand"&&(t.frameInvalidated||t.frameHandlers.size>0)||t.frameloop==="never"&&t.advance;(a||t.pointerInvalidated)&&(o(),t.pointerInvalidated=!1),a&&(!s||!i.composer||!i.renderer||(r0(i,t),i.composer.passes.length>1?i.composer.render():i.renderer.render(i.scene,s),o0(t),t.frameInvalidated=!1,t.advance=!1))})},l0=()=>{const i=new _n(75,0,.1,1e3);return kn(i).threlteDefaultCamera=!0,i.position.z=5,i.lookAt(0,0,0),i},c0=i=>{const e=i.size.subscribe(t=>{kn(di(i.camera)).threlteDefaultCamera&&i.camera.update(n=>{const s=n;return s.aspect=t.width/t.height,s.updateProjectionMatrix(),i.invalidate("Default camera: aspect ratio changed"),s})});wt(e)},u0=(i,e,t,n,s,r,o)=>{const a={audioListeners:new Map,addAudioListener:(d,M)=>{if(M=M!=null?M:"default",a.audioListeners.has(M)){console.warn(`An AudioListener with the id "${M}" has already been added, aborting.`);return}a.audioListeners.set(M,d)},removeAudioListener:d=>{if(d=d!=null?d:"default",!a.audioListeners.has(d)){console.warn(`No AudioListener with the id "${d}" found, aborting.`);return}a.audioListeners.delete(d)},getAudioListener:d=>{if(d=d!=null?d:"default",!a.audioListeners.has(d)){console.warn(`No AudioListener with the id "${d}" found, aborting.`);return}return a.audioListeners.get(d)}},l={debugFrameloop:r,frameloop:o,frame:0,frameInvalidated:!0,pointerInvalidated:!0,invalidations:{},frameHandlers:new Set,advance:!1},c={size:Ef([n,s],([d,M])=>d||M),pointer:Je(new st),pointerOverCanvas:Je(!1),clock:new Uu,camera:Je(l0()),scene:new U_,renderer:void 0,composer:void 0,invalidate:d=>{l.frameInvalidated=!0,l.debugFrameloop&&d&&(l.invalidations[d]=l.invalidations[d]?l.invalidations[d]+1:1)},advance:()=>{l.advance=!0}},f={flat:Je(e),linear:Je(i),dpr:Je(t),setCamera:d=>{c.camera.set(d),c.composer&&(c.composer.passes.forEach(M=>{M instanceof Nu&&(M.camera=d)}),c.invalidate("Canvas: setting camera"))},raycastableObjects:new Set,interactiveObjects:new Set,raycaster:new zu,lastIntersection:null,addRaycastableObject:d=>{f.raycastableObjects.add(d)},removeRaycastableObject:d=>{f.raycastableObjects.delete(d)},addInteractiveObject:d=>{f.interactiveObjects.add(d)},removeInteractiveObject:d=>{f.interactiveObjects.delete(d)},addPass:d=>{!c.composer||(c.composer.addPass(d),c.invalidate("Canvas: adding pass"))},removePass:d=>{!c.composer||(c.composer.removePass(d),c.invalidate("Canvas: removing pass"))}},h={dispose:async(d=!1)=>{await ai(),!(!h.shouldDispose&&!d)&&(h.disposableObjects.forEach((M,b)=>{var x;(M===0||d)&&((x=b==null?void 0:b.dispose)==null||x.call(b),h.disposableObjects.delete(b))}),h.shouldDispose=!1)},collectDisposableObjects:(d,M)=>{const b=M!=null?M:[];return d&&((d==null?void 0:d.dispose)&&typeof d.dispose=="function"&&d.type!=="Scene"&&b.push(d),Object.entries(d).forEach(([x,y])=>{if(x==="parent"||x==="children"||typeof y!="object")return;const T=y;T!=null&&T.dispose&&h.collectDisposableObjects(T,b)})),b},addDisposableObjects:d=>{d.forEach(M=>{const b=h.disposableObjects.get(M);b?h.disposableObjects.set(M,b+1):h.disposableObjects.set(M,1)})},removeDisposableObjects:d=>{d.length!==0&&(d.forEach(M=>{const b=h.disposableObjects.get(M);b&&b>0&&h.disposableObjects.set(M,b-1)}),h.shouldDispose=!0)},disposableObjects:new Map,shouldDispose:!1};return Tn("threlte",c),Tn("threlte-root",f),Tn("threlte-render-context",l),Tn("threlte-audio-context",a),Tn("threlte-disposal-context",h),{ctx:c,rootCtx:f,renderCtx:l,audioCtx:a,disposalCtx:h,getCtx:()=>c,getRootCtx:()=>f,getRenderCtx:()=>l,getAudioCtx:()=>a,getDisposalCtx:()=>h}};function Or(i,e){const t=Je(i);let n=i;const s=t.subscribe(a=>n=a);return wt(s),{...t,set:a=>{if((a==null?void 0:a.uuid)===(n==null?void 0:n.uuid))return;const l=n;t.set(a),e==null||e(a,l)},update:a=>{const l=a(n);if((l==null?void 0:l.uuid)===(n==null?void 0:n.uuid))return;const c=n;t.set(l),e==null||e(l,c)}}}const Vn=()=>Fn("threlte");function f0(i){let e;const t=i[8].default,n=Gt(t,i,i[7],null);return{c(){n&&n.c()},m(s,r){n&&n.m(s,r),e=!0},p(s,[r]){n&&n.p&&(!e||r&128)&&Vt(n,t,s,s[7],e?Ht(t,s[7],r,null):Wt(s[7]),null)},i(s){e||(le(n,s),e=!0)},o(s){ue(n,s),e=!1},d(s){n&&n.d(s)}}}const h0=()=>({onChildMount:Fn("threlte-hierarchical-object-on-mount"),onChildDestroy:Fn("threlte-hierarchical-object-on-destroy")}),Fu=()=>Fn("threlte-hierarchical-parent-context");function d0(i,e,t){var d;let n,{$$slots:s={},$$scope:r}=e,{object:o=void 0}=e,{children:a=[]}=e,{onChildMount:l=void 0}=e;const c=M=>{a.push(M),t(1,a),l==null||l(M)};let{onChildDestroy:f=void 0}=e;const h=M=>{const b=a.findIndex(x=>x.uuid===M.uuid);b!==-1&&a.splice(b,1),t(1,a),f==null||f(M)},{invalidate:u}=Vn(),p=Fu();Be(i,p,M=>t(6,n=M));let{parent:g=n}=e;const v=h0();o&&((d=v.onChildMount)==null||d.call(v,o),u("HierarchicalObject: object added"));const m=Or(o,(M,b)=>{var x,y;b&&((x=v.onChildDestroy)==null||x.call(v,b),u("HierarchicalObject: object added")),M&&((y=v.onChildMount)==null||y.call(v,M),u("HierarchicalObject: object removed"))});return wt(()=>{var M;o&&((M=v.onChildDestroy)==null||M.call(v,o),u("HierarchicalObject: object removed"))}),Tn("threlte-hierarchical-object-on-mount",c),Tn("threlte-hierarchical-object-on-destroy",h),Tn("threlte-hierarchical-parent-context",m),i.$$set=M=>{"object"in M&&t(3,o=M.object),"children"in M&&t(1,a=M.children),"onChildMount"in M&&t(4,l=M.onChildMount),"onChildDestroy"in M&&t(5,f=M.onChildDestroy),"parent"in M&&t(2,g=M.parent),"$$scope"in M&&t(7,r=M.$$scope)},i.$$.update=()=>{i.$$.dirty&64&&t(2,g=n),i.$$.dirty&8&&m.set(o)},[p,a,g,o,l,f,n,r,s]}class p0 extends at{constructor(e){super(),ot(this,e,d0,f0,rt,{object:3,children:1,onChildMount:4,onChildDestroy:5,parent:2})}}function m0(i){let e;const t=i[1].default,n=Gt(t,i,i[4],null);return{c(){n&&n.c()},m(s,r){n&&n.m(s,r),e=!0},p(s,r){n&&n.p&&(!e||r&16)&&Vt(n,t,s,s[4],e?Ht(t,s[4],r,null):Wt(s[4]),null)},i(s){e||(le(n,s),e=!0)},o(s){ue(n,s),e=!1},d(s){n&&n.d(s)}}}function g0(i){let e,t;return e=new p0({props:{object:i[0],onChildMount:i[2],onChildDestroy:i[3],$$slots:{default:[m0]},$$scope:{ctx:i}}}),{c(){Fe(e.$$.fragment)},m(n,s){Ne(e,n,s),t=!0},p(n,[s]){const r={};s&1&&(r.object=n[0]),s&1&&(r.onChildMount=n[2]),s&1&&(r.onChildDestroy=n[3]),s&16&&(r.$$scope={dirty:s,ctx:n}),e.$set(r)},i(n){t||(le(e.$$.fragment,n),t=!0)},o(n){ue(e.$$.fragment,n),t=!1},d(n){Oe(e,n)}}}function _0(i,e,t){let{$$slots:n={},$$scope:s}=e,{object:r}=e;const o=l=>r.add(l),a=l=>r.remove(l);return i.$$set=l=>{"object"in l&&t(0,r=l.object),"$$scope"in l&&t(4,s=l.$$scope)},[r,n,o,a,s]}class ta extends at{constructor(e){super(),ot(this,e,_0,g0,rt,{object:0})}}const v0=()=>{const i=Je({width:0,height:0});let e={width:0,height:0};const t=i.subscribe(o=>e=o);wt(t);let n;const s=()=>{const o=e;if(!n||!n.parentElement)return;const{clientWidth:a,clientHeight:l}=n.parentElement;(a!==o.width||l!==o.height)&&i.set({width:a,height:l})},r=o=>{n=o,s(),window.addEventListener("resize",s)};return Nr?(wt(()=>{window.removeEventListener("resize",s)}),{parentSizeAction:r,parentSize:i}):{parentSize:i,parentSizeAction:r}};function kl(i){let e,t;return e=new ta({props:{object:i[0].scene,$$slots:{default:[b0]},$$scope:{ctx:i}}}),{c(){Fe(e.$$.fragment)},m(n,s){Ne(e,n,s),t=!0},p(n,s){const r={};s[1]&4&&(r.$$scope={dirty:s,ctx:n}),e.$set(r)},i(n){t||(le(e.$$.fragment,n),t=!0)},o(n){ue(e.$$.fragment,n),t=!1},d(n){Oe(e,n)}}}function b0(i){let e;const t=i[29].default,n=Gt(t,i,i[33],null);return{c(){n&&n.c()},m(s,r){n&&n.m(s,r),e=!0},p(s,r){n&&n.p&&(!e||r[1]&4)&&Vt(n,t,s,s[33],e?Ht(t,s[33],r,null):Wt(s[33]),null)},i(s){e||(le(n,s),e=!0)},o(s){ue(n,s),e=!1},d(s){n&&n.d(s)}}}function M0(i){let e,t,n,s,r=i[2]&&kl(i);return{c(){e=F("canvas"),r&&r.c(),I(e,"class","svelte-o3oskp")},m(o,a){Me(o,e,a),r&&r.m(e,null),i[30](e),t=!0,n||(s=[of(i[3].call(null,e)),he(e,"click",i[9]),he(e,"contextmenu",i[10]),he(e,"pointerup",i[13]),he(e,"pointerdown",i[11]),he(e,"pointermove",i[12]),he(e,"pointerenter",i[31]),he(e,"pointerleave",i[32])],n=!0)},p(o,a){o[2]?r?(r.p(o,a),a[0]&4&&le(r,1)):(r=kl(o),r.c(),le(r,1),r.m(e,null)):r&&(ln(),ue(r,1,1,()=>{r=null}),cn())},i(o){t||(le(r),t=!0)},o(o){ue(r),t=!1},d(o){o&&_e(e),r&&r.d(),i[30](null),n=!1,St(s)}}}const Nl=new Set;function x0(i,e,t){let n,s,r,o,{$$slots:a={},$$scope:l}=e,{dpr:c=Nr?window.devicePixelRatio:1}=e,{flat:f=!1}=e,{linear:h=!1}=e,{frameloop:u="demand"}=e,{debugFrameloop:p=!1}=e,{shadows:g=!0}=e,{shadowMapType:v=nu}=e,{size:m=void 0}=e,{rendererParameters:d=void 0}=e,M,b=!1;const x=Je(m),{parentSize:y,parentSizeAction:T}=v0(),L=u0(h,f,c,x,y,p,u),{getCtx:w,renderCtx:_,disposalCtx:S}=L,{ctx:B,rootCtx:k,audioCtx:C}=L;c0(B),Nl.add(B.invalidate),wt(()=>{Nl.delete(B.invalidate)});const{size:U,scene:N}=B;Be(i,U,H=>t(26,s=H));const{flat:j,linear:D,dpr:V}=k;Be(i,j,H=>t(27,r=H)),Be(i,D,H=>t(28,o=H)),Be(i,V,H=>t(25,n=H)),Tn("threlte-parent",Je(N)),Pr(()=>{!M||(Q_(B,M,d),Il(B,o,r),Ul(B,s,n),zl(B,g,v),t(2,b=!0))}),a0(B,k,_,S);const{onClick:W,onContextMenu:Q,onPointerDown:oe,onPointerMove:ee,onPointerUp:z}=e0(B,k,_);wt(()=>{S.dispose(!0)});function K(H){xn[H?"unshift":"push"](()=>{M=H,t(1,M)})}const pe=()=>w().pointerOverCanvas.set(!0),ae=()=>w().pointerOverCanvas.set(!1);return i.$$set=H=>{"dpr"in H&&t(14,c=H.dpr),"flat"in H&&t(15,f=H.flat),"linear"in H&&t(16,h=H.linear),"frameloop"in H&&t(17,u=H.frameloop),"debugFrameloop"in H&&t(18,p=H.debugFrameloop),"shadows"in H&&t(19,g=H.shadows),"shadowMapType"in H&&t(20,v=H.shadowMapType),"size"in H&&t(21,m=H.size),"rendererParameters"in H&&t(22,d=H.rendererParameters),"$$scope"in H&&t(33,l=H.$$scope)},i.$$.update=()=>{i.$$.dirty[0]&2097152&&x.set(m),i.$$.dirty[0]&65536&&bt(D,o=h,o),i.$$.dirty[0]&32768&&bt(j,r=f,r),i.$$.dirty[0]&16384&&bt(V,n=c,n),i.$$.dirty[0]&402653184&&Il(w(),o,r),i.$$.dirty[0]&100663296&&Ul(w(),s,n),i.$$.dirty[0]&1572864&&zl(w(),g,v)},[B,M,b,T,w,U,j,D,V,W,Q,oe,ee,z,c,f,h,u,p,g,v,m,d,k,C,n,s,r,o,a,K,pe,ae,l]}class Bu extends at{constructor(e){super(),ot(this,e,x0,M0,rt,{dpr:14,flat:15,linear:16,frameloop:17,debugFrameloop:18,shadows:19,shadowMapType:20,size:21,rendererParameters:22,ctx:0,rootCtx:23,audioCtx:24},null,[-1,-1])}get ctx(){return this.$$.ctx[0]}get rootCtx(){return this.$$.ctx[23]}get audioCtx(){return this.$$.ctx[24]}}const Gu=()=>Fn("threlte-root"),S0=()=>Fn("threlte-disposal-context");function y0(i){let e;const t=i[9].default,n=Gt(t,i,i[8],null);return{c(){n&&n.c()},m(s,r){n&&n.m(s,r),e=!0},p(s,[r]){n&&n.p&&(!e||r&256)&&Vt(n,t,s,s[8],e?Ht(t,s[8],r,null):Wt(s[8]),null)},i(s){e||(le(n,s),e=!0)},o(s){ue(n,s),e=!1},d(s){n&&n.d(s)}}}const Ol="threlte-disposable-object-context";function w0(i,e,t){var m;let n,s,{$$slots:r={},$$scope:o}=e;const{collectDisposableObjects:a,addDisposableObjects:l,removeDisposableObjects:c}=S0();let{object:f=void 0}=e,h=f,{dispose:u=void 0}=e;const p=Fn(Ol);Be(i,p,d=>t(7,s=d));const g=Je((m=u!=null?u:s)!=null?m:!0);Be(i,g,d=>t(6,n=d)),Tn(Ol,g);let v=n?a(f):[];return l(v),wt(()=>{c(v)}),i.$$set=d=>{"object"in d&&t(2,f=d.object),"dispose"in d&&t(3,u=d.dispose),"$$scope"in d&&t(8,o=d.$$scope)},i.$$.update=()=>{var d;i.$$.dirty&136&&g.set((d=u!=null?u:s)!=null?d:!0),i.$$.dirty&116&&f!==h&&(c(v),t(5,v=n?a(f):[]),l(v),t(4,h=f))},[p,g,f,u,h,v,n,s,o,r]}class na extends at{constructor(e){super(),ot(this,e,w0,y0,rt,{object:2,dispose:3})}}function E0(i,e,t){let n,s,{object:r}=e;const o=Or(r);Be(i,o,c=>t(4,s=c));const a=Fn("threlte-layers");Be(i,a,c=>t(3,n=c));const{invalidate:l}=Vn();return i.$$set=c=>{"object"in c&&t(2,r=c.object)},i.$$.update=()=>{if(i.$$.dirty&4&&o.set(r),i.$$.dirty&24){if(n==="all")s.layers.enableAll();else if(n==="none")s.layers.disableAll();else if(Array.isArray(n))for(let c=0;c<32;c+=1){const f=c;n.includes(f)?s.layers.enable(c):s.layers.disable(c)}else n!==void 0&&s.layers.set(n);l("LayerableObject")}},[o,a,r,n,s]}class Hu extends at{constructor(e){super(),ot(this,e,E0,null,rt,{object:2})}}const Vu=(i,e)=>{var a;if(!Nr)return{start:()=>{},stop:()=>{},started:eu(!1)};const t=Fn("threlte-render-context"),n={fn:i,order:e==null?void 0:e.order,debugFrameloopMessage:e==null?void 0:e.debugFrameloopMessage},s=Je(!1),r=()=>{t.frameHandlers.delete(n),s.set(!1)},o=()=>{t.frameHandlers.add(n),s.set(!0)};return((a=e==null?void 0:e.autostart)==null||a)&&o(),wt(()=>{r()}),{start:o,stop:r,started:{subscribe:s.subscribe}}},Wu=()=>{const i=Je(!1);return(async()=>{await ai(),i.set(!0)})(),i};function T0(i,e,t){let n,s,{object:r}=e,{position:o=void 0}=e,{scale:a=void 0}=e,{rotation:l=void 0}=e,{lookAt:c=void 0}=e;const f=new G,h=Lr(),{invalidate:u}=Vn(),p=Wu();Be(i,p,b=>t(8,s=b));const g=async()=>{s||await ai(),h("transform")},v=async()=>{u("TransformableObject: transformed"),await g()};kn(r).onTransform=v;const{start:m,stop:d}=Vu(async()=>{c&&!l&&c instanceof Ut&&(c.getWorldPosition(f),r.lookAt(f),await g())},{autostart:!1,debugFrameloopMessage:"TransformableObject: tracking object"}),M=Or(r);return Be(i,M,b=>t(7,n=b)),i.$$set=b=>{"object"in b&&t(2,r=b.object),"position"in b&&t(3,o=b.position),"scale"in b&&t(4,a=b.scale),"rotation"in b&&t(5,l=b.rotation),"lookAt"in b&&t(6,c=b.lookAt)},i.$$.update=()=>{var b,x,y,T,L,w,_,S,B,k,C,U,N;i.$$.dirty&4&&M.set(r),i.$$.dirty&232&&(o&&(n.position.set((b=o.x)!=null?b:0,(x=o.y)!=null?x:0,(y=o.z)!=null?y:0),v()),c&&!l&&(c instanceof Ut?m():(d(),n.lookAt((T=c.x)!=null?T:0,(L=c.y)!=null?L:0,(w=c.z)!=null?w:0),v())),c||d()),i.$$.dirty&144&&a&&(typeof a=="number"?n.scale.set(a,a,a):n.scale.set((_=a.x)!=null?_:1,(S=a.y)!=null?S:1,(B=a.z)!=null?B:1),v()),i.$$.dirty&160&&l&&(n.rotation.set((k=l.x)!=null?k:0,(C=l.y)!=null?C:0,(U=l.z)!=null?U:0,(N=l.order)!=null?N:"XYZ"),v())},[p,M,r,o,a,l,c,n]}class A0 extends at{constructor(e){super(),ot(this,e,T0,null,rt,{object:2,position:3,scale:4,rotation:5,lookAt:6})}}function C0(i,e,t){let n,s,r,{object:o}=e,{viewportAware:a=!1}=e;const l=Lr(),{camera:c,invalidate:f}=Vn();Be(i,c,T=>t(8,r=T));const h=new Yo,u=new Ct,p=T=>T.type==="Mesh",g=new G,v=()=>r?(u.multiplyMatrices(r.projectionMatrix,r.matrixWorldInverse),h.setFromProjectionMatrix(u),p(o)?h.intersectsObject(o):(o.getWorldPosition(g),h.containsPoint(g))):!0,m=Wu();Be(i,m,T=>t(7,s=T));let{inViewport:d=v()}=e;const M=async T=>{T?(s||await ai(),l("viewportenter",o)):(s||await ai(),l("viewportleave",o))},{start:b,stop:x,started:y}=Vu(()=>{const T=v();d===void 0?(t(3,d=v()),M(d)):T!==d&&(M(T),t(3,d=T))},{autostart:a,debugFrameloopMessage:"ViewportAwareObject: tracking viewport visibility"});return Be(i,y,T=>t(6,n=T)),f("ViewportAwareObject"),i.$$set=T=>{"object"in T&&t(4,o=T.object),"viewportAware"in T&&t(5,a=T.viewportAware),"inViewport"in T&&t(3,d=T.inViewport)},i.$$.update=()=>{i.$$.dirty&96&&(a&&!n?b():!a&&n&&x())},[c,m,y,d,o,a,n]}class P0 extends at{constructor(e){super(),ot(this,e,C0,null,rt,{object:4,viewportAware:5,inViewport:3})}}function L0(i){let e;const t=i[14].default,n=Gt(t,i,i[18],null);return{c(){n&&n.c()},m(s,r){n&&n.m(s,r),e=!0},p(s,r){n&&n.p&&(!e||r&262144)&&Vt(n,t,s,s[18],e?Ht(t,s[18],r,null):Wt(s[18]),null)},i(s){e||(le(n,s),e=!0)},o(s){ue(n,s),e=!1},d(s){n&&n.d(s)}}}function R0(i){let e,t;return e=new ta({props:{object:i[1],$$slots:{default:[L0]},$$scope:{ctx:i}}}),{c(){Fe(e.$$.fragment)},m(n,s){Ne(e,n,s),t=!0},p(n,s){const r={};s&2&&(r.object=n[1]),s&262144&&(r.$$scope={dirty:s,ctx:n}),e.$set(r)},i(n){t||(le(e.$$.fragment,n),t=!0)},o(n){ue(e.$$.fragment,n),t=!1},d(n){Oe(e,n)}}}function D0(i){let e,t,n,s,r,o,a,l,c;e=new Hu({props:{object:i[1]}}),n=new A0({props:{object:i[1],position:i[2],rotation:i[4],scale:i[3],lookAt:i[5]}}),r=new na({props:{object:i[1],dispose:i[7],$$slots:{default:[R0]},$$scope:{ctx:i}}});function f(u){i[15](u)}let h={object:i[1],viewportAware:i[6]};return i[0]!==void 0&&(h.inViewport=i[0]),a=new P0({props:h}),xn.push(()=>Vs(a,"inViewport",f)),a.$on("viewportenter",i[16]),a.$on("viewportleave",i[17]),{c(){Fe(e.$$.fragment),t=J(),Fe(n.$$.fragment),s=J(),Fe(r.$$.fragment),o=J(),Fe(a.$$.fragment)},m(u,p){Ne(e,u,p),Me(u,t,p),Ne(n,u,p),Me(u,s,p),Ne(r,u,p),Me(u,o,p),Ne(a,u,p),c=!0},p(u,[p]){const g={};p&2&&(g.object=u[1]),e.$set(g);const v={};p&2&&(v.object=u[1]),p&4&&(v.position=u[2]),p&16&&(v.rotation=u[4]),p&8&&(v.scale=u[3]),p&32&&(v.lookAt=u[5]),n.$set(v);const m={};p&2&&(m.object=u[1]),p&128&&(m.dispose=u[7]),p&262146&&(m.$$scope={dirty:p,ctx:u}),r.$set(m);const d={};p&2&&(d.object=u[1]),p&64&&(d.viewportAware=u[6]),!l&&p&1&&(l=!0,d.inViewport=u[0],Hs(()=>l=!1)),a.$set(d)},i(u){c||(le(e.$$.fragment,u),le(n.$$.fragment,u),le(r.$$.fragment,u),le(a.$$.fragment,u),c=!0)},o(u){ue(e.$$.fragment,u),ue(n.$$.fragment,u),ue(r.$$.fragment,u),ue(a.$$.fragment,u),c=!1},d(u){Oe(e,u),u&&_e(t),Oe(n,u),u&&_e(s),Oe(r,u),u&&_e(o),Oe(a,u)}}}function I0(i,e,t){let{$$slots:n={},$$scope:s}=e,{object:r}=e,{position:o=void 0}=e,{scale:a=void 0}=e,{rotation:l=void 0}=e,{lookAt:c=void 0}=e,{viewportAware:f=!1}=e,{inViewport:h=!1}=e,{castShadow:u=void 0}=e,{receiveShadow:p=void 0}=e,{frustumCulled:g=void 0}=e,{renderOrder:v=void 0}=e,{visible:m=void 0}=e,{dispose:d=void 0}=e,{userData:M=void 0}=e;const{invalidate:b}=Vn(),x=()=>r;function y(w){h=w,t(0,h)}function T(w){os.call(this,i,w)}function L(w){os.call(this,i,w)}return i.$$set=w=>{"object"in w&&t(1,r=w.object),"position"in w&&t(2,o=w.position),"scale"in w&&t(3,a=w.scale),"rotation"in w&&t(4,l=w.rotation),"lookAt"in w&&t(5,c=w.lookAt),"viewportAware"in w&&t(6,f=w.viewportAware),"inViewport"in w&&t(0,h=w.inViewport),"castShadow"in w&&t(8,u=w.castShadow),"receiveShadow"in w&&t(9,p=w.receiveShadow),"frustumCulled"in w&&t(10,g=w.frustumCulled),"renderOrder"in w&&t(11,v=w.renderOrder),"visible"in w&&t(12,m=w.visible),"dispose"in w&&t(7,d=w.dispose),"userData"in w&&t(13,M=w.userData),"$$scope"in w&&t(18,s=w.$$scope)},i.$$.update=()=>{i.$$.dirty&16128&&(m!==void 0&&(x().visible=m),u!==void 0&&(x().castShadow=u),p!==void 0&&(x().receiveShadow=p),g!==void 0&&(x().frustumCulled=g),v!==void 0&&(x().renderOrder=v),M!==void 0&&(x().userData={...x().userData,...M}),b("Object3DInstance: props changed"))},[h,r,o,a,l,c,f,d,u,p,g,v,m,M,n,y,T,L,s]}class U0 extends at{constructor(e){super(),ot(this,e,I0,D0,rt,{object:1,position:2,scale:3,rotation:4,lookAt:5,viewportAware:6,inViewport:0,castShadow:8,receiveShadow:9,frustumCulled:10,renderOrder:11,visible:12,dispose:7,userData:13})}}function z0(i){let e;const t=i[17].default,n=Gt(t,i,i[21],null);return{c(){n&&n.c()},m(s,r){n&&n.m(s,r),e=!0},p(s,r){n&&n.p&&(!e||r&2097152)&&Vt(n,t,s,s[21],e?Ht(t,s[21],r,null):Wt(s[21]),null)},i(s){e||(le(n,s),e=!0)},o(s){ue(n,s),e=!1},d(s){n&&n.d(s)}}}function k0(i){let e,t,n;function s(o){i[18](o)}let r={object:i[1],lookAt:i[5],castShadow:i[7],receiveShadow:i[8],frustumCulled:i[9],renderOrder:i[10],position:i[2],scale:i[3],rotation:i[4],viewportAware:i[6],visible:i[11],userData:i[12],dispose:i[13],$$slots:{default:[z0]},$$scope:{ctx:i}};return i[0]!==void 0&&(r.inViewport=i[0]),e=new U0({props:r}),xn.push(()=>Vs(e,"inViewport",s)),e.$on("viewportenter",i[19]),e.$on("viewportleave",i[20]),{c(){Fe(e.$$.fragment)},m(o,a){Ne(e,o,a),n=!0},p(o,[a]){const l={};a&2&&(l.object=o[1]),a&32&&(l.lookAt=o[5]),a&128&&(l.castShadow=o[7]),a&256&&(l.receiveShadow=o[8]),a&512&&(l.frustumCulled=o[9]),a&1024&&(l.renderOrder=o[10]),a&4&&(l.position=o[2]),a&8&&(l.scale=o[3]),a&16&&(l.rotation=o[4]),a&64&&(l.viewportAware=o[6]),a&2048&&(l.visible=o[11]),a&4096&&(l.userData=o[12]),a&8192&&(l.dispose=o[13]),a&2097152&&(l.$$scope={dirty:a,ctx:o}),!t&&a&1&&(t=!0,l.inViewport=o[0],Hs(()=>t=!1)),e.$set(l)},i(o){n||(le(e.$$.fragment,o),n=!0)},o(o){ue(e.$$.fragment,o),n=!1},d(o){Oe(e,o)}}}function N0(i,e,t){let n,{$$slots:s={},$$scope:r}=e,{camera:o}=e,{position:a=void 0}=e,{scale:l=void 0}=e,{rotation:c=void 0}=e,{lookAt:f=void 0}=e,{viewportAware:h=!1}=e,{inViewport:u=!1}=e,{castShadow:p=void 0}=e,{receiveShadow:g=void 0}=e,{frustumCulled:v=void 0}=e,{renderOrder:m=void 0}=e,{visible:d=void 0}=e,{userData:M=void 0}=e,{dispose:b=void 0}=e,{useCamera:x=!1}=e;const y=Or(o);Be(i,y,S=>t(16,n=S));const{setCamera:T}=Gu();function L(S){u=S,t(0,u)}function w(S){os.call(this,i,S)}function _(S){os.call(this,i,S)}return i.$$set=S=>{"camera"in S&&t(1,o=S.camera),"position"in S&&t(2,a=S.position),"scale"in S&&t(3,l=S.scale),"rotation"in S&&t(4,c=S.rotation),"lookAt"in S&&t(5,f=S.lookAt),"viewportAware"in S&&t(6,h=S.viewportAware),"inViewport"in S&&t(0,u=S.inViewport),"castShadow"in S&&t(7,p=S.castShadow),"receiveShadow"in S&&t(8,g=S.receiveShadow),"frustumCulled"in S&&t(9,v=S.frustumCulled),"renderOrder"in S&&t(10,m=S.renderOrder),"visible"in S&&t(11,d=S.visible),"userData"in S&&t(12,M=S.userData),"dispose"in S&&t(13,b=S.dispose),"useCamera"in S&&t(15,x=S.useCamera),"$$scope"in S&&t(21,r=S.$$scope)},i.$$.update=()=>{i.$$.dirty&2&&y.set(o),i.$$.dirty&98304&&x&&T(n)},[u,o,a,l,c,f,h,p,g,v,m,d,M,b,y,x,n,s,L,w,_,r]}class O0 extends at{constructor(e){super(),ot(this,e,N0,k0,rt,{camera:1,position:2,scale:3,rotation:4,lookAt:5,viewportAware:6,inViewport:0,castShadow:7,receiveShadow:8,frustumCulled:9,renderOrder:10,visible:11,userData:12,dispose:13,useCamera:15})}}function F0(i){let e;const t=i[20].default,n=Gt(t,i,i[24],null);return{c(){n&&n.c()},m(s,r){n&&n.m(s,r),e=!0},p(s,r){n&&n.p&&(!e||r&16777216)&&Vt(n,t,s,s[24],e?Ht(t,s[24],r,null):Wt(s[24]),null)},i(s){e||(le(n,s),e=!0)},o(s){ue(n,s),e=!1},d(s){n&&n.d(s)}}}function B0(i){let e,t,n;function s(o){i[21](o)}let r={camera:i[0],position:i[2],scale:i[3],rotation:i[4],castShadow:i[6],receiveShadow:i[7],frustumCulled:i[8],renderOrder:i[9],visible:i[10],userData:i[11],dispose:i[12],viewportAware:i[13],lookAt:i[5],useCamera:i[14],$$slots:{default:[F0]},$$scope:{ctx:i}};return i[1]!==void 0&&(r.inViewport=i[1]),e=new O0({props:r}),xn.push(()=>Vs(e,"inViewport",s)),e.$on("viewportenter",i[22]),e.$on("viewportleave",i[23]),{c(){Fe(e.$$.fragment)},m(o,a){Ne(e,o,a),n=!0},p(o,[a]){const l={};a&1&&(l.camera=o[0]),a&4&&(l.position=o[2]),a&8&&(l.scale=o[3]),a&16&&(l.rotation=o[4]),a&64&&(l.castShadow=o[6]),a&128&&(l.receiveShadow=o[7]),a&256&&(l.frustumCulled=o[8]),a&512&&(l.renderOrder=o[9]),a&1024&&(l.visible=o[10]),a&2048&&(l.userData=o[11]),a&4096&&(l.dispose=o[12]),a&8192&&(l.viewportAware=o[13]),a&32&&(l.lookAt=o[5]),a&16384&&(l.useCamera=o[14]),a&16777216&&(l.$$scope={dirty:a,ctx:o}),!t&&a&2&&(t=!0,l.inViewport=o[1],Hs(()=>t=!1)),e.$set(l)},i(o){n||(le(e.$$.fragment,o),n=!0)},o(o){ue(e.$$.fragment,o),n=!1},d(o){Oe(e,o)}}}function G0(i,e,t){let n,{$$slots:s={},$$scope:r}=e,{position:o=void 0}=e,{scale:a=void 0}=e,{rotation:l=void 0}=e,{lookAt:c=void 0}=e,{castShadow:f=void 0}=e,{receiveShadow:h=void 0}=e,{frustumCulled:u=void 0}=e,{renderOrder:p=void 0}=e,{visible:g=void 0}=e,{userData:v=void 0}=e,{dispose:m=void 0}=e,{viewportAware:d=!1}=e,{inViewport:M=!1}=e,{useCamera:b=!0}=e,{near:x=void 0}=e,{far:y=void 0}=e,{fov:T=void 0}=e;const{size:L,invalidate:w}=Vn();Be(i,L,C=>t(19,n=C));const _=new _n(T,n.width/n.height,x,y);function S(C){M=C,t(1,M)}function B(C){os.call(this,i,C)}function k(C){os.call(this,i,C)}return i.$$set=C=>{"position"in C&&t(2,o=C.position),"scale"in C&&t(3,a=C.scale),"rotation"in C&&t(4,l=C.rotation),"lookAt"in C&&t(5,c=C.lookAt),"castShadow"in C&&t(6,f=C.castShadow),"receiveShadow"in C&&t(7,h=C.receiveShadow),"frustumCulled"in C&&t(8,u=C.frustumCulled),"renderOrder"in C&&t(9,p=C.renderOrder),"visible"in C&&t(10,g=C.visible),"userData"in C&&t(11,v=C.userData),"dispose"in C&&t(12,m=C.dispose),"viewportAware"in C&&t(13,d=C.viewportAware),"inViewport"in C&&t(1,M=C.inViewport),"useCamera"in C&&t(14,b=C.useCamera),"near"in C&&t(16,x=C.near),"far"in C&&t(17,y=C.far),"fov"in C&&t(18,T=C.fov),"$$scope"in C&&t(24,r=C.$$scope)},i.$$.update=()=>{i.$$.dirty&524289&&(t(0,_.aspect=n.width/n.height,_),_.updateProjectionMatrix(),w("PerspectiveCamera: aspect changed")),i.$$.dirty&458753&&(x!==void 0&&t(0,_.near=x,_),y!==void 0&&t(0,_.far=y,_),T!==void 0&&t(0,_.fov=T,_),_.updateProjectionMatrix(),w("PerspectiveCamera: props changed"))},[_,M,o,a,l,c,f,h,u,p,g,v,m,d,b,L,x,y,T,n,s,S,B,k,r]}class ju extends at{constructor(e){super(),ot(this,e,G0,B0,rt,{position:2,scale:3,rotation:4,lookAt:5,castShadow:6,receiveShadow:7,frustumCulled:8,renderOrder:9,visible:10,userData:11,dispose:12,viewportAware:13,inViewport:1,useCamera:14,near:16,far:17,fov:18,camera:0})}get camera(){return this.$$.ctx[0]}}const Fl=[],H0=(i,e)=>{const t=Fl.find(s=>s instanceof i);if(t)return t;const n=e();return Fl.push(n),n},xi=new zu,an=new G,ri=new G,yt=new en,Bl={X:new G(1,0,0),Y:new G(0,1,0),Z:new G(0,0,1)},yo={type:"change"},Gl={type:"mouseDown"},Hl={type:"mouseUp",mode:null},Vl={type:"objectChange"};class V0 extends Ut{constructor(e,t){super(),t===void 0&&(console.warn('THREE.TransformControls: The second parameter "domElement" is now mandatory.'),t=document),this.isTransformControls=!0,this.visible=!1,this.domElement=t,this.domElement.style.touchAction="none";const n=new Z0;this._gizmo=n,this.add(n);const s=new K0;this._plane=s,this.add(s);const r=this;function o(M,b){let x=b;Object.defineProperty(r,M,{get:function(){return x!==void 0?x:b},set:function(y){x!==y&&(x=y,s[M]=y,n[M]=y,r.dispatchEvent({type:M+"-changed",value:y}),r.dispatchEvent(yo))}}),r[M]=b,s[M]=b,n[M]=b}o("camera",e),o("object",void 0),o("enabled",!0),o("axis",null),o("mode","translate"),o("translationSnap",null),o("rotationSnap",null),o("scaleSnap",null),o("space","world"),o("size",1),o("dragging",!1),o("showX",!0),o("showY",!0),o("showZ",!0);const a=new G,l=new G,c=new en,f=new en,h=new G,u=new en,p=new G,g=new G,v=new G,m=0,d=new G;o("worldPosition",a),o("worldPositionStart",l),o("worldQuaternion",c),o("worldQuaternionStart",f),o("cameraPosition",h),o("cameraQuaternion",u),o("pointStart",p),o("pointEnd",g),o("rotationAxis",v),o("rotationAngle",m),o("eye",d),this._offset=new G,this._startNorm=new G,this._endNorm=new G,this._cameraScale=new G,this._parentPosition=new G,this._parentQuaternion=new en,this._parentQuaternionInv=new en,this._parentScale=new G,this._worldScaleStart=new G,this._worldQuaternionInv=new en,this._worldScale=new G,this._positionStart=new G,this._quaternionStart=new en,this._scaleStart=new G,this._getPointer=W0.bind(this),this._onPointerDown=X0.bind(this),this._onPointerHover=j0.bind(this),this._onPointerMove=q0.bind(this),this._onPointerUp=Y0.bind(this),this.domElement.addEventListener("pointerdown",this._onPointerDown),this.domElement.addEventListener("pointermove",this._onPointerHover),this.domElement.addEventListener("pointerup",this._onPointerUp)}updateMatrixWorld(){this.object!==void 0&&(this.object.updateMatrixWorld(),this.object.parent===null?console.error("TransformControls: The attached 3D object must be a part of the scene graph."):this.object.parent.matrixWorld.decompose(this._parentPosition,this._parentQuaternion,this._parentScale),this.object.matrixWorld.decompose(this.worldPosition,this.worldQuaternion,this._worldScale),this._parentQuaternionInv.copy(this._parentQuaternion).invert(),this._worldQuaternionInv.copy(this.worldQuaternion).invert()),this.camera.updateMatrixWorld(),this.camera.matrixWorld.decompose(this.cameraPosition,this.cameraQuaternion,this._cameraScale),this.camera.isOrthographicCamera?this.camera.getWorldDirection(this.eye).negate():this.eye.copy(this.cameraPosition).sub(this.worldPosition).normalize(),super.updateMatrixWorld(this)}pointerHover(e){if(this.object===void 0||this.dragging===!0)return;xi.setFromCamera(e,this.camera);const t=wo(this._gizmo.picker[this.mode],xi);t?this.axis=t.object.name:this.axis=null}pointerDown(e){if(!(this.object===void 0||this.dragging===!0||e.button!==0)&&this.axis!==null){xi.setFromCamera(e,this.camera);const t=wo(this._plane,xi,!0);t&&(this.object.updateMatrixWorld(),this.object.parent.updateMatrixWorld(),this._positionStart.copy(this.object.position),this._quaternionStart.copy(this.object.quaternion),this._scaleStart.copy(this.object.scale),this.object.matrixWorld.decompose(this.worldPositionStart,this.worldQuaternionStart,this._worldScaleStart),this.pointStart.copy(t.point).sub(this.worldPositionStart)),this.dragging=!0,Gl.mode=this.mode,this.dispatchEvent(Gl)}}pointerMove(e){const t=this.axis,n=this.mode,s=this.object;let r=this.space;if(n==="scale"?r="local":(t==="E"||t==="XYZE"||t==="XYZ")&&(r="world"),s===void 0||t===null||this.dragging===!1||e.button!==-1)return;xi.setFromCamera(e,this.camera);const o=wo(this._plane,xi,!0);if(!!o){if(this.pointEnd.copy(o.point).sub(this.worldPositionStart),n==="translate")this._offset.copy(this.pointEnd).sub(this.pointStart),r==="local"&&t!=="XYZ"&&this._offset.applyQuaternion(this._worldQuaternionInv),t.indexOf("X")===-1&&(this._offset.x=0),t.indexOf("Y")===-1&&(this._offset.y=0),t.indexOf("Z")===-1&&(this._offset.z=0),r==="local"&&t!=="XYZ"?this._offset.applyQuaternion(this._quaternionStart).divide(this._parentScale):this._offset.applyQuaternion(this._parentQuaternionInv).divide(this._parentScale),s.position.copy(this._offset).add(this._positionStart),this.translationSnap&&(r==="local"&&(s.position.applyQuaternion(yt.copy(this._quaternionStart).invert()),t.search("X")!==-1&&(s.position.x=Math.round(s.position.x/this.translationSnap)*this.translationSnap),t.search("Y")!==-1&&(s.position.y=Math.round(s.position.y/this.translationSnap)*this.translationSnap),t.search("Z")!==-1&&(s.position.z=Math.round(s.position.z/this.translationSnap)*this.translationSnap),s.position.applyQuaternion(this._quaternionStart)),r==="world"&&(s.parent&&s.position.add(an.setFromMatrixPosition(s.parent.matrixWorld)),t.search("X")!==-1&&(s.position.x=Math.round(s.position.x/this.translationSnap)*this.translationSnap),t.search("Y")!==-1&&(s.position.y=Math.round(s.position.y/this.translationSnap)*this.translationSnap),t.search("Z")!==-1&&(s.position.z=Math.round(s.position.z/this.translationSnap)*this.translationSnap),s.parent&&s.position.sub(an.setFromMatrixPosition(s.parent.matrixWorld))));else if(n==="scale"){if(t.search("XYZ")!==-1){let a=this.pointEnd.length()/this.pointStart.length();this.pointEnd.dot(this.pointStart)<0&&(a*=-1),ri.set(a,a,a)}else an.copy(this.pointStart),ri.copy(this.pointEnd),an.applyQuaternion(this._worldQuaternionInv),ri.applyQuaternion(this._worldQuaternionInv),ri.divide(an),t.search("X")===-1&&(ri.x=1),t.search("Y")===-1&&(ri.y=1),t.search("Z")===-1&&(ri.z=1);s.scale.copy(this._scaleStart).multiply(ri),this.scaleSnap&&(t.search("X")!==-1&&(s.scale.x=Math.round(s.scale.x/this.scaleSnap)*this.scaleSnap||this.scaleSnap),t.search("Y")!==-1&&(s.scale.y=Math.round(s.scale.y/this.scaleSnap)*this.scaleSnap||this.scaleSnap),t.search("Z")!==-1&&(s.scale.z=Math.round(s.scale.z/this.scaleSnap)*this.scaleSnap||this.scaleSnap))}else if(n==="rotate"){this._offset.copy(this.pointEnd).sub(this.pointStart);const a=20/this.worldPosition.distanceTo(an.setFromMatrixPosition(this.camera.matrixWorld));t==="E"?(this.rotationAxis.copy(this.eye),this.rotationAngle=this.pointEnd.angleTo(this.pointStart),this._startNorm.copy(this.pointStart).normalize(),this._endNorm.copy(this.pointEnd).normalize(),this.rotationAngle*=this._endNorm.cross(this._startNorm).dot(this.eye)<0?1:-1):t==="XYZE"?(this.rotationAxis.copy(this._offset).cross(this.eye).normalize(),this.rotationAngle=this._offset.dot(an.copy(this.rotationAxis).cross(this.eye))*a):(t==="X"||t==="Y"||t==="Z")&&(this.rotationAxis.copy(Bl[t]),an.copy(Bl[t]),r==="local"&&an.applyQuaternion(this.worldQuaternion),this.rotationAngle=this._offset.dot(an.cross(this.eye).normalize())*a),this.rotationSnap&&(this.rotationAngle=Math.round(this.rotationAngle/this.rotationSnap)*this.rotationSnap),r==="local"&&t!=="E"&&t!=="XYZE"?(s.quaternion.copy(this._quaternionStart),s.quaternion.multiply(yt.setFromAxisAngle(this.rotationAxis,this.rotationAngle)).normalize()):(this.rotationAxis.applyQuaternion(this._parentQuaternionInv),s.quaternion.copy(yt.setFromAxisAngle(this.rotationAxis,this.rotationAngle)),s.quaternion.multiply(this._quaternionStart).normalize())}this.dispatchEvent(yo),this.dispatchEvent(Vl)}}pointerUp(e){e.button===0&&(this.dragging&&this.axis!==null&&(Hl.mode=this.mode,this.dispatchEvent(Hl)),this.dragging=!1,this.axis=null)}dispose(){this.domElement.removeEventListener("pointerdown",this._onPointerDown),this.domElement.removeEventListener("pointermove",this._onPointerHover),this.domElement.removeEventListener("pointermove",this._onPointerMove),this.domElement.removeEventListener("pointerup",this._onPointerUp),this.traverse(function(e){e.geometry&&e.geometry.dispose(),e.material&&e.material.dispose()})}attach(e){return this.object=e,this.visible=!0,this}detach(){return this.object=void 0,this.visible=!1,this.axis=null,this}reset(){!this.enabled||this.dragging&&(this.object.position.copy(this._positionStart),this.object.quaternion.copy(this._quaternionStart),this.object.scale.copy(this._scaleStart),this.dispatchEvent(yo),this.dispatchEvent(Vl),this.pointStart.copy(this.pointEnd))}getRaycaster(){return xi}getMode(){return this.mode}setMode(e){this.mode=e}setTranslationSnap(e){this.translationSnap=e}setRotationSnap(e){this.rotationSnap=e}setScaleSnap(e){this.scaleSnap=e}setSize(e){this.size=e}setSpace(e){this.space=e}}function W0(i){if(this.domElement.ownerDocument.pointerLockElement)return{x:0,y:0,button:i.button};{const e=this.domElement.getBoundingClientRect();return{x:(i.clientX-e.left)/e.width*2-1,y:-(i.clientY-e.top)/e.height*2+1,button:i.button}}}function j0(i){if(!!this.enabled)switch(i.pointerType){case"mouse":case"pen":this.pointerHover(this._getPointer(i));break}}function X0(i){!this.enabled||(document.pointerLockElement||this.domElement.setPointerCapture(i.pointerId),this.domElement.addEventListener("pointermove",this._onPointerMove),this.pointerHover(this._getPointer(i)),this.pointerDown(this._getPointer(i)))}function q0(i){!this.enabled||this.pointerMove(this._getPointer(i))}function Y0(i){!this.enabled||(this.domElement.releasePointerCapture(i.pointerId),this.domElement.removeEventListener("pointermove",this._onPointerMove),this.pointerUp(this._getPointer(i)))}function wo(i,e,t){const n=e.intersectObject(i,!0);for(let s=0;s<n.length;s++)if(n[s].object.visible||t)return n[s];return!1}const gr=new mi,pt=new G(0,1,0),Wl=new G(0,0,0),jl=new Ct,_r=new en,yr=new en,Dn=new G,Xl=new Ct,Ps=new G(1,0,0),wi=new G(0,1,0),Ls=new G(0,0,1),vr=new G,ws=new G,Es=new G;class Z0 extends Ut{constructor(){super(),this.isTransformControlsGizmo=!0,this.type="TransformControlsGizmo";const e=new Ir({depthTest:!1,depthWrite:!1,fog:!1,toneMapped:!1,transparent:!0}),t=new Lu({depthTest:!1,depthWrite:!1,fog:!1,toneMapped:!1,transparent:!0}),n=e.clone();n.opacity=.15;const s=t.clone();s.opacity=.5;const r=e.clone();r.color.setHex(16711680);const o=e.clone();o.color.setHex(65280);const a=e.clone();a.color.setHex(255);const l=e.clone();l.color.setHex(16711680),l.opacity=.5;const c=e.clone();c.color.setHex(65280),c.opacity=.5;const f=e.clone();f.color.setHex(255),f.opacity=.5;const h=e.clone();h.opacity=.25;const u=e.clone();u.color.setHex(16776960),u.opacity=.25,e.clone().color.setHex(16776960);const g=e.clone();g.color.setHex(7895160);const v=new Kt(0,.04,.1,12);v.translate(0,.05,0);const m=new At(.08,.08,.08);m.translate(0,.04,0);const d=new sn;d.setAttribute("position",new Et([0,0,0,1,0,0],3));const M=new Kt(.0075,.0075,.5,3);M.translate(0,.25,0);function b(N,j){const D=new Ti(N,.0075,3,64,j*Math.PI*2);return D.rotateY(Math.PI/2),D.rotateX(Math.PI/2),D}function x(){const N=new sn;return N.setAttribute("position",new Et([0,0,0,1,1,1],3)),N}const y={X:[[new Ee(v,r),[.5,0,0],[0,0,-Math.PI/2]],[new Ee(v,r),[-.5,0,0],[0,0,Math.PI/2]],[new Ee(M,r),[0,0,0],[0,0,-Math.PI/2]]],Y:[[new Ee(v,o),[0,.5,0]],[new Ee(v,o),[0,-.5,0],[Math.PI,0,0]],[new Ee(M,o)]],Z:[[new Ee(v,a),[0,0,.5],[Math.PI/2,0,0]],[new Ee(v,a),[0,0,-.5],[-Math.PI/2,0,0]],[new Ee(M,a),null,[Math.PI/2,0,0]]],XYZ:[[new Ee(new es(.1,0),h.clone()),[0,0,0]]],XY:[[new Ee(new At(.15,.15,.01),f.clone()),[.15,.15,0]]],YZ:[[new Ee(new At(.15,.15,.01),l.clone()),[0,.15,.15],[0,Math.PI/2,0]]],XZ:[[new Ee(new At(.15,.15,.01),c.clone()),[.15,0,.15],[-Math.PI/2,0,0]]]},T={X:[[new Ee(new Kt(.2,0,.6,4),n),[.3,0,0],[0,0,-Math.PI/2]],[new Ee(new Kt(.2,0,.6,4),n),[-.3,0,0],[0,0,Math.PI/2]]],Y:[[new Ee(new Kt(.2,0,.6,4),n),[0,.3,0]],[new Ee(new Kt(.2,0,.6,4),n),[0,-.3,0],[0,0,Math.PI]]],Z:[[new Ee(new Kt(.2,0,.6,4),n),[0,0,.3],[Math.PI/2,0,0]],[new Ee(new Kt(.2,0,.6,4),n),[0,0,-.3],[-Math.PI/2,0,0]]],XYZ:[[new Ee(new es(.2,0),n)]],XY:[[new Ee(new At(.2,.2,.01),n),[.15,.15,0]]],YZ:[[new Ee(new At(.2,.2,.01),n),[0,.15,.15],[0,Math.PI/2,0]]],XZ:[[new Ee(new At(.2,.2,.01),n),[.15,0,.15],[-Math.PI/2,0,0]]]},L={START:[[new Ee(new es(.01,2),s),null,null,null,"helper"]],END:[[new Ee(new es(.01,2),s),null,null,null,"helper"]],DELTA:[[new si(x(),s),null,null,null,"helper"]],X:[[new si(d,s.clone()),[-1e3,0,0],null,[1e6,1,1],"helper"]],Y:[[new si(d,s.clone()),[0,-1e3,0],[0,0,Math.PI/2],[1e6,1,1],"helper"]],Z:[[new si(d,s.clone()),[0,0,-1e3],[0,-Math.PI/2,0],[1e6,1,1],"helper"]]},w={XYZE:[[new Ee(b(.5,1),g),null,[0,Math.PI/2,0]]],X:[[new Ee(b(.5,.5),r)]],Y:[[new Ee(b(.5,.5),o),null,[0,0,-Math.PI/2]]],Z:[[new Ee(b(.5,.5),a),null,[0,Math.PI/2,0]]],E:[[new Ee(b(.75,1),u),null,[0,Math.PI/2,0]]]},_={AXIS:[[new si(d,s.clone()),[-1e3,0,0],null,[1e6,1,1],"helper"]]},S={XYZE:[[new Ee(new Qo(.25,10,8),n)]],X:[[new Ee(new Ti(.5,.1,4,24),n),[0,0,0],[0,-Math.PI/2,-Math.PI/2]]],Y:[[new Ee(new Ti(.5,.1,4,24),n),[0,0,0],[Math.PI/2,0,0]]],Z:[[new Ee(new Ti(.5,.1,4,24),n),[0,0,0],[0,0,-Math.PI/2]]],E:[[new Ee(new Ti(.75,.1,2,24),n)]]},B={X:[[new Ee(m,r),[.5,0,0],[0,0,-Math.PI/2]],[new Ee(M,r),[0,0,0],[0,0,-Math.PI/2]],[new Ee(m,r),[-.5,0,0],[0,0,Math.PI/2]]],Y:[[new Ee(m,o),[0,.5,0]],[new Ee(M,o)],[new Ee(m,o),[0,-.5,0],[0,0,Math.PI]]],Z:[[new Ee(m,a),[0,0,.5],[Math.PI/2,0,0]],[new Ee(M,a),[0,0,0],[Math.PI/2,0,0]],[new Ee(m,a),[0,0,-.5],[-Math.PI/2,0,0]]],XY:[[new Ee(new At(.15,.15,.01),f),[.15,.15,0]]],YZ:[[new Ee(new At(.15,.15,.01),l),[0,.15,.15],[0,Math.PI/2,0]]],XZ:[[new Ee(new At(.15,.15,.01),c),[.15,0,.15],[-Math.PI/2,0,0]]],XYZ:[[new Ee(new At(.1,.1,.1),h.clone())]]},k={X:[[new Ee(new Kt(.2,0,.6,4),n),[.3,0,0],[0,0,-Math.PI/2]],[new Ee(new Kt(.2,0,.6,4),n),[-.3,0,0],[0,0,Math.PI/2]]],Y:[[new Ee(new Kt(.2,0,.6,4),n),[0,.3,0]],[new Ee(new Kt(.2,0,.6,4),n),[0,-.3,0],[0,0,Math.PI]]],Z:[[new Ee(new Kt(.2,0,.6,4),n),[0,0,.3],[Math.PI/2,0,0]],[new Ee(new Kt(.2,0,.6,4),n),[0,0,-.3],[-Math.PI/2,0,0]]],XY:[[new Ee(new At(.2,.2,.01),n),[.15,.15,0]]],YZ:[[new Ee(new At(.2,.2,.01),n),[0,.15,.15],[0,Math.PI/2,0]]],XZ:[[new Ee(new At(.2,.2,.01),n),[.15,0,.15],[-Math.PI/2,0,0]]],XYZ:[[new Ee(new At(.2,.2,.2),n),[0,0,0]]]},C={X:[[new si(d,s.clone()),[-1e3,0,0],null,[1e6,1,1],"helper"]],Y:[[new si(d,s.clone()),[0,-1e3,0],[0,0,Math.PI/2],[1e6,1,1],"helper"]],Z:[[new si(d,s.clone()),[0,0,-1e3],[0,-Math.PI/2,0],[1e6,1,1],"helper"]]};function U(N){const j=new Ut;for(const D in N)for(let V=N[D].length;V--;){const W=N[D][V][0].clone(),Q=N[D][V][1],oe=N[D][V][2],ee=N[D][V][3],z=N[D][V][4];W.name=D,W.tag=z,Q&&W.position.set(Q[0],Q[1],Q[2]),oe&&W.rotation.set(oe[0],oe[1],oe[2]),ee&&W.scale.set(ee[0],ee[1],ee[2]),W.updateMatrix();const K=W.geometry.clone();K.applyMatrix4(W.matrix),W.geometry=K,W.renderOrder=1/0,W.position.set(0,0,0),W.rotation.set(0,0,0),W.scale.set(1,1,1),j.add(W)}return j}this.gizmo={},this.picker={},this.helper={},this.add(this.gizmo.translate=U(y)),this.add(this.gizmo.rotate=U(w)),this.add(this.gizmo.scale=U(B)),this.add(this.picker.translate=U(T)),this.add(this.picker.rotate=U(S)),this.add(this.picker.scale=U(k)),this.add(this.helper.translate=U(L)),this.add(this.helper.rotate=U(_)),this.add(this.helper.scale=U(C)),this.picker.translate.visible=!1,this.picker.rotate.visible=!1,this.picker.scale.visible=!1}updateMatrixWorld(e){const n=(this.mode==="scale"?"local":this.space)==="local"?this.worldQuaternion:yr;this.gizmo.translate.visible=this.mode==="translate",this.gizmo.rotate.visible=this.mode==="rotate",this.gizmo.scale.visible=this.mode==="scale",this.helper.translate.visible=this.mode==="translate",this.helper.rotate.visible=this.mode==="rotate",this.helper.scale.visible=this.mode==="scale";let s=[];s=s.concat(this.picker[this.mode].children),s=s.concat(this.gizmo[this.mode].children),s=s.concat(this.helper[this.mode].children);for(let r=0;r<s.length;r++){const o=s[r];o.visible=!0,o.rotation.set(0,0,0),o.position.copy(this.worldPosition);let a;if(this.camera.isOrthographicCamera?a=(this.camera.top-this.camera.bottom)/this.camera.zoom:a=this.worldPosition.distanceTo(this.cameraPosition)*Math.min(1.9*Math.tan(Math.PI*this.camera.fov/360)/this.camera.zoom,7),o.scale.set(1,1,1).multiplyScalar(a*this.size/4),o.tag==="helper"){o.visible=!1,o.name==="AXIS"?(o.visible=!!this.axis,this.axis==="X"&&(yt.setFromEuler(gr.set(0,0,0)),o.quaternion.copy(n).multiply(yt),Math.abs(pt.copy(Ps).applyQuaternion(n).dot(this.eye))>.9&&(o.visible=!1)),this.axis==="Y"&&(yt.setFromEuler(gr.set(0,0,Math.PI/2)),o.quaternion.copy(n).multiply(yt),Math.abs(pt.copy(wi).applyQuaternion(n).dot(this.eye))>.9&&(o.visible=!1)),this.axis==="Z"&&(yt.setFromEuler(gr.set(0,Math.PI/2,0)),o.quaternion.copy(n).multiply(yt),Math.abs(pt.copy(Ls).applyQuaternion(n).dot(this.eye))>.9&&(o.visible=!1)),this.axis==="XYZE"&&(yt.setFromEuler(gr.set(0,Math.PI/2,0)),pt.copy(this.rotationAxis),o.quaternion.setFromRotationMatrix(jl.lookAt(Wl,pt,wi)),o.quaternion.multiply(yt),o.visible=this.dragging),this.axis==="E"&&(o.visible=!1)):o.name==="START"?(o.position.copy(this.worldPositionStart),o.visible=this.dragging):o.name==="END"?(o.position.copy(this.worldPosition),o.visible=this.dragging):o.name==="DELTA"?(o.position.copy(this.worldPositionStart),o.quaternion.copy(this.worldQuaternionStart),an.set(1e-10,1e-10,1e-10).add(this.worldPositionStart).sub(this.worldPosition).multiplyScalar(-1),an.applyQuaternion(this.worldQuaternionStart.clone().invert()),o.scale.copy(an),o.visible=this.dragging):(o.quaternion.copy(n),this.dragging?o.position.copy(this.worldPositionStart):o.position.copy(this.worldPosition),this.axis&&(o.visible=this.axis.search(o.name)!==-1));continue}o.quaternion.copy(n),this.mode==="translate"||this.mode==="scale"?(o.name==="X"&&Math.abs(pt.copy(Ps).applyQuaternion(n).dot(this.eye))>.99&&(o.scale.set(1e-10,1e-10,1e-10),o.visible=!1),o.name==="Y"&&Math.abs(pt.copy(wi).applyQuaternion(n).dot(this.eye))>.99&&(o.scale.set(1e-10,1e-10,1e-10),o.visible=!1),o.name==="Z"&&Math.abs(pt.copy(Ls).applyQuaternion(n).dot(this.eye))>.99&&(o.scale.set(1e-10,1e-10,1e-10),o.visible=!1),o.name==="XY"&&Math.abs(pt.copy(Ls).applyQuaternion(n).dot(this.eye))<.2&&(o.scale.set(1e-10,1e-10,1e-10),o.visible=!1),o.name==="YZ"&&Math.abs(pt.copy(Ps).applyQuaternion(n).dot(this.eye))<.2&&(o.scale.set(1e-10,1e-10,1e-10),o.visible=!1),o.name==="XZ"&&Math.abs(pt.copy(wi).applyQuaternion(n).dot(this.eye))<.2&&(o.scale.set(1e-10,1e-10,1e-10),o.visible=!1)):this.mode==="rotate"&&(_r.copy(n),pt.copy(this.eye).applyQuaternion(yt.copy(n).invert()),o.name.search("E")!==-1&&o.quaternion.setFromRotationMatrix(jl.lookAt(this.eye,Wl,wi)),o.name==="X"&&(yt.setFromAxisAngle(Ps,Math.atan2(-pt.y,pt.z)),yt.multiplyQuaternions(_r,yt),o.quaternion.copy(yt)),o.name==="Y"&&(yt.setFromAxisAngle(wi,Math.atan2(pt.x,pt.z)),yt.multiplyQuaternions(_r,yt),o.quaternion.copy(yt)),o.name==="Z"&&(yt.setFromAxisAngle(Ls,Math.atan2(pt.y,pt.x)),yt.multiplyQuaternions(_r,yt),o.quaternion.copy(yt))),o.visible=o.visible&&(o.name.indexOf("X")===-1||this.showX),o.visible=o.visible&&(o.name.indexOf("Y")===-1||this.showY),o.visible=o.visible&&(o.name.indexOf("Z")===-1||this.showZ),o.visible=o.visible&&(o.name.indexOf("E")===-1||this.showX&&this.showY&&this.showZ),o.material._color=o.material._color||o.material.color.clone(),o.material._opacity=o.material._opacity||o.material.opacity,o.material.color.copy(o.material._color),o.material.opacity=o.material._opacity,this.enabled&&this.axis&&(o.name===this.axis||this.axis.split("").some(function(l){return o.name===l}))&&(o.material.color.setHex(16776960),o.material.opacity=1)}super.updateMatrixWorld(e)}}class K0 extends Ee{constructor(){super(new Ur(1e5,1e5,2,2),new Ir({visible:!1,wireframe:!0,side:zn,transparent:!0,opacity:.1,toneMapped:!1})),this.isTransformControlsPlane=!0,this.type="TransformControlsPlane"}updateMatrixWorld(e){let t=this.space;switch(this.position.copy(this.worldPosition),this.mode==="scale"&&(t="local"),vr.copy(Ps).applyQuaternion(t==="local"?this.worldQuaternion:yr),ws.copy(wi).applyQuaternion(t==="local"?this.worldQuaternion:yr),Es.copy(Ls).applyQuaternion(t==="local"?this.worldQuaternion:yr),pt.copy(ws),this.mode){case"translate":case"scale":switch(this.axis){case"X":pt.copy(this.eye).cross(vr),Dn.copy(vr).cross(pt);break;case"Y":pt.copy(this.eye).cross(ws),Dn.copy(ws).cross(pt);break;case"Z":pt.copy(this.eye).cross(Es),Dn.copy(Es).cross(pt);break;case"XY":Dn.copy(Es);break;case"YZ":Dn.copy(vr);break;case"XZ":pt.copy(Es),Dn.copy(ws);break;case"XYZ":case"E":Dn.set(0,0,0);break}break;case"rotate":default:Dn.set(0,0,0)}Dn.length()===0?this.quaternion.copy(this.cameraQuaternion):(Xl.lookAt(an.set(0,0,0),Dn,pt),this.quaternion.setFromRotationMatrix(Xl)),super.updateMatrixWorld(e)}}function Q0(i){let e,t,n,s;return e=new na({props:{dispose:i[0],object:i[1]}}),n=new Hu({props:{object:i[1]}}),{c(){Fe(e.$$.fragment),t=J(),Fe(n.$$.fragment)},m(r,o){Ne(e,r,o),Me(r,t,o),Ne(n,r,o),s=!0},p(r,[o]){const a={};o&1&&(a.dispose=r[0]),o&2&&(a.object=r[1]),e.$set(a);const l={};o&2&&(l.object=r[1]),n.$set(l)},i(r){s||(le(e.$$.fragment,r),le(n.$$.fragment,r),s=!0)},o(r){ue(e.$$.fragment,r),ue(n.$$.fragment,r),s=!1},d(r){Oe(e,r),r&&_e(t),Oe(n,r)}}}function J0(i,e,t){let n,s,{autoPauseOrbitControls:r=!0}=e,{mode:o=void 0}=e,{axis:a=null}=e,{dragging:l=!1}=e,{enabled:c=void 0}=e,{translationSnap:f=void 0}=e,{scaleSnap:h=void 0}=e,{rotationSnap:u=void 0}=e,{showX:p=void 0}=e,{showY:g=void 0}=e,{showZ:v=void 0}=e,{size:m=void 0}=e,{space:d=void 0}=e,{dispose:M=void 0}=e;const{camera:b,renderer:x,invalidate:y,scene:T}=Vn();Be(i,b,D=>t(20,s=D));const L=Fu();if(Be(i,L,D=>t(19,n=D)),!n)throw new Error("TransformControls: parent not defined. Is this component a child of <Canvas>?");const w=Lr(),_=()=>{if(!!s)return kn(s).orbitControls};let S;const B=()=>{if(S!==void 0){const D=_();D&&(D.enabled=S),S=void 0}};wt(B);const k={change:D=>{var V,W;n&&((W=(V=kn(n)).onTransform)==null||W.call(V)),y("TransformControls: change event"),w("change",D)},"camera-changed":D=>w("camera-changed",D),"object-changed":D=>w("object-changed",D),"enabled-changed":D=>w("enabled-changed",D),"axis-changed":D=>{t(4,a=D.value),w("axis-changed",D)},"mode-changed":D=>w("mode-changed",D),"translationSnap-changed":D=>w("translationSnap-changed",D),"rotationSnap-changed":D=>w("rotationSnap-changed",D),"scaleSnap-changed":D=>w("scaleSnap-changed",D),"space-changed":D=>w("space-changed",D),"size-changed":D=>w("size-changed",D),"dragging-changed":D=>{t(5,l=D.value);e:if(r){const V=_();if(!V)break e;const W=!D.value;if(V.enabled===W)break e;D.value&&(S=V.enabled),V.enabled=W}w("dragging-changed",D)},"showX-changed":D=>w("showX-changed",D),"showY-changed":D=>w("showY-changed",D),"showZ-changed":D=>w("showZ-changed",D),"worldPosition-changed":D=>w("worldPosition-changed",D),"worldPositionStart-changed":D=>w("worldPositionStart-changed",D),"worldQuaternion-changed":D=>w("worldQuaternion-changed",D),"worldQuaternionStart-changed":D=>w("worldQuaternionStart-changed",D),"cameraPosition-changed":D=>w("cameraPosition-changed",D),"cameraQuaternion-changed":D=>w("cameraQuaternion-changed",D),"pointStart-changed":D=>w("pointStart-changed",D),"pointEnd-changed":D=>w("pointEnd-changed",D),"rotationAxis-changed":D=>w("rotationAxis-changed",D),"rotationAngle-changed":D=>w("rotationAngle-changed",D),"eye-changed":D=>w("eye-changed",D),mouseDown:()=>w("mouseDown"),mouseUp:()=>w("mouseUp"),objectChange:()=>w("objectChange")};if(!x)throw new Error("TransformControls: renderer is undefined, is this component a child of <Canvas>?");const C=new V0(s,x.domElement),U=()=>C.reset();C.attach(n);const N=()=>{Object.entries(k).forEach(([D,V])=>{C.addEventListener(D,V)})},j=()=>{Object.entries(k).forEach(([D,V])=>{C.removeEventListener(D,V)})};return N(),T.add(C),wt(()=>{C.detach(),T.remove(C),j()}),i.$$set=D=>{"autoPauseOrbitControls"in D&&t(6,r=D.autoPauseOrbitControls),"mode"in D&&t(7,o=D.mode),"axis"in D&&t(4,a=D.axis),"dragging"in D&&t(5,l=D.dragging),"enabled"in D&&t(8,c=D.enabled),"translationSnap"in D&&t(9,f=D.translationSnap),"scaleSnap"in D&&t(10,h=D.scaleSnap),"rotationSnap"in D&&t(11,u=D.rotationSnap),"showX"in D&&t(12,p=D.showX),"showY"in D&&t(13,g=D.showY),"showZ"in D&&t(14,v=D.showZ),"size"in D&&t(15,m=D.size),"space"in D&&t(16,d=D.space),"dispose"in D&&t(0,M=D.dispose)},i.$$.update=()=>{i.$$.dirty&64&&(r||B()),i.$$.dirty&256&&c!==void 0&&t(1,C.enabled=c,C),i.$$.dirty&4096&&p!==void 0&&t(1,C.showX=p,C),i.$$.dirty&8192&&g!==void 0&&t(1,C.showY=g,C),i.$$.dirty&16384&&v!==void 0&&t(1,C.showZ=v,C),i.$$.dirty&130&&o!==void 0&&C.setMode(o),i.$$.dirty&514&&f!==void 0&&C.setTranslationSnap(f),i.$$.dirty&1026&&h!==void 0&&C.setScaleSnap(h),i.$$.dirty&2050&&u!==void 0&&C.setRotationSnap(u),i.$$.dirty&32770&&m!==void 0&&C.setSize(m),i.$$.dirty&65538&&d!==void 0&&C.setSpace(d)},[M,C,b,L,a,l,r,o,c,f,h,u,p,g,v,m,d,U]}class Xu extends at{constructor(e){super(),ot(this,e,J0,Q0,rt,{autoPauseOrbitControls:6,mode:7,axis:4,dragging:5,enabled:8,translationSnap:9,scaleSnap:10,rotationSnap:11,showX:12,showY:13,showZ:14,size:15,space:16,dispose:0,reset:17})}get reset(){return this.$$.ctx[17]}}const qu=new Ut;qu.scale.set(0,0,0);qu.matrix;new Ct().fromArray(new Array(16).fill(0));new ut(16777215);const Yu=(i,e)=>{if(e.includes(".")){const t=e.split("."),n=t.pop();for(let s=0;s<t.length;s+=1)i=i[t[s]];return{target:i,key:n}}else return{target:i,key:e}},Eo=Symbol("initialValueBeforeAttach"),$0=()=>{const{invalidate:i}=Vn();let e=!1,t=Eo,n,s,r;const o=(l,c,f)=>{if(a(),!f){const h=l;((h==null?void 0:h.isMaterial)||!1)&&(f="material"),((h==null?void 0:h.isBufferGeometry)||(h==null?void 0:h.isGeometry)||!1)&&(f="geometry")}if(!!f){if(typeof f=="function")n=f(c,l);else{const{target:h,key:u}=Yu(c,f);t=h[u],h[u]=l,s=h,r=u}e=!0,i()}},a=()=>{!e||(n?(n(),n=void 0):s&&r&&t!==Eo&&(s[r]=t,t=Eo,s=void 0,r=void 0),e=!1,i())};return wt(()=>{a()}),{update:o}},ev=i=>i&&i.isCamera,Zu=i=>i&&i.isOrthographicCamera,Ku=i=>i&&i.isPerspectiveCamera,tv=i=>Ku(i)||Zu(i),nv=()=>{const{invalidate:i,size:e}=Vn(),{setCamera:t}=Gu();let n,s;wt(()=>{s==null||s()});const r=l=>{!n||(Zu(n)?(n.left=l.width/-2,n.right=l.width/2,n.top=l.height/2,n.bottom=l.height/-2,n.updateProjectionMatrix(),n.updateMatrixWorld(),i()):Ku(n)&&(n.aspect=l.width/l.height,n.updateProjectionMatrix(),n.updateMatrixWorld(),i()))};return{update:(l,c)=>{if(s==null||s(),c||!tv(l)){n=void 0;return}n=l,s=e.subscribe(r)},makeDefaultCamera:(l,c)=>{!ev(l)||!c||(t(l),i())}}},ql=i=>!!(i!=null&&i.addEventListener),iv=()=>{const i=Lr(),e=fs(),t=u=>{u!=null&&u.type&&i(u.type,u)},n=(u,p)=>{ql(u)&&p.forEach(g=>{u.removeEventListener(g,t)})},s=(u,p)=>{ql(u)&&p.forEach(g=>{u.addEventListener(g,t)})};let r=[],o;const a=Je([]),l=a.subscribe(u=>{n(o,r),s(o,u),r=u});wt(l);const c=Je(),f=c.subscribe(u=>{n(o,r),s(u,r),o=u});return wt(f),wt(()=>{n(o,r)}),Pr(()=>{a.set(Object.keys(e.$$.callbacks))}),{updateRef:u=>{c.set(u)}}},sv=["$$scope","$$slots","type","args","attach","instance"],rv=["fov","aspect","near","far","left","right","top","bottom","zoom"],ov=i=>typeof i=="string"||typeof i=="number"||typeof i=="boolean"||typeof i=="undefined"||i===null,av=()=>{const{invalidate:i}=Vn(),e=new Map,t=(s,r,o,a)=>{var f,h;if(ov(o)){const u=e.get(r);if(u&&u.instance===s&&u.value===o)return;e.set(r,{instance:s,value:o})}const{key:l,target:c}=Yu(s,r);if(!Array.isArray(o)&&typeof o=="number"&&typeof((f=c[l])==null?void 0:f.setScalar)=="function")c[l].setScalar(o);else if(typeof((h=c[l])==null?void 0:h.set)=="function")Array.isArray(o)?c[l].set(...o):c[l].set(o);else{if(c[l]=o,a.manualCamera)return;rv.includes(l)&&(c.isPerspectiveCamera||c.isOrthographicCamera)&&c.updateProjectionMatrix()}};return{updateProps:(s,r,o)=>{for(const a in r)sv.includes(a)||t(s,a,r[a],o),i()}}},lv=i=>({ref:i&1}),Yl=i=>({ref:i[0]}),cv=i=>({ref:i&1}),Zl=i=>({ref:i[0]});function Kl(i){let e,t;return e=new na({props:{object:i[0],dispose:i[1]}}),{c(){Fe(e.$$.fragment)},m(n,s){Ne(e,n,s),t=!0},p(n,s){const r={};s&1&&(r.object=n[0]),s&2&&(r.dispose=n[1]),e.$set(r)},i(n){t||(le(e.$$.fragment,n),t=!0)},o(n){ue(e.$$.fragment,n),t=!1},d(n){Oe(e,n)}}}function uv(i){let e;const t=i[12].default,n=Gt(t,i,i[13],Yl);return{c(){n&&n.c()},m(s,r){n&&n.m(s,r),e=!0},p(s,r){n&&n.p&&(!e||r&8193)&&Vt(n,t,s,s[13],e?Ht(t,s[13],r,lv):Wt(s[13]),Yl)},i(s){e||(le(n,s),e=!0)},o(s){ue(n,s),e=!1},d(s){n&&n.d(s)}}}function fv(i){let e,t;return e=new ta({props:{object:i[0],$$slots:{default:[hv]},$$scope:{ctx:i}}}),{c(){Fe(e.$$.fragment)},m(n,s){Ne(e,n,s),t=!0},p(n,s){const r={};s&1&&(r.object=n[0]),s&8193&&(r.$$scope={dirty:s,ctx:n}),e.$set(r)},i(n){t||(le(e.$$.fragment,n),t=!0)},o(n){ue(e.$$.fragment,n),t=!1},d(n){Oe(e,n)}}}function hv(i){let e;const t=i[12].default,n=Gt(t,i,i[13],Zl);return{c(){n&&n.c()},m(s,r){n&&n.m(s,r),e=!0},p(s,r){n&&n.p&&(!e||r&8193)&&Vt(n,t,s,s[13],e?Ht(t,s[13],r,cv):Wt(s[13]),Zl)},i(s){e||(le(n,s),e=!0)},o(s){ue(n,s),e=!1},d(s){n&&n.d(s)}}}function dv(i){let e=i[4](i[0]),t,n,s,r,o,a,l=e&&Kl(i);const c=[fv,uv],f=[];function h(u,p){return p&1&&(n=null),n==null&&(n=!!u[3](u[0])),n?0:1}return s=h(i,-1),r=f[s]=c[s](i),{c(){l&&l.c(),t=J(),r.c(),o=Pn()},m(u,p){l&&l.m(u,p),Me(u,t,p),f[s].m(u,p),Me(u,o,p),a=!0},p(u,[p]){p&1&&(e=u[4](u[0])),e?l?(l.p(u,p),p&1&&le(l,1)):(l=Kl(u),l.c(),le(l,1),l.m(t.parentNode,t)):l&&(ln(),ue(l,1,1,()=>{l=null}),cn());let g=s;s=h(u,p),s===g?f[s].p(u,p):(ln(),ue(f[g],1,1,()=>{f[g]=null}),cn(),r=f[s],r?r.p(u,p):(r=f[s]=c[s](u),r.c()),le(r,1),r.m(o.parentNode,o))},i(u){a||(le(l),le(r),a=!0)},o(u){ue(l),ue(r),a=!1},d(u){l&&l.d(u),u&&_e(t),f[s].d(u),u&&_e(o)}}}function pv(i,e,t){const n=["type","args","attach","manual","makeDefault","dispose","ref"];let s=wr(e,n),r,{$$slots:o={},$$scope:a}=e,{type:l}=e,{args:c=void 0}=e,{attach:f=void 0}=e,{manual:h=void 0}=e,{makeDefault:u=void 0}=e,{dispose:p=void 0}=e;const g=Fn("threlte-hierarchical-parent-context");Be(i,g,S=>t(11,r=S));const v=S=>typeof S=="function"&&/^\s*class\s+/.test(S.toString()),m=S=>Array.isArray(S);let{ref:d=v(l)&&m(c)?new l(...c):v(l)?new l:l}=e,M=!1;const b=Je(d);Tn("threlte-hierarchical-parent-context",b);const x=av(),y=nv(),T=$0(),L=iv(),w=S=>!!S.isObject3D,_=S=>S.dispose!==void 0;return i.$$set=S=>{e=xt(xt({},e),nn(S)),t(21,s=wr(e,n)),"type"in S&&t(5,l=S.type),"args"in S&&t(6,c=S.args),"attach"in S&&t(7,f=S.attach),"manual"in S&&t(8,h=S.manual),"makeDefault"in S&&t(9,u=S.makeDefault),"dispose"in S&&t(1,p=S.dispose),"ref"in S&&t(0,d=S.ref),"$$scope"in S&&t(13,a=S.$$scope)},i.$$.update=()=>{i.$$.dirty&1120&&(M?t(0,d=v(l)&&m(c)?new l(...c):v(l)?new l:l):t(10,M=!0)),i.$$.dirty&1&&b.set(d),x.updateProps(d,s,{manualCamera:h}),i.$$.dirty&257&&y.update(d,h),i.$$.dirty&513&&y.makeDefaultCamera(d,u),i.$$.dirty&2177&&T.update(d,r,f),i.$$.dirty&1&&L.updateRef(d)},[d,p,g,w,_,l,c,f,h,u,M,r,o,a]}class Qu extends at{constructor(e){super(),ot(this,e,pv,dv,rt,{type:5,args:6,attach:7,manual:8,makeDefault:9,dispose:1,ref:0})}}function mv(i){return console.error("The component <T> can only be used in conjunction with the custom preprocessor."),[]}class Ql extends at{constructor(e){super(),ot(this,e,mv,null,rt,{})}}new Proxy(Ql,{get(i,e){return i[e]||Ql}});H0(Cl,()=>new Cl(Du));function Ju(i){const e=i-1;return e*e*e+1}function Hn(i){return--i*i*i*i*i+1}function hi(i,{delay:e=0,duration:t=400,easing:n=Ju,x:s=0,y:r=0,opacity:o=0}={}){const a=getComputedStyle(i),l=+a.opacity,c=a.transform==="none"?"":a.transform,f=l*(1-o),[h,u]=aa(s),[p,g]=aa(r);return{delay:e,duration:t,easing:n,css:(v,m)=>`
			transform: ${c} translate(${(1-v)*h}${u}, ${(1-v)*p}${g});
			opacity: ${l-f*m}`}}function Jl(i,{delay:e=0,duration:t=400,easing:n=Ju,start:s=0,opacity:r=0}={}){const o=getComputedStyle(i),a=+o.opacity,l=o.transform==="none"?"":o.transform,c=1-s,f=a*(1-r);return{delay:e,duration:t,easing:n,css:(h,u)=>`
			transform: ${l} scale(${1-c*u});
			opacity: ${a-f*u}
		`}}function $l(i,e,t){const n=i.slice();return n[22]=e[t],n}const gv=i=>({item:i&16}),ec=i=>({item:i[22].data});function _v(i){let e;return{c(){e=qe("Missing template")},m(t,n){Me(t,e,n)},d(t){t&&_e(e)}}}function tc(i,e){let t,n,s;const r=e[14].default,o=Gt(r,e,e[13],ec),a=o||_v();return{key:i,first:null,c(){t=F("svelte-virtual-list-row"),a&&a.c(),n=J(),Ao(t,"class","svelte-wgjs42"),this.first=t},m(l,c){Me(l,t,c),a&&a.m(t,null),E(t,n),s=!0},p(l,c){e=l,o&&o.p&&(!s||c&8208)&&Vt(o,r,e,e[13],s?Ht(r,e[13],c,gv):Wt(e[13]),ec)},i(l){s||(le(a,l),s=!0)},o(l){ue(a,l),s=!1},d(l){l&&_e(t),a&&a.d(l)}}}function vv(i){let e,t,n=[],s=new Map,r,o,a,l,c=i[4];const f=h=>h[22].index;for(let h=0;h<c.length;h+=1){let u=$l(i,c,h),p=f(u);s.set(p,n[h]=tc(p,u))}return{c(){e=F("svelte-virtual-list-viewport"),t=F("svelte-virtual-list-contents");for(let h=0;h<n.length;h+=1)n[h].c();Ae(t,"padding-top",i[5]+"px"),Ae(t,"padding-bottom",i[6]+"px"),Ao(t,"class","svelte-wgjs42"),Ae(e,"height",i[0]),Ao(e,"class","svelte-wgjs42"),Bn(()=>i[17].call(e))},m(h,u){Me(h,e,u),E(e,t);for(let p=0;p<n.length;p+=1)n[p]&&n[p].m(t,null);i[15](t),i[16](e),r=df(e,i[17].bind(e)),o=!0,a||(l=he(e,"scroll",i[7]),a=!0)},p(h,[u]){u&8208&&(c=h[4],ln(),n=yf(n,u,f,1,h,c,s,t,Sf,tc,null,$l),cn()),(!o||u&32)&&Ae(t,"padding-top",h[5]+"px"),(!o||u&64)&&Ae(t,"padding-bottom",h[6]+"px"),(!o||u&1)&&Ae(e,"height",h[0])},i(h){if(!o){for(let u=0;u<c.length;u+=1)le(n[u]);o=!0}},o(h){for(let u=0;u<n.length;u+=1)ue(n[u]);o=!1},d(h){h&&_e(e);for(let u=0;u<n.length;u+=1)n[u].d();i[15](null),i[16](null),r(),a=!1,l()}}}function bv(i,e,t){let{$$slots:n={},$$scope:s}=e,{items:r}=e,{height:o="100%"}=e,{itemHeight:a=void 0}=e,{start:l=0}=e,{end:c=0}=e,f=[],h,u,p,g=0,v,m,d=0,M=0,b;async function x(_,S,B){const{scrollTop:k}=u;await ai();let C=d-k,U=l;for(;C<S&&U<_.length;){let j=h[U-l];j||(t(9,c=U+3),await ai(),j=h[U-l]),C+=f[U]=B||j.offsetHeight,U+=3}t(9,c=U);const N=_.length-c;b=(d+C)/c,t(6,M=N*b),f.length=_.length}async function y(){const{scrollTop:_}=u,S=l;for(let U=0;U<h.length;U+=1)f[l+U]=a||h[U].offsetHeight;let B=0,k=0;for(;B<r.length;){const U=f[B]||b;if(k+U>_){t(8,l=B),t(5,d=k);break}k+=U,B+=3}for(;B<r.length&&(k+=f[B]||b,B+=3,!(k>_+g)););t(9,c=B);const C=r.length-c;for(b=k/c;B<r.length;)f[B++]=b;if(t(6,M=C*b),l<S){await ai();let U=0,N=0;for(let D=l;D<S;D+=3)h[D-l]&&(U+=f[D],N+=a||h[D-l].offsetHeight);const j=N-U;u.scrollTo(0,_+j)}}Pr(()=>{h=p.getElementsByTagName("svelte-virtual-list-row"),t(12,m=!0)});function T(_){xn[_?"unshift":"push"](()=>{p=_,t(3,p)})}function L(_){xn[_?"unshift":"push"](()=>{u=_,t(1,u)})}function w(){g=this.offsetHeight,t(2,g)}return i.$$set=_=>{"items"in _&&t(10,r=_.items),"height"in _&&t(0,o=_.height),"itemHeight"in _&&t(11,a=_.itemHeight),"start"in _&&t(8,l=_.start),"end"in _&&t(9,c=_.end),"$$scope"in _&&t(13,s=_.$$scope)},i.$$.update=()=>{i.$$.dirty&1792&&t(4,v=r.slice(l,c).map((_,S)=>({index:S+l,data:_}))),i.$$.dirty&7174&&m&&(x(r,g,a),u&&u.scrollTo(0,0))},[o,u,g,p,v,d,M,y,l,c,r,a,m,s,n,T,L,w]}class $u extends at{constructor(e){super(),ot(this,e,bv,vv,rt,{items:10,height:0,itemHeight:11,start:8,end:9})}}/**
 * @license lucide-svelte v0.454.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const Mv={xmlns:"http://www.w3.org/2000/svg",width:24,height:24,viewBox:"0 0 24 24",fill:"none",stroke:"currentColor","stroke-width":2,"stroke-linecap":"round","stroke-linejoin":"round"};var nc=Mv;function ic(i,e,t){const n=i.slice();return n[11]=e[t][0],n[12]=e[t][1],n}function To(i){let e,t=[i[12]],n={};for(let s=0;s<t.length;s+=1)n=xt(n,t[s]);return{c(){e=Zc(i[11]),Er(e,n)},m(s,r){Me(s,e,r)},p(s,r){Er(e,n=pi(t,[r&32&&s[12]]))},d(s){s&&_e(e)}}}function sc(i){let e=i[11],t,n=i[11]&&To(i);return{c(){n&&n.c(),t=Pn()},m(s,r){n&&n.m(s,r),Me(s,t,r)},p(s,r){s[11]?e?rt(e,s[11])?(n.d(1),n=To(s),e=s[11],n.c(),n.m(t.parentNode,t)):n.p(s,r):(n=To(s),e=s[11],n.c(),n.m(t.parentNode,t)):e&&(n.d(1),n=null,e=s[11])},d(s){s&&_e(t),n&&n.d(s)}}}function xv(i){let e,t,n,s,r,o=i[5],a=[];for(let u=0;u<o.length;u+=1)a[u]=sc(ic(i,o,u));const l=i[10].default,c=Gt(l,i,i[9],null);let f=[nc,i[7],{width:i[2]},{height:i[2]},{stroke:i[1]},{"stroke-width":n=i[4]?Number(i[3])*24/Number(i[2]):i[3]},{class:s=i[6]("lucide-icon","lucide",i[0]?`lucide-${i[0]}`:"",i[8].class)}],h={};for(let u=0;u<f.length;u+=1)h=xt(h,f[u]);return{c(){e=Zc("svg");for(let u=0;u<a.length;u+=1)a[u].c();t=Pn(),c&&c.c(),Er(e,h)},m(u,p){Me(u,e,p);for(let g=0;g<a.length;g+=1)a[g]&&a[g].m(e,null);E(e,t),c&&c.m(e,null),r=!0},p(u,[p]){if(p&32){o=u[5];let g;for(g=0;g<o.length;g+=1){const v=ic(u,o,g);a[g]?a[g].p(v,p):(a[g]=sc(v),a[g].c(),a[g].m(e,t))}for(;g<a.length;g+=1)a[g].d(1);a.length=o.length}c&&c.p&&(!r||p&512)&&Vt(c,l,u,u[9],r?Ht(l,u[9],p,null):Wt(u[9]),null),Er(e,h=pi(f,[nc,p&128&&u[7],(!r||p&4)&&{width:u[2]},(!r||p&4)&&{height:u[2]},(!r||p&2)&&{stroke:u[1]},(!r||p&28&&n!==(n=u[4]?Number(u[3])*24/Number(u[2]):u[3]))&&{"stroke-width":n},(!r||p&257&&s!==(s=u[6]("lucide-icon","lucide",u[0]?`lucide-${u[0]}`:"",u[8].class)))&&{class:s}]))},i(u){r||(le(c,u),r=!0)},o(u){ue(c,u),r=!1},d(u){u&&_e(e),Ri(a,u),c&&c.d(u)}}}function Sv(i,e,t){const n=["name","color","size","strokeWidth","absoluteStrokeWidth","iconNode"];let s=wr(e,n),{$$slots:r={},$$scope:o}=e,{name:a=void 0}=e,{color:l="currentColor"}=e,{size:c=24}=e,{strokeWidth:f=2}=e,{absoluteStrokeWidth:h=!1}=e,{iconNode:u=[]}=e;const p=(...g)=>g.filter((v,m,d)=>Boolean(v)&&d.indexOf(v)===m).join(" ");return i.$$set=g=>{t(8,e=xt(xt({},e),nn(g))),t(7,s=wr(e,n)),"name"in g&&t(0,a=g.name),"color"in g&&t(1,l=g.color),"size"in g&&t(2,c=g.size),"strokeWidth"in g&&t(3,f=g.strokeWidth),"absoluteStrokeWidth"in g&&t(4,h=g.absoluteStrokeWidth),"iconNode"in g&&t(5,u=g.iconNode),"$$scope"in g&&t(9,o=g.$$scope)},e=nn(e),[a,l,c,f,h,u,p,s,e,o,r]}class yv extends at{constructor(e){super(),ot(this,e,Sv,xv,rt,{name:0,color:1,size:2,strokeWidth:3,absoluteStrokeWidth:4,iconNode:5})}}var _s=yv;function wv(i){let e;const t=i[2].default,n=Gt(t,i,i[3],null);return{c(){n&&n.c()},m(s,r){n&&n.m(s,r),e=!0},p(s,r){n&&n.p&&(!e||r&8)&&Vt(n,t,s,s[3],e?Ht(t,s[3],r,null):Wt(s[3]),null)},i(s){e||(le(n,s),e=!0)},o(s){ue(n,s),e=!1},d(s){n&&n.d(s)}}}function Ev(i){let e,t;const n=[{name:"earth"},i[1],{iconNode:i[0]}];let s={$$slots:{default:[wv]},$$scope:{ctx:i}};for(let r=0;r<n.length;r+=1)s=xt(s,n[r]);return e=new _s({props:s}),{c(){Fe(e.$$.fragment)},m(r,o){Ne(e,r,o),t=!0},p(r,[o]){const a=o&3?pi(n,[n[0],o&2&&hs(r[1]),o&1&&{iconNode:r[0]}]):{};o&8&&(a.$$scope={dirty:o,ctx:r}),e.$set(a)},i(r){t||(le(e.$$.fragment,r),t=!0)},o(r){ue(e.$$.fragment,r),t=!1},d(r){Oe(e,r)}}}function Tv(i,e,t){let{$$slots:n={},$$scope:s}=e;const r=[["path",{d:"M21.54 15H17a2 2 0 0 0-2 2v4.54"}],["path",{d:"M7 3.34V5a3 3 0 0 0 3 3a2 2 0 0 1 2 2c0 1.1.9 2 2 2a2 2 0 0 0 2-2c0-1.1.9-2 2-2h3.17"}],["path",{d:"M11 21.95V18a2 2 0 0 0-2-2a2 2 0 0 1-2-2v-1a2 2 0 0 0-2-2H2.05"}],["circle",{cx:"12",cy:"12",r:"10"}]];return i.$$set=o=>{t(1,e=xt(xt({},e),nn(o))),"$$scope"in o&&t(3,s=o.$$scope)},e=nn(e),[r,e,n,s]}class Av extends at{constructor(e){super(),ot(this,e,Tv,Ev,rt,{})}}var Cv=Av;function Pv(i){let e;const t=i[2].default,n=Gt(t,i,i[3],null);return{c(){n&&n.c()},m(s,r){n&&n.m(s,r),e=!0},p(s,r){n&&n.p&&(!e||r&8)&&Vt(n,t,s,s[3],e?Ht(t,s[3],r,null):Wt(s[3]),null)},i(s){e||(le(n,s),e=!0)},o(s){ue(n,s),e=!1},d(s){n&&n.d(s)}}}function Lv(i){let e,t;const n=[{name:"info"},i[1],{iconNode:i[0]}];let s={$$slots:{default:[Pv]},$$scope:{ctx:i}};for(let r=0;r<n.length;r+=1)s=xt(s,n[r]);return e=new _s({props:s}),{c(){Fe(e.$$.fragment)},m(r,o){Ne(e,r,o),t=!0},p(r,[o]){const a=o&3?pi(n,[n[0],o&2&&hs(r[1]),o&1&&{iconNode:r[0]}]):{};o&8&&(a.$$scope={dirty:o,ctx:r}),e.$set(a)},i(r){t||(le(e.$$.fragment,r),t=!0)},o(r){ue(e.$$.fragment,r),t=!1},d(r){Oe(e,r)}}}function Rv(i,e,t){let{$$slots:n={},$$scope:s}=e;const r=[["circle",{cx:"12",cy:"12",r:"10"}],["path",{d:"M12 16v-4"}],["path",{d:"M12 8h.01"}]];return i.$$set=o=>{t(1,e=xt(xt({},e),nn(o))),"$$scope"in o&&t(3,s=o.$$scope)},e=nn(e),[r,e,n,s]}class Dv extends at{constructor(e){super(),ot(this,e,Rv,Lv,rt,{})}}var Iv=Dv;function Uv(i){let e;const t=i[2].default,n=Gt(t,i,i[3],null);return{c(){n&&n.c()},m(s,r){n&&n.m(s,r),e=!0},p(s,r){n&&n.p&&(!e||r&8)&&Vt(n,t,s,s[3],e?Ht(t,s[3],r,null):Wt(s[3]),null)},i(s){e||(le(n,s),e=!0)},o(s){ue(n,s),e=!1},d(s){n&&n.d(s)}}}function zv(i){let e,t;const n=[{name:"magnet"},i[1],{iconNode:i[0]}];let s={$$slots:{default:[Uv]},$$scope:{ctx:i}};for(let r=0;r<n.length;r+=1)s=xt(s,n[r]);return e=new _s({props:s}),{c(){Fe(e.$$.fragment)},m(r,o){Ne(e,r,o),t=!0},p(r,[o]){const a=o&3?pi(n,[n[0],o&2&&hs(r[1]),o&1&&{iconNode:r[0]}]):{};o&8&&(a.$$scope={dirty:o,ctx:r}),e.$set(a)},i(r){t||(le(e.$$.fragment,r),t=!0)},o(r){ue(e.$$.fragment,r),t=!1},d(r){Oe(e,r)}}}function kv(i,e,t){let{$$slots:n={},$$scope:s}=e;const r=[["path",{d:"m6 15-4-4 6.75-6.77a7.79 7.79 0 0 1 11 11L13 22l-4-4 6.39-6.36a2.14 2.14 0 0 0-3-3L6 15"}],["path",{d:"m5 8 4 4"}],["path",{d:"m12 15 4 4"}]];return i.$$set=o=>{t(1,e=xt(xt({},e),nn(o))),"$$scope"in o&&t(3,s=o.$$scope)},e=nn(e),[r,e,n,s]}class Nv extends at{constructor(e){super(),ot(this,e,kv,zv,rt,{})}}var Ov=Nv;function Fv(i){let e;const t=i[2].default,n=Gt(t,i,i[3],null);return{c(){n&&n.c()},m(s,r){n&&n.m(s,r),e=!0},p(s,r){n&&n.p&&(!e||r&8)&&Vt(n,t,s,s[3],e?Ht(t,s[3],r,null):Wt(s[3]),null)},i(s){e||(le(n,s),e=!0)},o(s){ue(n,s),e=!1},d(s){n&&n.d(s)}}}function Bv(i){let e,t;const n=[{name:"move-3d"},i[1],{iconNode:i[0]}];let s={$$slots:{default:[Fv]},$$scope:{ctx:i}};for(let r=0;r<n.length;r+=1)s=xt(s,n[r]);return e=new _s({props:s}),{c(){Fe(e.$$.fragment)},m(r,o){Ne(e,r,o),t=!0},p(r,[o]){const a=o&3?pi(n,[n[0],o&2&&hs(r[1]),o&1&&{iconNode:r[0]}]):{};o&8&&(a.$$scope={dirty:o,ctx:r}),e.$set(a)},i(r){t||(le(e.$$.fragment,r),t=!0)},o(r){ue(e.$$.fragment,r),t=!1},d(r){Oe(e,r)}}}function Gv(i,e,t){let{$$slots:n={},$$scope:s}=e;const r=[["path",{d:"M5 3v16h16"}],["path",{d:"m5 19 6-6"}],["path",{d:"m2 6 3-3 3 3"}],["path",{d:"m18 16 3 3-3 3"}]];return i.$$set=o=>{t(1,e=xt(xt({},e),nn(o))),"$$scope"in o&&t(3,s=o.$$scope)},e=nn(e),[r,e,n,s]}class Hv extends at{constructor(e){super(),ot(this,e,Gv,Bv,rt,{})}}var Vv=Hv;function Wv(i){let e;const t=i[2].default,n=Gt(t,i,i[3],null);return{c(){n&&n.c()},m(s,r){n&&n.m(s,r),e=!0},p(s,r){n&&n.p&&(!e||r&8)&&Vt(n,t,s,s[3],e?Ht(t,s[3],r,null):Wt(s[3]),null)},i(s){e||(le(n,s),e=!0)},o(s){ue(n,s),e=!1},d(s){n&&n.d(s)}}}function jv(i){let e,t;const n=[{name:"move"},i[1],{iconNode:i[0]}];let s={$$slots:{default:[Wv]},$$scope:{ctx:i}};for(let r=0;r<n.length;r+=1)s=xt(s,n[r]);return e=new _s({props:s}),{c(){Fe(e.$$.fragment)},m(r,o){Ne(e,r,o),t=!0},p(r,[o]){const a=o&3?pi(n,[n[0],o&2&&hs(r[1]),o&1&&{iconNode:r[0]}]):{};o&8&&(a.$$scope={dirty:o,ctx:r}),e.$set(a)},i(r){t||(le(e.$$.fragment,r),t=!0)},o(r){ue(e.$$.fragment,r),t=!1},d(r){Oe(e,r)}}}function Xv(i,e,t){let{$$slots:n={},$$scope:s}=e;const r=[["path",{d:"M12 2v20"}],["path",{d:"m15 19-3 3-3-3"}],["path",{d:"m19 9 3 3-3 3"}],["path",{d:"M2 12h20"}],["path",{d:"m5 9-3 3 3 3"}],["path",{d:"m9 5 3-3 3 3"}]];return i.$$set=o=>{t(1,e=xt(xt({},e),nn(o))),"$$scope"in o&&t(3,s=o.$$scope)},e=nn(e),[r,e,n,s]}class qv extends at{constructor(e){super(),ot(this,e,Xv,jv,rt,{})}}var Yv=qv;function Zv(i){let e;const t=i[2].default,n=Gt(t,i,i[3],null);return{c(){n&&n.c()},m(s,r){n&&n.m(s,r),e=!0},p(s,r){n&&n.p&&(!e||r&8)&&Vt(n,t,s,s[3],e?Ht(t,s[3],r,null):Wt(s[3]),null)},i(s){e||(le(n,s),e=!0)},o(s){ue(n,s),e=!1},d(s){n&&n.d(s)}}}function Kv(i){let e,t;const n=[{name:"rotate-3d"},i[1],{iconNode:i[0]}];let s={$$slots:{default:[Zv]},$$scope:{ctx:i}};for(let r=0;r<n.length;r+=1)s=xt(s,n[r]);return e=new _s({props:s}),{c(){Fe(e.$$.fragment)},m(r,o){Ne(e,r,o),t=!0},p(r,[o]){const a=o&3?pi(n,[n[0],o&2&&hs(r[1]),o&1&&{iconNode:r[0]}]):{};o&8&&(a.$$scope={dirty:o,ctx:r}),e.$set(a)},i(r){t||(le(e.$$.fragment,r),t=!0)},o(r){ue(e.$$.fragment,r),t=!1},d(r){Oe(e,r)}}}function Qv(i,e,t){let{$$slots:n={},$$scope:s}=e;const r=[["path",{d:"M16.466 7.5C15.643 4.237 13.952 2 12 2 9.239 2 7 6.477 7 12s2.239 10 5 10c.342 0 .677-.069 1-.2"}],["path",{d:"m15.194 13.707 3.814 1.86-1.86 3.814"}],["path",{d:"M19 15.57c-1.804.885-4.274 1.43-7 1.43-5.523 0-10-2.239-10-5s4.477-5 10-5c4.838 0 8.873 1.718 9.8 4"}]];return i.$$set=o=>{t(1,e=xt(xt({},e),nn(o))),"$$scope"in o&&t(3,s=o.$$scope)},e=nn(e),[r,e,n,s]}class Jv extends at{constructor(e){super(),ot(this,e,Qv,Kv,rt,{})}}var $v=Jv;function oi(i){return{x:i.x,y:i.z,z:-i.y}}function Dt(i){return{x:i.x,y:-i.z,z:i.y}}function rc(i,e,t){const n=i.slice();return n[1]=e[t],n}function oc(i){let e,t,n=i[1].key+"",s,r,o,a=i[1].text+"",l,c;return{c(){e=F("div"),t=F("div"),s=qe(n),r=J(),o=F("span"),l=qe(a),c=J(),I(t,"class","KeyButton svelte-b8dfu9"),I(e,"class","keyWrapper svelte-b8dfu9")},m(f,h){Me(f,e,h),E(e,t),E(t,s),E(e,r),E(e,o),E(o,l),E(e,c)},p(f,h){h&1&&n!==(n=f[1].key+"")&&Bt(s,n),h&1&&a!==(a=f[1].text+"")&&Bt(l,a)},d(f){f&&_e(e)}}}function ac(i){let e,t=i[1].key&&oc(i);return{c(){t&&t.c(),e=Pn()},m(n,s){t&&t.m(n,s),Me(n,e,s)},p(n,s){n[1].key?t?t.p(n,s):(t=oc(n),t.c(),t.m(e.parentNode,e)):t&&(t.d(1),t=null)},d(n){t&&t.d(n),n&&_e(e)}}}function e1(i){let e,t,n,s=i[0],r=[];for(let o=0;o<s.length;o+=1)r[o]=ac(rc(i,s,o));return{c(){e=F("div");for(let o=0;o<r.length;o+=1)r[o].c();I(e,"class","wrapper svelte-b8dfu9")},m(o,a){Me(o,e,a);for(let l=0;l<r.length;l+=1)r[l]&&r[l].m(e,null);n=!0},p(o,[a]){if(i=o,a&1){s=i[0];let l;for(l=0;l<s.length;l+=1){const c=rc(i,s,l);r[l]?r[l].p(c,a):(r[l]=ac(c),r[l].c(),r[l].m(e,null))}for(;l<r.length;l+=1)r[l].d(1);r.length=s.length}},i(o){n||(Bn(()=>{!n||(t||(t=Gn(e,hi,{duration:400,x:0,y:500,opacity:0,easing:Hn},!0)),t.run(1))}),n=!0)},o(o){t||(t=Gn(e,hi,{duration:400,x:0,y:500,opacity:0,easing:Hn},!1)),t.run(0),n=!1},d(o){o&&_e(e),Ri(r,o),o&&t&&t.end()}}}function t1(i,e,t){let{keys:n=[{key:"SPACE",text:"Freecam"},{key:"W",text:"Transform"},{key:"R",text:"Rotate"},{key:"L",text:"Local/World"}]}=e;return i.$$set=s=>{"keys"in s&&t(0,n=s.keys)},[n]}class ef extends at{constructor(e){super(),ot(this,e,t1,e1,rt,{keys:0})}}function lc(i){let e,t;const n=i[10].default,s=Gt(n,i,i[9],null);return{c(){e=F("div"),s&&s.c(),I(e,"class","tooltip svelte-1tpfdvj"),Ae(e,"top",i[2]+"px"),Ae(e,"left",i[3]+"px"),Ae(e,"transform","translateX(-"+i[0]+"%)")},m(r,o){Me(r,e,o),s&&s.m(e,null),t=!0},p(r,o){s&&s.p&&(!t||o&512)&&Vt(s,n,r,r[9],t?Ht(n,r[9],o,null):Wt(r[9]),null),(!t||o&4)&&Ae(e,"top",r[2]+"px"),(!t||o&8)&&Ae(e,"left",r[3]+"px"),(!t||o&1)&&Ae(e,"transform","translateX(-"+r[0]+"%)")},i(r){t||(le(s,r),t=!0)},o(r){ue(s,r),t=!1},d(r){r&&_e(e),s&&s.d(r)}}}function n1(i){let e,t,n,s,r=i[1]&&lc(i);return{c(){e=F("div"),r&&r.c(),I(e,"class","placement svelte-1tpfdvj")},m(o,a){Me(o,e,a),r&&r.m(e,null),i[11](e),t=!0,n||(s=[he(e,"mouseenter",i[5]),he(e,"mouseleave",i[6])],n=!0)},p(o,[a]){o[1]?r?(r.p(o,a),a&2&&le(r,1)):(r=lc(o),r.c(),le(r,1),r.m(e,null)):r&&(ln(),ue(r,1,1,()=>{r=null}),cn())},i(o){t||(le(r),t=!0)},o(o){ue(r),t=!1},d(o){o&&_e(e),r&&r.d(),i[11](null),n=!1,St(s)}}}function i1(i,e,t){let{$$slots:n={},$$scope:s}=e,r=!1,o,a,l,c,{placement:f="top"}=e,{offset:h=50}=e,{timeout:u=0}=e;function p(){o=setTimeout(()=>{if(c){const m=c.getBoundingClientRect();f=="top"?t(2,a=m.top+window.scrollY-m.height-15):t(2,a=m.top+window.scrollY+m.height-15),t(3,l=m.left),t(1,r=!0)}},u)}function g(){clearTimeout(o),t(1,r=!1)}function v(m){xn[m?"unshift":"push"](()=>{c=m,t(4,c)})}return i.$$set=m=>{"placement"in m&&t(7,f=m.placement),"offset"in m&&t(0,h=m.offset),"timeout"in m&&t(8,u=m.timeout),"$$scope"in m&&t(9,s=m.$$scope)},[h,r,a,l,c,p,g,f,u,s,n,v]}class Qn extends at{constructor(e){super(),ot(this,e,i1,n1,rt,{placement:7,offset:0,timeout:8})}}function cc(i,e,t){const n=i.slice();return n[105]=e[t],n}function uc(i,e,t){const n=i.slice();return n[108]=e[t],n}function fc(i){let e,t,n,s,r,o,a,l,c,f,h,u,p,g,v,m,d,M,b,x,y,T,L,w,_,S,B,k,C,U,N,j,D,V,W,Q,oe,ee,z=i[16]>0&&hc(i);t=new ef({props:{keys:[!i[14]&&{key:"RMB",text:"(hold) Freecam"},!i[14]&&i[4]&&{key:"G",text:"Ground"},!i[14]&&i[4]&&{key:"BACKSPACE",text:"Remove Item"},!i[14]&&{key:"ENTER",text:"Save Changes"},i[14]&&{key:"Q",text:"Move up"},i[14]&&{key:"E",text:"Move Down"}]}});let K=i[4]&&dc(i),pe=i[26],ae=[];for(let ce=0;ce<pe.length;ce+=1)ae[ce]=_c(uc(i,pe,ce));const H=ce=>ue(ae[ce],1,1,()=>{ae[ce]=null});k=new Qn({props:{offset:80,placement:"bottom",$$slots:{default:[p1]},$$scope:{ctx:i}}});const Se=[g1,m1],ve=[];function se(ce,xe){return ce[5]=="shopping"?0:ce[5]=="editor"?1:-1}~(N=se(i))&&(j=ve[N]=Se[N](i));let me=i[10]&&yc(i),Ie=i[4]&&i[20]=="shopping"&&(i[21][i[18]-1].options||i[29]!=-1)&&Ec(i);return{c(){z&&z.c(),e=J(),Fe(t.$$.fragment),n=J(),K&&K.c(),s=J(),r=F("div"),o=F("div"),a=F("button"),l=qe("SHOPPING"),f=J(),h=F("button"),u=qe("EDITOR"),g=J(),v=F("div"),v.textContent="CATEGORIES",m=J(),d=F("div");for(let ce=0;ce<ae.length;ce+=1)ae[ce].c();M=J(),b=F("div"),b.textContent="ITEMS",x=J(),y=F("input"),T=J(),L=F("span"),w=F("button"),_=F("i"),B=J(),Fe(k.$$.fragment),C=J(),U=F("div"),j&&j.c(),D=J(),me&&me.c(),V=J(),Ie&&Ie.c(),I(a,"class",c="sectionButton "+(i[5]=="shopping"&&"selectedButton2")+" svelte-8t2i2z"),I(h,"class",p="sectionButton "+(i[5]=="editor"&&"selectedButton2")+" svelte-8t2i2z"),Ae(h,"right","0vh"),I(o,"class","sectionWrapper svelte-8t2i2z"),I(v,"class","desc svelte-8t2i2z"),I(d,"class","categoryGrid svelte-8t2i2z"),I(b,"class","desc svelte-8t2i2z"),I(y,"class","searchBox svelte-8t2i2z"),I(y,"placeholder","Search..."),I(_,"class","fa-solid fa-filter svelte-8t2i2z"),I(_,"style",S=i[10]&&"color: #a66eff"),I(w,"class","filterButton svelte-8t2i2z"),I(L,"class","svelte-8t2i2z"),I(U,"class","furnitureList svelte-8t2i2z"),I(r,"class","wrapper svelte-8t2i2z")},m(ce,xe){z&&z.m(ce,xe),Me(ce,e,xe),Ne(t,ce,xe),Me(ce,n,xe),K&&K.m(ce,xe),Me(ce,s,xe),Me(ce,r,xe),E(r,o),E(o,a),E(a,l),E(o,f),E(o,h),E(h,u),E(r,g),E(r,v),E(r,m),E(r,d);for(let Xe=0;Xe<ae.length;Xe+=1)ae[Xe]&&ae[Xe].m(d,null);E(r,M),E(r,b),E(r,x),E(r,y),Ft(y,i[7]),E(r,T),E(r,L),E(L,w),E(w,_),E(w,B),Ne(k,w,null),E(r,C),E(r,U),~N&&ve[N].m(U,null),E(r,D),me&&me.m(r,null),E(r,V),Ie&&Ie.m(r,null),Q=!0,oe||(ee=[he(a,"click",i[89]),he(h,"click",i[90]),he(y,"input",i[92]),he(y,"input",i[40]),he(y,"focus",i[93]),he(y,"blur",i[94]),he(w,"click",i[95])],oe=!0)},p(ce,xe){i=ce,i[16]>0?z?z.p(i,xe):(z=hc(i),z.c(),z.m(e.parentNode,e)):z&&(z.d(1),z=null);const Xe={};if(xe[0]&16400&&(Xe.keys=[!i[14]&&{key:"RMB",text:"(hold) Freecam"},!i[14]&&i[4]&&{key:"G",text:"Ground"},!i[14]&&i[4]&&{key:"BACKSPACE",text:"Remove Item"},!i[14]&&{key:"ENTER",text:"Save Changes"},i[14]&&{key:"Q",text:"Move up"},i[14]&&{key:"E",text:"Move Down"}]),t.$set(Xe),i[4]?K?(K.p(i,xe),xe[0]&16&&le(K,1)):(K=dc(i),K.c(),le(K,1),K.m(s.parentNode,s)):K&&(ln(),ue(K,1,1,()=>{K=null}),cn()),(!Q||xe[0]&32&&c!==(c="sectionButton "+(i[5]=="shopping"&&"selectedButton2")+" svelte-8t2i2z"))&&I(a,"class",c),(!Q||xe[0]&32&&p!==(p="sectionButton "+(i[5]=="editor"&&"selectedButton2")+" svelte-8t2i2z"))&&I(h,"class",p),xe[0]&201326656|xe[1]&512){pe=i[26];let Le;for(Le=0;Le<pe.length;Le+=1){const Ye=uc(i,pe,Le);ae[Le]?(ae[Le].p(Ye,xe),le(ae[Le],1)):(ae[Le]=_c(Ye),ae[Le].c(),le(ae[Le],1),ae[Le].m(d,null))}for(ln(),Le=pe.length;Le<ae.length;Le+=1)H(Le);cn()}xe[0]&128&&y.value!==i[7]&&Ft(y,i[7]),(!Q||xe[0]&1024&&S!==(S=i[10]&&"color: #a66eff"))&&I(_,"style",S);const Mt={};xe[3]&262144&&(Mt.$$scope={dirty:xe,ctx:i}),k.$set(Mt);let nt=N;N=se(i),N===nt?~N&&ve[N].p(i,xe):(j&&(ln(),ue(ve[nt],1,1,()=>{ve[nt]=null}),cn()),~N?(j=ve[N],j?j.p(i,xe):(j=ve[N]=Se[N](i),j.c()),le(j,1),j.m(U,null)):j=null),i[10]?me?me.p(i,xe):(me=yc(i),me.c(),me.m(r,V)):me&&(me.d(1),me=null),i[4]&&i[20]=="shopping"&&(i[21][i[18]-1].options||i[29]!=-1)?Ie?Ie.p(i,xe):(Ie=Ec(i),Ie.c(),Ie.m(r,null)):Ie&&(Ie.d(1),Ie=null)},i(ce){if(!Q){le(t.$$.fragment,ce),le(K);for(let xe=0;xe<pe.length;xe+=1)le(ae[xe]);le(k.$$.fragment,ce),le(j),Bn(()=>{!Q||(W||(W=Gn(r,hi,{duration:400,x:-500,y:0,opacity:0,easing:Hn},!0)),W.run(1))}),Q=!0}},o(ce){ue(t.$$.fragment,ce),ue(K),ae=ae.filter(Boolean);for(let xe=0;xe<ae.length;xe+=1)ue(ae[xe]);ue(k.$$.fragment,ce),ue(j),W||(W=Gn(r,hi,{duration:400,x:-500,y:0,opacity:0,easing:Hn},!1)),W.run(0),Q=!1},d(ce){z&&z.d(ce),ce&&_e(e),Oe(t,ce),ce&&_e(n),K&&K.d(ce),ce&&_e(s),ce&&_e(r),Ri(ae,ce),Oe(k),~N&&ve[N].d(),me&&me.d(),Ie&&Ie.d(),ce&&W&&W.end(),oe=!1,St(ee)}}}function hc(i){let e,t,n=Ac(i[16])+"",s;return{c(){e=F("div"),t=qe("CART: "),s=qe(n),I(e,"class","cartCost svelte-8t2i2z")},m(r,o){Me(r,e,o),E(e,t),E(e,s)},p(r,o){o[0]&65536&&n!==(n=Ac(r[16])+"")&&Bt(s,n)},d(r){r&&_e(e)}}}function dc(i){let e,t,n,s,r,o,a,l,c,f,h,u,p,g,v,m,d,M,b,x,y,T,L,w,_,S,B,k,C,U,N,j,D,V,W,Q,oe,ee,z,K;t=new Bu({props:{$$slots:{default:[r1]},$$scope:{ctx:i}}});const pe=[a1,o1],ae=[];function H(se,me){return se[12]=="local"?0:1}a=H(i),l=ae[a]=pe[a](i),p=new Yv({props:{size:"23",style:"margin:auto"}}),b=new $v({props:{size:"23",style:"margin:auto"}}),_=new Ov({props:{size:"23",style:"margin:auto"}}),N=new Iv({props:{size:"23",style:"margin:auto"}});let Se=i[9]&&pc(i),ve=i[8]&&mc(i);return{c(){e=F("div"),Fe(t.$$.fragment),n=J(),s=F("div"),r=F("div"),o=F("button"),l.c(),c=J(),f=F("p"),f.textContent="Axis",h=J(),u=F("button"),Fe(p.$$.fragment),g=J(),v=F("p"),v.textContent="( E )",d=J(),M=F("button"),Fe(b.$$.fragment),x=J(),y=F("p"),y.textContent="( R )",L=J(),w=F("button"),Fe(_.$$.fragment),S=J(),B=F("p"),B.textContent="Snap",C=J(),U=F("button"),Fe(N.$$.fragment),j=J(),D=F("p"),D.textContent="Info",W=J(),Se&&Se.c(),Q=J(),ve&&ve.c(),I(e,"class","modeler z-[0] absolute h-screen w-screen svelte-8t2i2z"),Ae(e,"position","absolute"),Ae(e,"width","100%"),Ae(e,"height","100%"),Ae(e,"top","0vh"),Ae(f,"margin-top","0.25vh"),I(f,"class","svelte-8t2i2z"),I(o,"class","objButton svelte-8t2i2z"),Ae(v,"margin-top","0.25vh"),I(v,"class","svelte-8t2i2z"),I(u,"class",m="objButton "+(i[11]=="translate"&&"objButtonSelected")+" svelte-8t2i2z"),Ae(y,"margin-top","0.25vh"),I(y,"class","svelte-8t2i2z"),I(M,"class",T="objButton "+(i[11]=="rotate"&&"objButtonSelected")+" svelte-8t2i2z"),Ae(B,"margin-top","0.25vh"),I(B,"class","svelte-8t2i2z"),I(w,"class",k="objButton "+(i[9]&&"objButtonSelected")+" svelte-8t2i2z"),Ae(D,"margin-top","0.25vh"),I(D,"class","svelte-8t2i2z"),I(U,"class",V="objButton "+(i[8]&&"objButtonSelected")+" svelte-8t2i2z"),I(r,"class","objButtons svelte-8t2i2z"),I(s,"class","rightWrapper svelte-8t2i2z")},m(se,me){Me(se,e,me),Ne(t,e,null),Me(se,n,me),Me(se,s,me),E(s,r),E(r,o),ae[a].m(o,null),E(o,c),E(o,f),E(r,h),E(r,u),Ne(p,u,null),E(u,g),E(u,v),E(r,d),E(r,M),Ne(b,M,null),E(M,x),E(M,y),E(r,L),E(r,w),Ne(_,w,null),E(w,S),E(w,B),E(r,C),E(r,U),Ne(N,U,null),E(U,j),E(U,D),E(s,W),Se&&Se.m(s,null),E(s,Q),ve&&ve.m(s,null),ee=!0,z||(K=[he(o,"click",i[51]),he(u,"click",i[56]),he(M,"click",i[57]),he(w,"click",i[58]),he(U,"click",i[59])],z=!0)},p(se,me){i=se;const Ie={};me[0]&62928903|me[3]&262144&&(Ie.$$scope={dirty:me,ctx:i}),t.$set(Ie);let ce=a;a=H(i),a!==ce&&(ln(),ue(ae[ce],1,1,()=>{ae[ce]=null}),cn(),l=ae[a],l||(l=ae[a]=pe[a](i),l.c()),le(l,1),l.m(o,c)),(!ee||me[0]&2048&&m!==(m="objButton "+(i[11]=="translate"&&"objButtonSelected")+" svelte-8t2i2z"))&&I(u,"class",m),(!ee||me[0]&2048&&T!==(T="objButton "+(i[11]=="rotate"&&"objButtonSelected")+" svelte-8t2i2z"))&&I(M,"class",T),(!ee||me[0]&512&&k!==(k="objButton "+(i[9]&&"objButtonSelected")+" svelte-8t2i2z"))&&I(w,"class",k),(!ee||me[0]&256&&V!==(V="objButton "+(i[8]&&"objButtonSelected")+" svelte-8t2i2z"))&&I(U,"class",V),i[9]?Se?Se.p(i,me):(Se=pc(i),Se.c(),Se.m(s,Q)):Se&&(Se.d(1),Se=null),i[8]?ve?(ve.p(i,me),me[0]&256&&le(ve,1)):(ve=mc(i),ve.c(),le(ve,1),ve.m(s,null)):ve&&(ln(),ue(ve,1,1,()=>{ve=null}),cn())},i(se){ee||(le(t.$$.fragment,se),le(l),le(p.$$.fragment,se),le(b.$$.fragment,se),le(_.$$.fragment,se),le(N.$$.fragment,se),le(ve),Bn(()=>{!ee||(oe||(oe=Gn(s,hi,{duration:400,x:500,y:0,opacity:0,easing:Hn},!0)),oe.run(1))}),ee=!0)},o(se){ue(t.$$.fragment,se),ue(l),ue(p.$$.fragment,se),ue(b.$$.fragment,se),ue(_.$$.fragment,se),ue(N.$$.fragment,se),ue(ve),oe||(oe=Gn(s,hi,{duration:400,x:500,y:0,opacity:0,easing:Hn},!1)),oe.run(0),ee=!1},d(se){se&&_e(e),Oe(t),se&&_e(n),se&&_e(s),ae[a].d(),Oe(p),Oe(b),Oe(_),Oe(N),Se&&Se.d(),ve&&ve.d(),se&&oe&&oe.end(),z=!1,St(K)}}}function s1(i){let e,t;return e=new Xu({props:{mode:i[11],translationSnap:i[24],rotationSnap:mt.degToRad(i[25]),size:.5,space:i[12]}}),e.$on("objectChange",i[53]),e.$on("dragging-changed",i[54]),{c(){Fe(e.$$.fragment)},m(n,s){Ne(e,n,s),t=!0},p(n,s){const r={};s[0]&2048&&(r.mode=n[11]),s[0]&16777216&&(r.translationSnap=n[24]),s[0]&33554432&&(r.rotationSnap=mt.degToRad(n[25])),s[0]&4096&&(r.space=n[12]),e.$set(r)},i(n){t||(le(e.$$.fragment,n),t=!0)},o(n){ue(e.$$.fragment,n),t=!1},d(n){Oe(e,n)}}}function r1(i){let e,t,n,s,r;e=new ju({props:{position:i[22],lookAt:i[23],fov:60}});function o(l){i[55](l)}let a={type:Ee,"position.x":i[1].x,"position.y":i[1].y,"position.z":i[1].z,quaternion:5,geometry:new At(0,0,0),material:new Ru,"rotation.x":i[2].x,"rotation.y":i[2].y,"rotation.z":i[2].z,$$slots:{default:[s1]},$$scope:{ctx:i}};return i[0]!==void 0&&(a.ref=i[0]),n=new Qu({props:a}),xn.push(()=>Vs(n,"ref",o)),{c(){Fe(e.$$.fragment),t=J(),Fe(n.$$.fragment)},m(l,c){Ne(e,l,c),Me(l,t,c),Ne(n,l,c),r=!0},p(l,c){const f={};c[0]&4194304&&(f.position=l[22]),c[0]&8388608&&(f.lookAt=l[23]),e.$set(f);const h={};c[0]&2&&(h["position.x"]=l[1].x),c[0]&2&&(h["position.y"]=l[1].y),c[0]&2&&(h["position.z"]=l[1].z),c[0]&4&&(h["rotation.x"]=l[2].x),c[0]&4&&(h["rotation.y"]=l[2].y),c[0]&4&&(h["rotation.z"]=l[2].z),c[0]&50345984|c[3]&262144&&(h.$$scope={dirty:c,ctx:l}),!s&&c[0]&1&&(s=!0,h.ref=l[0],Hs(()=>s=!1)),n.$set(h)},i(l){r||(le(e.$$.fragment,l),le(n.$$.fragment,l),r=!0)},o(l){ue(e.$$.fragment,l),ue(n.$$.fragment,l),r=!1},d(l){Oe(e,l),l&&_e(t),Oe(n,l)}}}function o1(i){let e,t;return e=new Cv({props:{size:"23",style:"margin:auto"}}),{c(){Fe(e.$$.fragment)},m(n,s){Ne(e,n,s),t=!0},i(n){t||(le(e.$$.fragment,n),t=!0)},o(n){ue(e.$$.fragment,n),t=!1},d(n){Oe(e,n)}}}function a1(i){let e,t;return e=new Vv({props:{size:"23",style:"margin:auto"}}),{c(){Fe(e.$$.fragment)},m(n,s){Ne(e,n,s),t=!0},i(n){t||(le(e.$$.fragment,n),t=!0)},o(n){ue(e.$$.fragment,n),t=!1},d(n){Oe(e,n)}}}function pc(i){let e,t,n,s,r,o,a,l,c,f,h,u,p,g,v,m;return{c(){e=F("div"),t=F("div"),t.textContent="POSITION SNAP",n=J(),s=F("div"),r=F("input"),o=J(),a=F("input"),l=J(),c=F("div"),c.textContent="ROTATION SNAP",f=J(),h=F("div"),u=F("input"),p=J(),g=F("input"),I(t,"class","desc svelte-8t2i2z"),I(r,"type","range"),I(r,"class","rangeInput svelte-8t2i2z"),I(r,"step","0.001"),I(r,"min","0.001"),I(r,"max","1"),I(a,"class","input svelte-8t2i2z"),I(a,"min","0.01"),I(a,"max","1"),I(s,"class","inputsWrapper svelte-8t2i2z"),I(c,"class","desc svelte-8t2i2z"),I(u,"type","range"),I(u,"class","rangeInput svelte-8t2i2z"),I(u,"min","1"),I(u,"max","90"),I(u,"step","1"),I(g,"class","input svelte-8t2i2z"),I(g,"min","1"),I(g,"max","90"),I(h,"class","inputsWrapper svelte-8t2i2z"),I(e,"class","objWrapper svelte-8t2i2z")},m(d,M){Me(d,e,M),E(e,t),E(e,n),E(e,s),E(s,r),Ft(r,i[24]),E(s,o),E(s,a),Ft(a,i[24]),E(e,l),E(e,c),E(e,f),E(e,h),E(h,u),Ft(u,i[25]),E(h,p),E(h,g),Ft(g,i[25]),v||(m=[he(r,"change",i[60]),he(r,"input",i[60]),he(a,"input",i[61]),he(u,"change",i[62]),he(u,"input",i[62]),he(g,"input",i[63])],v=!0)},p(d,M){M[0]&16777216&&Ft(r,d[24]),M[0]&16777216&&a.value!==d[24]&&Ft(a,d[24]),M[0]&33554432&&Ft(u,d[25]),M[0]&33554432&&g.value!==d[25]&&Ft(g,d[25])},d(d){d&&_e(e),v=!1,St(m)}}}function mc(i){let e,t,n,s,r,o,a,l,c,f,h,u,p,g,v,m,d,M,b,x,y,T,L,w,_,S,B,k,C,U,N,j,D,V,W,Q,oe,ee,z,K,pe,ae,H,Se,ve,se,me,Ie,ce,xe,Xe,Mt,nt,Le,Ye,ht,dt,R,A,$,fe,de,ge,ze,Te,te,Ce,Ue,Pe,we,Re,He,tt,gt;l=new Qn({props:{offset:35,$$slots:{default:[l1]},$$scope:{ctx:i}}}),g=new Qn({props:{offset:35,$$slots:{default:[c1]},$$scope:{ctx:i}}}),b=new Qn({props:{offset:35,$$slots:{default:[u1]},$$scope:{ctx:i}}}),se=new Qn({props:{offset:35,$$slots:{default:[f1]},$$scope:{ctx:i}}}),Xe=new Qn({props:{offset:35,$$slots:{default:[h1]},$$scope:{ctx:i}}});let O=i[19]>0&&gc(i);return{c(){e=F("div"),t=F("div"),t.textContent="POSITION",n=J(),s=F("div"),r=F("button"),o=F("i"),a=J(),Fe(l.$$.fragment),c=J(),f=F("div"),h=F("button"),u=F("i"),p=J(),Fe(g.$$.fragment),v=J(),m=F("button"),d=F("i"),M=J(),Fe(b.$$.fragment),x=J(),y=F("div"),T=F("div"),L=F("div"),L.textContent="X",w=J(),_=F("input"),B=J(),k=F("div"),C=F("div"),C.textContent="Y",U=J(),N=F("input"),D=J(),V=F("div"),W=F("div"),W.textContent="Z",Q=J(),oe=F("input"),z=J(),K=F("div"),K.textContent="ROTATION",pe=J(),ae=F("div"),H=F("button"),Se=F("i"),ve=J(),Fe(se.$$.fragment),me=J(),Ie=F("button"),ce=F("i"),xe=J(),Fe(Xe.$$.fragment),Mt=J(),nt=F("div"),Le=F("div"),Ye=F("div"),Ye.textContent="X",ht=J(),dt=F("input"),A=J(),$=F("div"),fe=F("div"),fe.textContent="Y",de=J(),ge=F("input"),Te=J(),te=F("div"),Ce=F("div"),Ce.textContent="Z",Ue=J(),Pe=F("input"),Re=J(),O&&O.c(),I(t,"class","desc svelte-8t2i2z"),I(o,"class","fa-solid fa-clone svelte-8t2i2z"),I(r,"class","filterButton svelte-8t2i2z"),I(s,"class","copyPaste svelte-8t2i2z"),Ae(s,"top","1vh"),Ae(s,"right","2vh"),I(u,"class","fa-solid fa-copy svelte-8t2i2z"),I(h,"class","filterButton svelte-8t2i2z"),I(d,"class","fa-solid fa-paste svelte-8t2i2z"),I(m,"class","filterButton svelte-8t2i2z"),I(f,"class","copyPaste svelte-8t2i2z"),I(L,"class","inputTitle svelte-8t2i2z"),I(_,"class","input svelte-8t2i2z"),_.value=S=Dt(i[1]).x.toFixed(2),I(T,"class","svelte-8t2i2z"),I(C,"class","inputTitle svelte-8t2i2z"),I(N,"class","input svelte-8t2i2z"),N.value=j=Dt(i[1]).y.toFixed(2),I(k,"class","svelte-8t2i2z"),I(W,"class","inputTitle svelte-8t2i2z"),I(oe,"class","input svelte-8t2i2z"),oe.value=ee=Dt(i[1]).z.toFixed(2),I(V,"class","svelte-8t2i2z"),I(y,"class","inputsWrapper svelte-8t2i2z"),I(K,"class","desc svelte-8t2i2z"),I(Se,"class","fa-solid fa-copy svelte-8t2i2z"),I(H,"class","filterButton svelte-8t2i2z"),I(ce,"class","fa-solid fa-paste svelte-8t2i2z"),I(Ie,"class","filterButton svelte-8t2i2z"),I(ae,"class","copyPaste svelte-8t2i2z"),Ae(ae,"top","10.25vh"),I(Ye,"class","inputTitle svelte-8t2i2z"),I(dt,"class","input svelte-8t2i2z"),dt.value=R=Math.round(mt.radToDeg(Dt(i[2]).x)),I(Le,"class","svelte-8t2i2z"),I(fe,"class","inputTitle svelte-8t2i2z"),I(ge,"class","input svelte-8t2i2z"),ge.value=ze=Math.round(mt.radToDeg(Dt(i[2]).y)),I($,"class","svelte-8t2i2z"),I(Ce,"class","inputTitle svelte-8t2i2z"),I(Pe,"class","input svelte-8t2i2z"),Pe.value=we=Math.round(mt.radToDeg(Dt(i[2]).z)),I(te,"class","svelte-8t2i2z"),I(nt,"class","inputsWrapper svelte-8t2i2z"),I(e,"class","objWrapper svelte-8t2i2z")},m(q,re){Me(q,e,re),E(e,t),E(e,n),E(e,s),E(s,r),E(r,o),E(r,a),Ne(l,r,null),E(e,c),E(e,f),E(f,h),E(h,u),E(h,p),Ne(g,h,null),E(f,v),E(f,m),E(m,d),E(m,M),Ne(b,m,null),E(e,x),E(e,y),E(y,T),E(T,L),E(T,w),E(T,_),E(y,B),E(y,k),E(k,C),E(k,U),E(k,N),E(y,D),E(y,V),E(V,W),E(V,Q),E(V,oe),E(e,z),E(e,K),E(e,pe),E(e,ae),E(ae,H),E(H,Se),E(H,ve),Ne(se,H,null),E(ae,me),E(ae,Ie),E(Ie,ce),E(Ie,xe),Ne(Xe,Ie,null),E(e,Mt),E(e,nt),E(nt,Le),E(Le,Ye),E(Le,ht),E(Le,dt),E(nt,A),E(nt,$),E($,fe),E($,de),E($,ge),E(nt,Te),E(nt,te),E(te,Ce),E(te,Ue),E(te,Pe),E(e,Re),O&&O.m(e,null),He=!0,tt||(gt=[he(r,"click",i[64]),he(h,"click",i[65]),he(m,"click",i[42]),he(_,"change",i[66]),he(_,"focus",i[67]),he(_,"blur",i[68]),he(N,"change",i[69]),he(N,"focus",i[70]),he(N,"blur",i[71]),he(oe,"change",i[72]),he(oe,"focus",i[73]),he(oe,"blur",i[74]),he(H,"click",i[75]),he(Ie,"click",i[43]),he(dt,"change",i[76]),he(dt,"focus",i[77]),he(dt,"blur",i[78]),he(ge,"change",i[79]),he(ge,"focus",i[80]),he(ge,"blur",i[81]),he(Pe,"change",i[82]),he(Pe,"focus",i[83]),he(Pe,"blur",i[84])],tt=!0)},p(q,re){const ye={};re[3]&262144&&(ye.$$scope={dirty:re,ctx:q}),l.$set(ye);const De={};re[3]&262144&&(De.$$scope={dirty:re,ctx:q}),g.$set(De);const lt={};re[3]&262144&&(lt.$$scope={dirty:re,ctx:q}),b.$set(lt),(!He||re[0]&2&&S!==(S=Dt(q[1]).x.toFixed(2))&&_.value!==S)&&(_.value=S),(!He||re[0]&2&&j!==(j=Dt(q[1]).y.toFixed(2))&&N.value!==j)&&(N.value=j),(!He||re[0]&2&&ee!==(ee=Dt(q[1]).z.toFixed(2))&&oe.value!==ee)&&(oe.value=ee);const ft={};re[3]&262144&&(ft.$$scope={dirty:re,ctx:q}),se.$set(ft);const Pt={};re[3]&262144&&(Pt.$$scope={dirty:re,ctx:q}),Xe.$set(Pt),(!He||re[0]&4&&R!==(R=Math.round(mt.radToDeg(Dt(q[2]).x)))&&dt.value!==R)&&(dt.value=R),(!He||re[0]&4&&ze!==(ze=Math.round(mt.radToDeg(Dt(q[2]).y)))&&ge.value!==ze)&&(ge.value=ze),(!He||re[0]&4&&we!==(we=Math.round(mt.radToDeg(Dt(q[2]).z)))&&Pe.value!==we)&&(Pe.value=we),q[19]>0?O?O.p(q,re):(O=gc(q),O.c(),O.m(e,null)):O&&(O.d(1),O=null)},i(q){He||(le(l.$$.fragment,q),le(g.$$.fragment,q),le(b.$$.fragment,q),le(se.$$.fragment,q),le(Xe.$$.fragment,q),He=!0)},o(q){ue(l.$$.fragment,q),ue(g.$$.fragment,q),ue(b.$$.fragment,q),ue(se.$$.fragment,q),ue(Xe.$$.fragment,q),He=!1},d(q){q&&_e(e),Oe(l),Oe(g),Oe(b),Oe(se),Oe(Xe),O&&O.d(),tt=!1,St(gt)}}}function l1(i){let e;return{c(){e=qe("Duplicate")},m(t,n){Me(t,e,n)},d(t){t&&_e(e)}}}function c1(i){let e;return{c(){e=qe("Copy")},m(t,n){Me(t,e,n)},d(t){t&&_e(e)}}}function u1(i){let e;return{c(){e=qe("Paste")},m(t,n){Me(t,e,n)},d(t){t&&_e(e)}}}function f1(i){let e;return{c(){e=qe("Copy")},m(t,n){Me(t,e,n)},d(t){t&&_e(e)}}}function h1(i){let e;return{c(){e=qe("Paste")},m(t,n){Me(t,e,n)},d(t){t&&_e(e)}}}function gc(i){let e,t,n,s,r,o,a,l;return{c(){e=F("div"),e.textContent="COLOR",t=J(),n=F("div"),s=F("input"),r=J(),o=F("input"),I(e,"class","desc svelte-8t2i2z"),I(s,"type","range"),I(s,"class","rangeInput svelte-8t2i2z"),I(s,"min","0"),I(s,"max",i[19]),I(s,"step","1"),I(o,"class","input svelte-8t2i2z"),I(o,"min","0"),I(o,"max",i[19]),I(n,"class","inputsWrapper svelte-8t2i2z")},m(c,f){Me(c,e,f),Me(c,t,f),Me(c,n,f),E(n,s),Ft(s,i[15]),E(n,r),E(n,o),Ft(o,i[15]),a||(l=[he(s,"change",i[85]),he(s,"input",i[85]),he(s,"input",i[52]),he(o,"input",i[86]),he(o,"input",i[52]),he(o,"focus",i[87]),he(o,"blur",i[88])],a=!0)},p(c,f){f[0]&524288&&I(s,"max",c[19]),f[0]&32768&&Ft(s,c[15]),f[0]&524288&&I(o,"max",c[19]),f[0]&32768&&o.value!==c[15]&&Ft(o,c[15])},d(c){c&&_e(e),c&&_e(t),c&&_e(n),a=!1,St(l)}}}function d1(i){let e=i[108].toUpperCase()+"",t;return{c(){t=qe(e)},m(n,s){Me(n,t,s)},p(n,s){s[0]&67108864&&e!==(e=n[108].toUpperCase()+"")&&Bt(t,e)},d(n){n&&_e(t)}}}function _c(i){let e,t,n,s,r,o,a,l,c;s=new Qn({props:{$$slots:{default:[d1]},$$scope:{ctx:i}}});function f(){return i[91](i[108])}return{c(){e=F("button"),t=F("div"),n=J(),Fe(s.$$.fragment),r=J(),I(t,"class","categoryIcon svelte-8t2i2z"),Ae(t,"background-image","url('"+i[27][i[108]]+"')"),I(e,"data-tooltip-placement","top"),I(e,"class",o="categoryButton "+(i[108]==i[6]&&"selectedButton")+" svelte-8t2i2z")},m(h,u){Me(h,e,u),E(e,t),E(e,n),Ne(s,e,null),E(e,r),a=!0,l||(c=he(e,"click",f),l=!0)},p(h,u){i=h,(!a||u[0]&201326592)&&Ae(t,"background-image","url('"+i[27][i[108]]+"')");const p={};u[0]&67108864|u[3]&262144&&(p.$$scope={dirty:u,ctx:i}),s.$set(p),(!a||u[0]&67108928&&o!==(o="categoryButton "+(i[108]==i[6]&&"selectedButton")+" svelte-8t2i2z"))&&I(e,"class",o)},i(h){a||(le(s.$$.fragment,h),a=!0)},o(h){ue(s.$$.fragment,h),a=!1},d(h){h&&_e(e),Oe(s),l=!1,c()}}}function p1(i){let e;return{c(){e=qe("Filter")},m(t,n){Me(t,e,n)},d(t){t&&_e(e)}}}function m1(i){let e,t;return e=new $u({props:{items:i[17],$$slots:{default:[v1,({item:n})=>({105:n}),({item:n})=>[0,0,0,n?4096:0]]},$$scope:{ctx:i}}}),{c(){Fe(e.$$.fragment)},m(n,s){Ne(e,n,s),t=!0},p(n,s){const r={};s[0]&131072&&(r.items=n[17]),s[0]&269746176|s[3]&266240&&(r.$$scope={dirty:s,ctx:n}),e.$set(r)},i(n){t||(le(e.$$.fragment,n),t=!0)},o(n){ue(e.$$.fragment,n),t=!1},d(n){Oe(e,n)}}}function g1(i){let e,t;return e=new $u({props:{items:i[17],$$slots:{default:[M1,({item:n})=>({105:n}),({item:n})=>[0,0,0,n?4096:0]]},$$scope:{ctx:i}}}),{c(){Fe(e.$$.fragment)},m(n,s){Ne(e,n,s),t=!0},p(n,s){const r={};s[0]&131072&&(r.items=n[17]),s[0]&269746176|s[3]&266240&&(r.$$scope={dirty:s,ctx:n}),e.$set(r)},i(n){t||(le(e.$$.fragment,n),t=!0)},o(n){ue(e.$$.fragment,n),t=!1},d(n){Oe(e,n)}}}function _1(i){let e=i[105].model+"",t;return{c(){t=qe(e)},m(n,s){Me(n,t,s)},p(n,s){s[3]&4096&&e!==(e=n[105].model+"")&&Bt(t,e)},d(n){n&&_e(t)}}}function v1(i){let e,t,n,s,r,o,a,l;s=new Qn({props:{timeout:500,placement:"bottom",offset:40,$$slots:{default:[_1]},$$scope:{ctx:i}}});function c(){return i[97](i[105])}return{c(){e=F("button"),t=F("div"),n=J(),Fe(s.$$.fragment),I(t,"class","propImage svelte-8t2i2z"),Ae(t,"background-image","url('"+i[28][i[105].model]+"')"),I(e,"class",r="propButton "+(i[20]=="editor"&&i[105].uid==i[18]&&"propSelected")+" svelte-8t2i2z")},m(f,h){Me(f,e,h),E(e,t),E(e,n),Ne(s,e,null),o=!0,a||(l=he(e,"click",c),a=!0)},p(f,h){i=f,(!o||h[0]&268435456|h[3]&4096)&&Ae(t,"background-image","url('"+i[28][i[105].model]+"')");const u={};h[3]&266240&&(u.$$scope={dirty:h,ctx:i}),s.$set(u),(!o||h[0]&1310720|h[3]&4096&&r!==(r="propButton "+(i[20]=="editor"&&i[105].uid==i[18]&&"propSelected")+" svelte-8t2i2z"))&&I(e,"class",r)},i(f){o||(le(s.$$.fragment,f),o=!0)},o(f){ue(s.$$.fragment,f),o=!1},d(f){f&&_e(e),Oe(s),a=!1,l()}}}function vc(i){let e;return{c(){e=F("i"),I(e,"class","fa-solid fa-shirt svelte-8t2i2z")},m(t,n){Me(t,e,n)},d(t){t&&_e(e)}}}function bc(i){let e;return{c(){e=F("i"),I(e,"class","fa-solid fa-box-open svelte-8t2i2z")},m(t,n){Me(t,e,n)},d(t){t&&_e(e)}}}function Mc(i){let e;return{c(){e=F("i"),I(e,"class","fa-solid fa-swatchbook svelte-8t2i2z")},m(t,n){Me(t,e,n)},d(t){t&&_e(e)}}}function xc(i){let e;return{c(){e=F("i"),I(e,"class","fa-solid fa-palette svelte-8t2i2z")},m(t,n){Me(t,e,n)},d(t){t&&_e(e)}}}function Sc(i){let e;return{c(){e=F("i"),I(e,"class","fa-solid fa-desktop svelte-8t2i2z")},m(t,n){Me(t,e,n)},d(t){t&&_e(e)}}}function b1(i){let e=i[105].model+"",t;return{c(){t=qe(e)},m(n,s){Me(n,t,s)},p(n,s){s[3]&4096&&e!==(e=n[105].model+"")&&Bt(t,e)},d(n){n&&_e(t)}}}function M1(i){let e,t,n,s,r=i[105].price?`$${i[105].price}`:"FREE",o,a,l,c,f,h,u,p,g,v,m,d,M,b=i[105].section=="wardrobes"&&vc(),x=(i[105].section=="storage"||i[105].inventory)&&bc(),y=i[105].options&&Mc(),T=i[105].colors&&xc(),L=i[105].model=="sn_panel"&&Sc();g=new Qn({props:{timeout:500,placement:"bottom",offset:40,$$slots:{default:[b1]},$$scope:{ctx:i}}});function w(){return i[96](i[105])}return{c(){e=F("button"),t=F("div"),n=J(),s=F("div"),o=qe(r),a=J(),l=F("div"),b&&b.c(),c=J(),x&&x.c(),f=J(),y&&y.c(),h=J(),T&&T.c(),u=J(),L&&L.c(),p=J(),Fe(g.$$.fragment),I(t,"class","propImage svelte-8t2i2z"),Ae(t,"background-image","url('"+i[28][i[105].model]+"')"),I(s,"class","propPrice svelte-8t2i2z"),I(l,"class","attributeIcons svelte-8t2i2z"),I(e,"class",v="propButton "+(i[20]=="shopping"&&i[105].id==i[18]&&"propSelected")+" svelte-8t2i2z")},m(_,S){Me(_,e,S),E(e,t),E(e,n),E(e,s),E(s,o),E(e,a),E(e,l),b&&b.m(l,null),E(l,c),x&&x.m(l,null),E(l,f),y&&y.m(l,null),E(l,h),T&&T.m(l,null),E(l,u),L&&L.m(l,null),E(e,p),Ne(g,e,null),m=!0,d||(M=he(e,"click",w),d=!0)},p(_,S){i=_,(!m||S[0]&268435456|S[3]&4096)&&Ae(t,"background-image","url('"+i[28][i[105].model]+"')"),(!m||S[3]&4096)&&r!==(r=i[105].price?`$${i[105].price}`:"FREE")&&Bt(o,r),i[105].section=="wardrobes"?b||(b=vc(),b.c(),b.m(l,c)):b&&(b.d(1),b=null),i[105].section=="storage"||i[105].inventory?x||(x=bc(),x.c(),x.m(l,f)):x&&(x.d(1),x=null),i[105].options?y||(y=Mc(),y.c(),y.m(l,h)):y&&(y.d(1),y=null),i[105].colors?T||(T=xc(),T.c(),T.m(l,u)):T&&(T.d(1),T=null),i[105].model=="sn_panel"?L||(L=Sc(),L.c(),L.m(l,null)):L&&(L.d(1),L=null);const B={};S[3]&266240&&(B.$$scope={dirty:S,ctx:i}),g.$set(B),(!m||S[0]&1310720|S[3]&4096&&v!==(v="propButton "+(i[20]=="shopping"&&i[105].id==i[18]&&"propSelected")+" svelte-8t2i2z"))&&I(e,"class",v)},i(_){m||(le(g.$$.fragment,_),m=!0)},o(_){ue(g.$$.fragment,_),m=!1},d(_){_&&_e(e),b&&b.d(),x&&x.d(),y&&y.d(),T&&T.d(),L&&L.d(),Oe(g),d=!1,M()}}}function yc(i){let e,t,n,s,r,o,a,l,c,f,h,u=i[5]=="editor"&&wc();return{c(){e=F("div"),t=F("div"),t.textContent="FILTER",n=J(),s=F("button"),s.textContent="Lowest Price",r=J(),o=F("button"),o.textContent="Highest Price",a=J(),l=F("button"),l.textContent="Name A-Z",c=J(),f=F("button"),f.textContent="Name Z-A",h=J(),u&&u.c(),I(t,"class","desc svelte-8t2i2z"),I(s,"class","filterOption svelte-8t2i2z"),I(o,"class","filterOption svelte-8t2i2z"),I(l,"class","filterOption svelte-8t2i2z"),I(f,"class","filterOption svelte-8t2i2z"),I(e,"class","filterWrapper svelte-8t2i2z")},m(p,g){Me(p,e,g),E(e,t),E(e,n),E(e,s),E(e,r),E(e,o),E(e,a),E(e,l),E(e,c),E(e,f),E(e,h),u&&u.m(e,null)},p(p,g){p[5]=="editor"?u||(u=wc(),u.c(),u.m(e,null)):u&&(u.d(1),u=null)},d(p){p&&_e(e),u&&u.d()}}}function wc(i){let e;return{c(){e=F("button"),e.textContent="Distance",I(e,"class","filterOption svelte-8t2i2z")},m(t,n){Me(t,e,n)},d(t){t&&_e(e)}}}function Ec(i){let e,t=i[29]!=-1&&i[21][i[29]-1].options||i[21][i[18]-1].options,n=[];for(let s=0;s<t.length;s+=1)n[s]=Tc(cc(i,t,s));return{c(){e=F("div");for(let s=0;s<n.length;s+=1)n[s].c();I(e,"class","paletteOptions svelte-8t2i2z")},m(s,r){Me(s,e,r);for(let o=0;o<n.length;o+=1)n[o]&&n[o].m(e,null)},p(s,r){if(r[0]&808714240){t=s[29]!=-1&&s[21][s[29]-1].options||s[21][s[18]-1].options;let o;for(o=0;o<t.length;o+=1){const a=cc(s,t,o);n[o]?n[o].p(a,r):(n[o]=Tc(a),n[o].c(),n[o].m(e,null))}for(;o<n.length;o+=1)n[o].d(1);n.length=t.length}},d(s){s&&_e(e),Ri(n,s)}}}function Tc(i){let e,t,n,s,r=i[105].price?`$${i[105].price}`:"FREE",o,a,l,c,f;function h(){return i[98](i[105])}return{c(){e=F("button"),t=F("div"),n=J(),s=F("div"),o=qe(r),a=J(),I(t,"class","propImage svelte-8t2i2z"),Ae(t,"background-image","url('"+i[28][i[105].model]+"')"),I(s,"class","propPrice svelte-8t2i2z"),I(e,"class",l="propButton "+(i[20]=="shopping"&&i[105].id==i[18]&&"propSelected")+" svelte-8t2i2z"),Ae(e,"height","7.8vh")},m(u,p){Me(u,e,p),E(e,t),E(e,n),E(e,s),E(s,o),E(e,a),c||(f=he(e,"click",h),c=!0)},p(u,p){i=u,p[0]&807665664&&Ae(t,"background-image","url('"+i[28][i[105].model]+"')"),p[0]&539230208&&r!==(r=i[105].price?`$${i[105].price}`:"FREE")&&Bt(o,r),p[0]&540278784&&l!==(l="propButton "+(i[20]=="shopping"&&i[105].id==i[18]&&"propSelected")+" svelte-8t2i2z")&&I(e,"class",l)},d(u){u&&_e(e),c=!1,f()}}}function x1(i){let e,t,n,s,r=i[3]&&fc(i);return{c(){r&&r.c(),e=Pn()},m(o,a){r&&r.m(o,a),Me(o,e,a),t=!0,n||(s=[he(window,"keydown",i[45]),he(window,"click",i[46])],n=!0)},p(o,a){o[3]?r?(r.p(o,a),a[0]&8&&le(r,1)):(r=fc(o),r.c(),le(r,1),r.m(e.parentNode,e)):r&&(ln(),ue(r,1,1,()=>{r=null}),cn())},i(o){t||(le(r),t=!0)},o(o){ue(r),t=!1},d(o){r&&r.d(o),o&&_e(e),n=!1,St(s)}}}function Ac(i){return new Intl.NumberFormat("en-US",{style:"currency",currency:"USD",minimumFractionDigits:0,maximumFractionDigits:0}).format(i)}function S1(i,e,t){let n,s,r,o,a,l,c,f,h,u,p,g,v,m,d,M,b;Be(i,Cr,Y=>t(100,o=Y)),Be(i,Rl,Y=>t(101,l=Y)),Be(i,$o,Y=>t(102,f=Y)),Be(i,Go,Y=>t(21,h=Y)),Be(i,Bo,Y=>t(26,m=Y)),Be(i,xr,Y=>t(27,d=Y)),Be(i,Sr,Y=>t(28,M=Y));let x=!1,y=!1,T="shopping",L="all",w="",_=!0,S=!1,B=!1,k;const{cameraPosition:C,cameraLookAt:U,objectPosition:N,objectEuler:j,selectedType:D,selectedID:V,selectedColors:W,selectedParent:Q}=Lt;Be(i,C,Y=>t(22,u=Y)),Be(i,U,Y=>t(23,p=Y)),Be(i,N,Y=>t(1,n=Y)),Be(i,j,Y=>t(2,s=Y)),Be(i,D,Y=>t(20,c=Y)),Be(i,V,Y=>t(18,r=Y)),Be(i,W,Y=>t(19,a=Y)),Be(i,Q,Y=>t(29,b=Y));const{transformSnap:oe,rotationSnap:ee}=F_;Be(i,oe,Y=>t(24,g=Y)),Be(i,ee,Y=>t(25,v=Y));let z,K="translate",pe="local",ae=!1,H=!1,Se=0,ve=0;function se(){let Y=null;t(17,me=[]),T=="shopping"?Y=h:Y=o;for(let We=0;We<Y.length;++We){const _t=Y[We];_t.parent||(L=="all"||_t.section==L)&&(w==""||_t.model.toLowerCase().indexOf(w.toLowerCase())>-1)&&me.push(_t)}}let me=[];f&&se();function Ie(Y){k=Y}function ce(){if(!k)return;let Y=Dt(k);it("updatePropCoords",{x:Y.x,y:Y.y,z:Y.z,sendUpdate:!0})}function xe(){if(!k)return;let Y=Dt(k);it("updatePropRotation",{x:Math.round(mt.radToDeg(Y.x)),y:Math.round(mt.radToDeg(Y.y)),z:Math.round(mt.radToDeg(Y.z)),sendUpdate:!0})}function Xe(Y){T!=Y&&(t(5,T=Y),t(6,L="all"),t(10,B=!1),se())}function Mt(Y){if(Y=Y||event,!(!x||l)){switch(Y.keyCode){case 13:it("confirmEdits");break;case 9:T=="shopping"?Xe("editor"):Xe("shopping");break;case 8:if(!y)return;it("deleteProp",{selectedType:c,selectedID:r});break;case 69:if(H)return;t(11,K="translate");break;case 82:if(H)return;t(11,K="rotate");break;case 71:it("snapToGround");break}Y.preventDefault()}}function nt(Y){if(!!x&&Y&&Y.target&&Y.target.localName&&(Y.target.localName=="main"||Y.target.localName=="canvas")){if(document.activeElement.blur(),t(10,B=!1),ae)return;it("propSelect")}}function Le(Y){bt(Rl,l=document.activeElement!==document.body,l),it("toggleFocus",!Y)}function Ye(Y){return Y.x!=n.x||Y.y!=n.y||Y.z!=n.z}function ht(Y){return Y.x!=s.x||Y.y!=s.y||Y.z!=s.z}function dt(){if(z&&(Ye(z.position)&&(bt(N,n.x=z.position.x,n),bt(N,n.y=z.position.y,n),bt(N,n.z=z.position.z,n),it("updatePropCoords",Dt(n))),ht(z.rotation))){bt(j,s.x=z.rotation.x,s),bt(j,s.y=z.rotation.y,s),bt(j,s.z=z.rotation.z,s);const Y=Dt(s);it("updatePropRotation",{x:mt.radToDeg(Y.x).toFixed(2),y:mt.radToDeg(Y.y).toFixed(2),z:mt.radToDeg(Y.z).toFixed(2)})}}function R(Y,We){let _t=Dt(n);_t[Y]=Number(We),it("updatePropCoords",{x:_t.x,y:_t.y,z:_t.z,sendUpdate:!0})}function A(Y,We){let _t=Dt(s);_t.x=Math.round(mt.radToDeg(_t.x)),_t.y=Math.round(mt.radToDeg(_t.y)),_t.z=Math.round(mt.radToDeg(_t.z)),_t[Y]=Number(We),it("updatePropRotation",{x:_t.x,y:_t.y,z:_t.z,sendUpdate:!0})}function $(){pe=="local"?t(12,pe="world"):t(12,pe="local")}function fe(){Se>=0&&Se<=a&&it("updatePropColor",Se)}It("setFreeCam",Y=>{t(14,H=Y)}),It("setCart",Y=>{t(16,ve=Y)}),It("stopDecorating",()=>{t(3,x=!1),t(4,y=!1)}),It("startDecorating",Y=>{bt(Cr,o=Y,o),o.sort((We,_t)=>We.distance-_t.distance),t(3,x=!0),t(5,T="shopping"),bt(V,r=0,r),t(4,y=!1),se()}),It("setupModel",Y=>{Y.objectPosition&&Lt.objectPosition.set(oi(Y.objectPosition)),Y.objectRotation&&Lt.objectEuler.set(new mi(mt.degToRad(Y.objectRotation.x),mt.degToRad(Y.objectRotation.z),mt.degToRad(Y.objectRotation.y),"YZX")),Y.cameraPosition&&Lt.cameraPosition.set(oi(Y.cameraPosition)),Y.cameraLookAt&&Lt.cameraLookAt.set(oi(Y.cameraLookAt)),Y.entity&&Lt.entity.set(Y.entity),Y.selectedType&&(Lt.selectedType.set(Y.selectedType),Lt.selectedID.set(Y.selectedID),Lt.selectedColors.set(Y.selectedColors||0),Lt.selectedParent.set(Y.selectedParent||-1)),t(15,Se=Y.selectedColor||0),t(4,y=!0)}),It("unSelectModel",()=>{Lt.selectedParent.set(-1),t(4,y=!1),Lt.selectedID.set(0)});const de=Y=>{dt()},ge=Y=>{Y.detail.value?t(13,ae=!0):setTimeout(()=>{t(13,ae=!1)},100)};function ze(Y){z=Y,t(0,z)}const Te=()=>t(11,K="translate"),te=()=>t(11,K="rotate"),Ce=()=>t(9,S=!S),Ue=()=>t(8,_=!_);function Pe(){g=Rs(this.value),oe.set(g)}function we(){g=this.value,oe.set(g)}function Re(){v=Rs(this.value),ee.set(v)}function He(){v=this.value,ee.set(v)}const tt=()=>it("duplicateProp"),gt=()=>Ie(n),O=Y=>R("x",Y.target.value),q=()=>Le(!0),re=()=>Le(!1),ye=Y=>R("y",Y.target.value),De=()=>Le(!0),lt=()=>Le(!1),ft=Y=>R("z",Y.target.value),Pt=()=>Le(!0),Ln=()=>Le(!1),Tt=()=>Ie({x:s.x,y:s.y,z:s.z}),rn=Y=>A("x",Y.target.value),vn=()=>Le(!0),Di=()=>Le(!1),js=Y=>A("y",Y.target.value),Fr=()=>Le(!0),Br=()=>Le(!1),Gr=Y=>A("z",Y.target.value),P=()=>Le(!0),Z=()=>Le(!1);function ne(){Se=Rs(this.value),t(15,Se)}function X(){Se=this.value,t(15,Se)}const ie=()=>Le(!0),ke=()=>Le(!1),Ge=()=>Xe("shopping"),Ve=()=>Xe("editor"),je=Y=>{t(6,L=Y),se()};function Ze(){w=this.value,t(7,w)}const Ke=()=>Le(!0),$e=()=>Le(!1),ct=()=>t(10,B=!B),jt=Y=>it("placeCatalogItem",Y.id),hn=Y=>it("selectPlacedProp",Y.uid),Wn=Y=>it("placeCatalogItem",Y.id);return i.$$.update=()=>{i.$$.dirty[0]&7&&z&&(z.rotation.set(s.x,s.y,s.z,s.order),z.position.set(n.x,n.y,n.z))},[z,n,s,x,y,T,L,w,_,S,B,K,pe,ae,H,Se,ve,me,r,a,c,h,u,p,g,v,m,d,M,b,C,U,N,j,D,V,W,Q,oe,ee,se,Ie,ce,xe,Xe,Mt,nt,Le,dt,R,A,$,fe,de,ge,ze,Te,te,Ce,Ue,Pe,we,Re,He,tt,gt,O,q,re,ye,De,lt,ft,Pt,Ln,Tt,rn,vn,Di,js,Fr,Br,Gr,P,Z,ne,X,ie,ke,Ge,Ve,je,Ze,Ke,$e,ct,jt,hn,Wn]}class y1 extends at{constructor(e){super(),ot(this,e,S1,x1,rt,{},null,[-1,-1,-1,-1])}}function Cc(i){let e,t,n,s,r,o,a,l,c,f,h,u,p,g,v;return{c(){e=F("div"),t=F("div"),n=qe(i[1]),s=J(),r=F("div"),o=qe(i[2]),a=J(),l=F("div"),c=F("button"),c.textContent="CANCEL",f=J(),h=F("button"),h.textContent="CONFIRM",I(t,"class","title svelte-c18w63"),I(r,"class","description svelte-c18w63"),I(c,"class","button svelte-c18w63"),I(h,"class","button svelte-c18w63"),I(l,"class","buttonWrapper svelte-c18w63"),I(e,"class","wrapper svelte-c18w63")},m(m,d){Me(m,e,d),E(e,t),E(t,n),E(e,s),E(e,r),E(r,o),E(e,a),E(e,l),E(l,c),E(l,f),E(l,h),p=!0,g||(v=[he(c,"click",i[5]),he(h,"click",i[6])],g=!0)},p(m,d){i=m,(!p||d&2)&&Bt(n,i[1]),(!p||d&4)&&Bt(o,i[2])},i(m){p||(Bn(()=>{!p||(u||(u=Gn(e,Jl,{duration:300,opacity:0,start:0,easing:Hn},!0)),u.run(1))}),p=!0)},o(m){u||(u=Gn(e,Jl,{duration:300,opacity:0,start:0,easing:Hn},!1)),u.run(0),p=!1},d(m){m&&_e(e),m&&u&&u.end(),g=!1,St(v)}}}function w1(i){let e,t,n,s,r=i[0]&&Cc(i);return{c(){r&&r.c(),e=Pn()},m(o,a){r&&r.m(o,a),Me(o,e,a),t=!0,n||(s=he(window,"keydown",i[4]),n=!0)},p(o,[a]){o[0]?r?(r.p(o,a),a&1&&le(r,1)):(r=Cc(o),r.c(),le(r,1),r.m(e.parentNode,e)):r&&(ln(),ue(r,1,1,()=>{r=null}),cn())},i(o){t||(le(r),t=!0)},o(o){ue(r),t=!1},d(o){r&&r.d(o),o&&_e(e),n=!1,s()}}}function E1(i,e,t){let n=!1,s="Example Title",r="Example description text";It("showPopup",f=>{t(1,s=f.title),t(2,r=f.description),t(0,n=!0)});function o(f){it("popupValue",f),t(0,n=!1)}function a(f){if(!f.repeat&&!!n)switch(f.keyCode){case 27:o(!1),f.preventDefault();break}}return[n,s,r,o,a,()=>o(!1),()=>o(!0)]}class T1 extends at{constructor(e){super(),ot(this,e,E1,w1,rt,{})}}function Pc(i,e,t){const n=i.slice();return n[36]=e[t][0],n[37]=e[t][1],n}function Lc(i,e,t){const n=i.slice();return n[40]=e[t],n}function Rc(i){let e,t,n,s,r,o,a,l,c,f,h,u,p,g,v,m,d=Object.keys(i[5]).length+"",M,b,x,y,T,L,w,_,S,B=i[9]!=""&&Dc(i),k=i[8]!=""&&Ic(i),C=i[6]&&Uc(i);function U(W,Q){return W[2]=="ipl"?C1:A1}let N=U(i),j=N(i),D=Object.entries(i[5]),V=[];for(let W=0;W<D.length;W+=1)V[W]=kc(Pc(i,D,W));return{c(){e=F("div"),B&&B.c(),t=J(),k&&k.c(),n=J(),C&&C.c(),s=J(),r=F("i"),o=J(),a=F("div"),a.textContent="ADMIN PANEL",l=J(),j.c(),c=J(),f=F("div"),h=F("div"),u=F("button"),p=qe("Add Access"),m=F("span"),M=qe(d),b=qe("/"),x=qe(i[11]),y=J(),T=F("div");for(let W=0;W<V.length;W+=1)V[W].c();L=J(),w=F("button"),w.textContent="Decorate",I(r,"class","fa-solid fa-house mainIcon svelte-5ogbut"),I(a,"class","title svelte-5ogbut"),I(u,"class","permButton svelte-5ogbut"),I(u,"style",g=Object.keys(i[5]).length>=i[11]&&"filter: grayscale(100%) brightness(60%)"),u.disabled=v=Object.keys(i[5]).length>=i[11],Ae(m,"font-weight","600"),I(h,"class","topWrapper svelte-5ogbut"),I(T,"class","permsList svelte-5ogbut"),I(f,"class","rightWrapper svelte-5ogbut"),I(w,"class","decorateButton svelte-5ogbut"),I(e,"class","mainContainer svelte-5ogbut")},m(W,Q){Me(W,e,Q),B&&B.m(e,null),E(e,t),k&&k.m(e,null),E(e,n),C&&C.m(e,null),E(e,s),E(e,r),E(e,o),E(e,a),E(e,l),j.m(e,null),E(e,c),E(e,f),E(f,h),E(h,u),E(u,p),E(h,m),E(m,M),E(m,b),E(m,x),E(f,y),E(f,T);for(let oe=0;oe<V.length;oe+=1)V[oe]&&V[oe].m(T,null);E(e,L),E(e,w),_||(S=[he(u,"click",i[12]),he(w,"click",i[35])],_=!0)},p(W,Q){if(W[9]!=""?B?B.p(W,Q):(B=Dc(W),B.c(),B.m(e,t)):B&&(B.d(1),B=null),W[8]!=""?k?k.p(W,Q):(k=Ic(W),k.c(),k.m(e,n)):k&&(k.d(1),k=null),W[6]?C?C.p(W,Q):(C=Uc(W),C.c(),C.m(e,s)):C&&(C.d(1),C=null),N===(N=U(W))&&j?j.p(W,Q):(j.d(1),j=N(W),j&&(j.c(),j.m(e,c))),Q[0]&2080&&g!==(g=Object.keys(W[5]).length>=W[11]&&"filter: grayscale(100%) brightness(60%)")&&I(u,"style",g),Q[0]&2080&&v!==(v=Object.keys(W[5]).length>=W[11])&&(u.disabled=v),Q[0]&32&&d!==(d=Object.keys(W[5]).length+"")&&Bt(M,d),Q[0]&2048&&Bt(x,W[11]),Q[0]&800){D=Object.entries(W[5]);let oe;for(oe=0;oe<D.length;oe+=1){const ee=Pc(W,D,oe);V[oe]?V[oe].p(ee,Q):(V[oe]=kc(ee),V[oe].c(),V[oe].m(T,null))}for(;oe<V.length;oe+=1)V[oe].d(1);V.length=D.length}},d(W){W&&_e(e),B&&B.d(),k&&k.d(),C&&C.d(),j.d(),Ri(V,W),_=!1,St(S)}}}function Dc(i){let e,t,n,s,r,o=i[5][i[9]].name+"",a,l,c,f,h,u,p,g,v,m,d,M,b,x,y,T,L,w,_,S,B,k,C,U,N,j,D,V,W,Q,oe,ee;return{c(){e=F("div"),t=F("div"),n=F("div"),n.textContent="Edit perms for?",s=J(),r=F("div"),a=qe(o),l=J(),c=F("label"),f=F("input"),h=J(),u=F("span"),p=qe(`
						Furnish`),g=J(),v=F("label"),m=F("input"),d=J(),M=F("span"),b=qe(`
						Unlock/lock Doors`),x=J(),y=F("label"),T=F("input"),L=J(),w=F("span"),_=qe(`
						Storages`),S=J(),B=F("label"),k=F("input"),C=J(),U=F("span"),N=qe(`
						Admin`),j=J(),D=F("div"),V=F("button"),V.textContent="Cancel",W=J(),Q=F("button"),Q.textContent="Confirm",I(n,"class","subTitle svelte-5ogbut"),I(r,"class","subTitle svelte-5ogbut"),Ae(r,"margin-bottom","1vh"),I(f,"type","checkbox"),I(f,"class","svelte-5ogbut"),I(u,"class","checkmark svelte-5ogbut"),I(c,"class","checkboxInput svelte-5ogbut"),I(m,"type","checkbox"),I(m,"class","svelte-5ogbut"),I(M,"class","checkmark svelte-5ogbut"),I(v,"class","checkboxInput svelte-5ogbut"),I(T,"type","checkbox"),I(T,"class","svelte-5ogbut"),I(w,"class","checkmark svelte-5ogbut"),I(y,"class","checkboxInput svelte-5ogbut"),I(k,"type","checkbox"),I(k,"class","svelte-5ogbut"),I(U,"class","checkmark svelte-5ogbut"),I(B,"class","checkboxInput svelte-5ogbut"),I(V,"class","permButton svelte-5ogbut"),Ae(V,"background-color","#502323"),Ae(V,"border","1px solid #dd3636"),I(Q,"class","permButton svelte-5ogbut"),I(D,"class","permButtons svelte-5ogbut"),Ae(D,"position","relative"),Ae(D,"left","50%"),Ae(D,"transform","translateX(-50%)"),Ae(D,"font-size","1.75vh"),I(t,"class","modal svelte-5ogbut"),I(e,"class","blurDiv svelte-5ogbut")},m(z,K){Me(z,e,K),E(e,t),E(t,n),E(t,s),E(t,r),E(r,a),E(t,l),E(t,c),E(c,f),f.checked=i[5][i[9]].furnish,E(c,h),E(c,u),E(c,p),E(t,g),E(t,v),E(v,m),m.checked=i[5][i[9]].doors,E(v,d),E(v,M),E(v,b),E(t,x),E(t,y),E(y,T),T.checked=i[5][i[9]].storage,E(y,L),E(y,w),E(y,_),E(t,S),E(t,B),E(B,k),k.checked=i[5][i[9]].admin,E(B,C),E(B,U),E(B,N),E(t,j),E(t,D),E(D,V),E(D,W),E(D,Q),oe||(ee=[he(f,"change",i[14]),he(m,"change",i[15]),he(T,"change",i[16]),he(k,"change",i[17]),he(V,"click",i[18]),he(Q,"click",i[19])],oe=!0)},p(z,K){K[0]&544&&o!==(o=z[5][z[9]].name+"")&&Bt(a,o),K[0]&544&&(f.checked=z[5][z[9]].furnish),K[0]&544&&(m.checked=z[5][z[9]].doors),K[0]&544&&(T.checked=z[5][z[9]].storage),K[0]&544&&(k.checked=z[5][z[9]].admin)},d(z){z&&_e(e),oe=!1,St(ee)}}}function Ic(i){let e,t,n,s,r,o=i[5][i[8]].name+"",a,l,c,f,h,u,p,g;return{c(){e=F("div"),t=F("div"),n=F("div"),n.textContent="Remove perms for?",s=J(),r=F("div"),a=qe(o),l=J(),c=F("div"),f=F("button"),f.textContent="Cancel",h=J(),u=F("button"),u.textContent="Confirm",I(n,"class","subTitle svelte-5ogbut"),I(r,"class","subTitle svelte-5ogbut"),Ae(r,"margin-bottom","1vh"),I(f,"class","permButton svelte-5ogbut"),Ae(f,"background-color","#502323"),Ae(f,"border","1px solid #dd3636"),I(u,"class","permButton svelte-5ogbut"),I(c,"class","permButtons svelte-5ogbut"),Ae(c,"position","relative"),Ae(c,"left","50%"),Ae(c,"transform","translateX(-50%)"),Ae(c,"font-size","1.75vh"),I(t,"class","modal svelte-5ogbut"),I(e,"class","blurDiv svelte-5ogbut")},m(v,m){Me(v,e,m),E(e,t),E(t,n),E(t,s),E(t,r),E(r,a),E(t,l),E(t,c),E(c,f),E(c,h),E(c,u),p||(g=[he(f,"click",i[20]),he(u,"click",i[21])],p=!0)},p(v,m){m[0]&288&&o!==(o=v[5][v[8]].name+"")&&Bt(a,o)},d(v){v&&_e(e),p=!1,St(g)}}}function Uc(i){let e,t,n,s,r,o,a,l,c,f,h,u,p,g,v,m,d,M,b,x,y,T,L,w,_,S,B,k,C,U,N,j,D,V,W,Q;return{c(){e=F("div"),t=F("div"),n=F("div"),n.textContent="Players ID",s=J(),r=F("input"),o=J(),a=F("label"),l=F("input"),c=J(),f=F("span"),h=qe(`
						Furnish`),u=J(),p=F("label"),g=F("input"),v=J(),m=F("span"),d=qe(`
						Unlock/lock Doors`),M=J(),b=F("label"),x=F("input"),y=J(),T=F("span"),L=qe(`
						Storages`),w=J(),_=F("label"),S=F("input"),B=J(),k=F("span"),C=qe(`
						Admin`),U=J(),N=F("div"),j=F("button"),j.textContent="Cancel",D=J(),V=F("button"),V.textContent="Confirm",I(n,"class","subTitle svelte-5ogbut"),I(r,"class","modalInput svelte-5ogbut"),I(r,"type","number"),I(l,"type","checkbox"),I(l,"class","svelte-5ogbut"),I(f,"class","checkmark svelte-5ogbut"),I(a,"class","checkboxInput svelte-5ogbut"),I(g,"type","checkbox"),I(g,"class","svelte-5ogbut"),I(m,"class","checkmark svelte-5ogbut"),I(p,"class","checkboxInput svelte-5ogbut"),I(x,"type","checkbox"),I(x,"class","svelte-5ogbut"),I(T,"class","checkmark svelte-5ogbut"),I(b,"class","checkboxInput svelte-5ogbut"),I(S,"type","checkbox"),I(S,"class","svelte-5ogbut"),I(k,"class","checkmark svelte-5ogbut"),I(_,"class","checkboxInput svelte-5ogbut"),I(j,"class","permButton svelte-5ogbut"),Ae(j,"background-color","#502323"),Ae(j,"border","1px solid #dd3636"),I(V,"class","permButton svelte-5ogbut"),I(N,"class","permButtons svelte-5ogbut"),Ae(N,"position","relative"),Ae(N,"left","50%"),Ae(N,"transform","translateX(-50%)"),Ae(N,"font-size","1.75vh"),I(t,"class","modal svelte-5ogbut"),I(e,"class","blurDiv svelte-5ogbut")},m(oe,ee){Me(oe,e,ee),E(e,t),E(t,n),E(t,s),E(t,r),Ft(r,i[7].id),E(t,o),E(t,a),E(a,l),l.checked=i[7].furnish,E(a,c),E(a,f),E(a,h),E(t,u),E(t,p),E(p,g),g.checked=i[7].doors,E(p,v),E(p,m),E(p,d),E(t,M),E(t,b),E(b,x),x.checked=i[7].storage,E(b,y),E(b,T),E(b,L),E(t,w),E(t,_),E(_,S),S.checked=i[7].admin,E(_,B),E(_,k),E(_,C),E(t,U),E(t,N),E(N,j),E(N,D),E(N,V),W||(Q=[he(r,"input",i[22]),he(l,"change",i[23]),he(g,"change",i[24]),he(x,"change",i[25]),he(S,"change",i[26]),he(j,"click",i[27]),he(V,"click",i[28])],W=!0)},p(oe,ee){ee[0]&128&&Rs(r.value)!==oe[7].id&&Ft(r,oe[7].id),ee[0]&128&&(l.checked=oe[7].furnish),ee[0]&128&&(g.checked=oe[7].doors),ee[0]&128&&(x.checked=oe[7].storage),ee[0]&128&&(S.checked=oe[7].admin)},d(oe){oe&&_e(e),W=!1,St(Q)}}}function A1(i){let e,t,n,s,r,o,a,l,c,f,h;return{c(){e=F("div"),t=F("div"),t.textContent="WALL COLOR",n=J(),s=F("input"),r=J(),o=F("div"),a=F("button"),a.textContent="Reset",l=J(),c=F("button"),c.textContent="Confirm",I(t,"class","subTitle svelte-5ogbut"),I(s,"type","color"),I(s,"class","wallColor svelte-5ogbut"),I(a,"class","permButton svelte-5ogbut"),Ae(a,"background-color","#502323"),Ae(a,"border","1px solid #dd3636"),I(c,"class","permButton svelte-5ogbut"),I(o,"class","permButtons svelte-5ogbut"),Ae(o,"position","relative"),Ae(o,"left","50%"),Ae(o,"transform","translateX(-50%)"),Ae(o,"margin-top","1vh"),I(e,"class","leftWrapper svelte-5ogbut")},m(u,p){Me(u,e,p),E(e,t),E(e,n),E(e,s),Ft(s,i[10]),E(e,r),E(e,o),E(o,a),E(o,l),E(o,c),f||(h=[he(s,"input",i[30]),he(a,"click",i[31]),he(c,"click",i[32])],f=!0)},p(u,p){p[0]&1024&&Ft(s,u[10])},d(u){u&&_e(e),f=!1,St(h)}}}function C1(i){let e,t,n,s,r=i[4],o=[];for(let a=0;a<r.length;a+=1)o[a]=zc(Lc(i,r,a));return{c(){e=F("div"),t=F("div"),t.textContent="Styles",n=J(),s=F("div");for(let a=0;a<o.length;a+=1)o[a].c();I(t,"class","subTitle svelte-5ogbut"),I(s,"class","iplThemeList svelte-5ogbut"),I(e,"class","leftWrapper svelte-5ogbut"),Ae(e,"top","7.5vh")},m(a,l){Me(a,e,l),E(e,t),E(e,n),E(e,s);for(let c=0;c<o.length;c+=1)o[c]&&o[c].m(s,null)},p(a,l){if(l[0]&26){r=a[4];let c;for(c=0;c<r.length;c+=1){const f=Lc(a,r,c);o[c]?o[c].p(f,l):(o[c]=zc(f),o[c].c(),o[c].m(s,null))}for(;c<o.length;c+=1)o[c].d(1);o.length=r.length}},d(a){a&&_e(e),Ri(o,a)}}}function zc(i){let e,t=i[40]+"",n,s,r,o,a;function l(){return i[29](i[40])}return{c(){e=F("button"),n=qe(t),e.disabled=s=i[3]==i[40],I(e,"class",r=oa(i[3]==i[40]?"selectedIpl":"iplThemeButton")+" svelte-5ogbut")},m(c,f){Me(c,e,f),E(e,n),o||(a=he(e,"click",l),o=!0)},p(c,f){i=c,f[0]&16&&t!==(t=i[40]+"")&&Bt(n,t),f[0]&24&&s!==(s=i[3]==i[40])&&(e.disabled=s),f[0]&24&&r!==(r=oa(i[3]==i[40]?"selectedIpl":"iplThemeButton")+" svelte-5ogbut")&&I(e,"class",r)},d(c){c&&_e(e),o=!1,a()}}}function kc(i){let e,t,n=i[37].name+"",s,r,o,a,l,c,f,h,u;function p(){return i[33](i[36])}function g(){return i[34](i[36])}return{c(){e=F("div"),t=F("div"),s=qe(n),r=J(),o=F("div"),a=F("button"),a.textContent="Edit",l=J(),c=F("button"),c.textContent="Remove",f=J(),I(t,"class","permName svelte-5ogbut"),I(a,"class","permButton svelte-5ogbut"),I(c,"class","permButton svelte-5ogbut"),Ae(c,"background-color","#502323"),Ae(c,"border","1px solid #dd3636"),I(o,"class","permButtons svelte-5ogbut"),I(e,"class","permWrapper svelte-5ogbut")},m(v,m){Me(v,e,m),E(e,t),E(t,s),E(e,r),E(e,o),E(o,a),E(o,l),E(o,c),E(e,f),h||(u=[he(a,"click",p),he(c,"click",g)],h=!0)},p(v,m){i=v,m[0]&32&&n!==(n=i[37].name+"")&&Bt(s,n)},d(v){v&&_e(e),h=!1,St(u)}}}function P1(i){let e,t,n,s=i[0]&&Rc(i);return{c(){s&&s.c(),e=Pn()},m(r,o){s&&s.m(r,o),Me(r,e,o),t||(n=he(window,"keydown",i[13]),t=!0)},p(r,o){r[0]?s?s.p(r,o):(s=Rc(r),s.c(),s.m(e.parentNode,e)):s&&(s.d(1),s=null)},i:qt,o:qt,d(r){s&&s.d(r),r&&_e(e),t=!1,n()}}}const Nc="#e0e0e0";function Oc(i,e,t){return"#"+((1<<24)+(i<<16)+(e<<8)+t).toString(16).slice(1)}function L1(i,e,t){let n;Be(i,Fo,z=>t(11,n=z));let s=!1,r=0,o="mlo",a="Conservative",l=["Rich","Contrast","Vintage","Conservative","Warm","Cool","Polished","Ice","Classical"],c={firstID:{name:"Skeleton Networks",identifier:"das"},secndID:{name:"Barlos Higgins",identifier:"das"},thirdID:{name:"Skully Something",identifier:"das"},first2ID:{name:"Kevin Networks",identifier:"das"}},f=!1,h={propertyId:0,id:0,furnish:!1,doors:!1,storage:!1,admin:!1},u="",p="",g;It("openPanel",z=>{t(1,r=z.propertyId),t(2,o=z.propertyType),t(5,c=z.keyholders),z.propertyStyle&&(t(3,a=z.propertyStyle),t(4,l=z.propertyStyles)),t(8,u=""),t(9,p=""),z.wallColor?t(10,g=Oc(z.wallColor.r,z.wallColor.g,z.wallColor.b)):t(10,g=Nc),t(6,f=!1),t(0,s=!0)}),It("updatePanel",z=>{z.keyholders&&t(5,c=z.keyholders),z.propertyStyle&&(t(3,a=z.propertyStyle),t(4,l=z.propertyStyles)),z.wallColor?t(10,g=Oc(z.wallColor.r,z.wallColor.g,z.wallColor.b)):t(10,g=Nc)});function v(){t(7,h={propertyId:r,id:0,furnish:!1,doors:!1,storage:!1,admin:!1}),t(6,f=!0)}function m(z){if(z=z||event,!(!s||f)){switch(z.keyCode){case 27:t(0,s=!1),it("returnNUI");break}z.preventDefault()}}function d(){c[p].furnish=this.checked,t(5,c)}function M(){c[p].doors=this.checked,t(5,c)}function b(){c[p].storage=this.checked,t(5,c)}function x(){c[p].admin=this.checked,t(5,c)}const y=()=>t(9,p=""),T=()=>{it("editKeyholder",{propertyId:r,identifier:c[p].identifier,newdata:c[p]}),t(9,p="")},L=()=>t(8,u=""),w=()=>{it("removeKeyholder",{propertyId:r,identifier:c[u].identifier}),t(8,u="")};function _(){h.id=Rs(this.value),t(7,h)}function S(){h.furnish=this.checked,t(7,h)}function B(){h.doors=this.checked,t(7,h)}function k(){h.storage=this.checked,t(7,h)}function C(){h.admin=this.checked,t(7,h)}const U=()=>t(6,f=!1),N=()=>{it("addKeyholder",h),t(6,f=!1)},j=z=>it("updatePropertyStyle",{propertyId:r,style:z});function D(){g=this.value,t(10,g)}return[s,r,o,a,l,c,f,h,u,p,g,n,v,m,d,M,b,x,y,T,L,w,_,S,B,k,C,U,N,j,D,()=>it("updateWallColor",{propertyId:r}),()=>it("updateWallColor",{propertyId:r,newColor:g}),z=>t(9,p=z),z=>t(8,u=z),()=>{it("startDecorating"),t(0,s=!1)}]}class R1 extends at{constructor(e){super(),ot(this,e,L1,P1,rt,{},null,[-1,-1])}}function D1(i,e,t){const n=i.getContext("2d");if(!n)throw new Error("Failed to get 2D context.");const s=document.createElement("canvas"),r=s.getContext("2d");if(!r)throw new Error("Failed to get 2D context for temporary canvas.");s.width=i.width,s.height=i.height,r.drawImage(i,0,0),i.width=e,i.height=t,n.drawImage(s,0,0,s.width,s.height,0,0,i.width,i.height)}async function I1(i){return new Promise((e,t)=>{const n=new Image;n.onload=()=>{try{const s=document.createElement("canvas"),r=s.getContext("2d");if(!r)throw new Error("Failed to get 2D context.");const o=Math.min(n.width,n.height),a=(n.width-o)/2,l=(n.height-o)/2;s.width=o,s.height=o,r.drawImage(n,a,l,o,o,0,0,o,o);const c=r.getImageData(0,0,o,o),f=c.data;for(let h=0;h<f.length;h+=4){const u=f[h],p=f[h+1],g=f[h+2];p>(u+g)*.8&&(f[h+3]=0)}r.putImageData(c,0,0),r.globalAlpha=1;for(let h=-1;h<=1;h++)for(let u=-1;u<=1;u++)r.drawImage(s,u,h);D1(s,150,150),e(s.toDataURL()),s.remove()}catch(s){t(s)}finally{n.remove()}},n.onerror=()=>t("Image load error"),n.src=i})}function Fc(i){let e,t,n,s,r,o,a,l,c,f,h,u,p,g,v;return f=new Bu({props:{$$slots:{default:[z1]},$$scope:{ctx:i}}}),u=new ef({props:{keys:[{key:"W",text:"Transform"},{key:"R",text:"Rotate"},{key:"ENTER",text:"Screenshot"}]}}),{c(){e=F("div"),t=F("div"),n=J(),s=F("div"),r=F("div"),o=F("div"),o.textContent="Change Model",a=J(),l=F("input"),c=J(),Fe(f.$$.fragment),h=J(),Fe(u.$$.fragment),I(t,"class","blackbar svelte-1i44iqv"),I(o,"class","inputTitle svelte-1i44iqv"),I(l,"class","input svelte-1i44iqv"),I(r,"class","inputWrapper svelte-1i44iqv"),I(s,"class","blackbar svelte-1i44iqv"),Ae(s,"right","0vh"),I(e,"class","modeler z-[0] absolute h-screen w-screen")},m(m,d){Me(m,e,d),E(e,t),E(e,n),E(e,s),E(s,r),E(r,o),E(r,a),E(r,l),E(e,c),Ne(f,e,null),Me(m,h,d),Ne(u,m,d),p=!0,g||(v=[he(l,"change",i[15]),he(l,"focus",i[16]),he(l,"blur",i[17])],g=!0)},p(m,d){const M={};d&4194519&&(M.$$scope={dirty:d,ctx:m}),f.$set(M)},i(m){p||(le(f.$$.fragment,m),le(u.$$.fragment,m),p=!0)},o(m){ue(f.$$.fragment,m),ue(u.$$.fragment,m),p=!1},d(m){m&&_e(e),Oe(f),m&&_e(h),Oe(u,m),g=!1,St(v)}}}function U1(i){let e,t;return e=new Xu({props:{mode:i[4],translationSnap:.001,rotationSnap:mt.degToRad(1),size:.5,space:N1}}),e.$on("objectChange",i[18]),{c(){Fe(e.$$.fragment)},m(n,s){Ne(e,n,s),t=!0},p(n,s){const r={};s&16&&(r.mode=n[4]),e.$set(r)},i(n){t||(le(e.$$.fragment,n),t=!0)},o(n){ue(e.$$.fragment,n),t=!1},d(n){Oe(e,n)}}}function z1(i){let e,t,n,s,r;e=new ju({props:{position:i[6],lookAt:i[7],fov:60}});function o(l){i[19](l)}let a={type:Ee,"position.x":i[1].x,"position.y":i[1].y,"position.z":i[1].z,quaternion:5,geometry:new At(0,0,0),material:new Ru,"rotation.x":i[2].x,"rotation.y":i[2].y,"rotation.z":i[2].z,$$slots:{default:[U1]},$$scope:{ctx:i}};return i[0]!==void 0&&(a.ref=i[0]),n=new Qu({props:a}),xn.push(()=>Vs(n,"ref",o)),{c(){Fe(e.$$.fragment),t=J(),Fe(n.$$.fragment)},m(l,c){Ne(e,l,c),Me(l,t,c),Ne(n,l,c),r=!0},p(l,c){const f={};c&64&&(f.position=l[6]),c&128&&(f.lookAt=l[7]),e.$set(f);const h={};c&2&&(h["position.x"]=l[1].x),c&2&&(h["position.y"]=l[1].y),c&2&&(h["position.z"]=l[1].z),c&4&&(h["rotation.x"]=l[2].x),c&4&&(h["rotation.y"]=l[2].y),c&4&&(h["rotation.z"]=l[2].z),c&4194320&&(h.$$scope={dirty:c,ctx:l}),!s&&c&1&&(s=!0,h.ref=l[0],Hs(()=>s=!1)),n.$set(h)},i(l){r||(le(e.$$.fragment,l),le(n.$$.fragment,l),r=!0)},o(l){ue(e.$$.fragment,l),ue(n.$$.fragment,l),r=!1},d(l){Oe(e,l),l&&_e(t),Oe(n,l)}}}function k1(i){let e,t,n,s,r=i[3]&&Fc(i);return{c(){r&&r.c(),e=Pn()},m(o,a){r&&r.m(o,a),Me(o,e,a),t=!0,n||(s=[he(window,"keydown",i[13]),he(window,"click",i[12])],n=!0)},p(o,[a]){o[3]?r?(r.p(o,a),a&8&&le(r,1)):(r=Fc(o),r.c(),le(r,1),r.m(e.parentNode,e)):r&&(ln(),ue(r,1,1,()=>{r=null}),cn())},i(o){t||(le(r),t=!0)},o(o){ue(r),t=!1},d(o){r&&r.d(o),o&&_e(e),n=!1,St(s)}}}let N1="local";function O1(i,e,t){let n,s,r,o,a=!1;const{cameraPosition:l,cameraLookAt:c,objectPosition:f,objectEuler:h}=Lt;Be(i,l,_=>t(6,r=_)),Be(i,c,_=>t(7,o=_)),Be(i,f,_=>t(1,n=_)),Be(i,h,_=>t(2,s=_));let u,p="translate",g=!1;function v(_){!a||_&&_.target&&_.target.localName&&(_.target.localName=="main"||_.target.localName=="canvas")&&document.activeElement.blur()}function m(_){if(!(_.repeat||!a))switch(_.keyCode){case 27:it("closeimageTransform"),_.preventDefault();break;case 87:t(4,p="translate"),_.preventDefault();break;case 82:t(4,p="rotate"),_.preventDefault();break;case 13:if(g)return;it("grabImage"),_.preventDefault();break}}function d(_){return _.x!=n.x||_.y!=n.y||_.z!=n.z}function M(_){return _.x!=s.x||_.y!=s.y||_.z!=s.z}function b(){if(u&&(d(u.position)&&(bt(f,n.x=u.position.x,n),bt(f,n.y=u.position.y,n),bt(f,n.z=u.position.z,n),it("updatePropCoords",Dt(n))),M(u.rotation))){bt(h,s.x=u.rotation.x,s),bt(h,s.y=u.rotation.y,s),bt(h,s.z=u.rotation.z,s);const _=Dt(s);it("updatePropRotation",{x:mt.radToDeg(_.x).toFixed(2),y:mt.radToDeg(_.y).toFixed(2),z:mt.radToDeg(_.z).toFixed(2)})}}It("imageModel",_=>{_.objectPosition&&Lt.objectPosition.set(oi(_.objectPosition)),_.objectRotation&&Lt.objectEuler.set(new mi(mt.degToRad(_.objectRotation.x),mt.degToRad(_.objectRotation.z),mt.degToRad(_.objectRotation.y),"YZX")),_.cameraPosition&&Lt.cameraPosition.set(oi(_.cameraPosition)),_.cameraLookAt&&Lt.cameraLookAt.set(oi(_.cameraLookAt)),_.entity&&Lt.entity.set(_.entity),t(3,a=!0)}),It("unSelectModel",()=>{t(3,a=!1),Lt.selectedID.set(0)}),It("updateCamera",_=>{Lt.cameraPosition.set(oi(_.cameraPosition)),Lt.cameraLookAt.set(oi(_.cameraLookAt))}),It("removeFurnitureBackground",async _=>{const S=await I1(_);it("uploadFurnitureImage",S)});const x=_=>it("updateTransformModel",_.target.value),y=()=>t(5,g=!0),T=()=>t(5,g=!1),L=_=>{b()};function w(_){u=_,t(0,u)}return i.$$.update=()=>{i.$$.dirty&7&&u&&(u.rotation.set(s.x,s.y,s.z,s.order),u.position.set(n.x,n.y,n.z))},[u,n,s,a,p,g,r,o,l,c,f,h,v,m,b,x,y,T,L,w]}class F1 extends at{constructor(e){super(),ot(this,e,O1,k1,rt,{})}}function Bc(i,e,t){const n=i.slice();return n[2]=e[t],n}function Gc(i){let e,t,n,s=i[1],r=[];for(let o=0;o<s.length;o+=1)r[o]=Vc(Bc(i,s,o));return{c(){e=F("div");for(let o=0;o<r.length;o+=1)r[o].c();I(e,"class","wrapper svelte-b8dfu9")},m(o,a){Me(o,e,a);for(let l=0;l<r.length;l+=1)r[l]&&r[l].m(e,null);n=!0},p(o,a){if(i=o,a&2){s=i[1];let l;for(l=0;l<s.length;l+=1){const c=Bc(i,s,l);r[l]?r[l].p(c,a):(r[l]=Vc(c),r[l].c(),r[l].m(e,null))}for(;l<r.length;l+=1)r[l].d(1);r.length=s.length}},i(o){n||(Bn(()=>{!n||(t||(t=Gn(e,hi,{duration:400,x:0,y:500,opacity:0,easing:Hn},!0)),t.run(1))}),n=!0)},o(o){t||(t=Gn(e,hi,{duration:400,x:0,y:500,opacity:0,easing:Hn},!1)),t.run(0),n=!1},d(o){o&&_e(e),Ri(r,o),o&&t&&t.end()}}}function Hc(i){let e,t,n=i[2].key+"",s,r,o,a=i[2].text+"",l,c;return{c(){e=F("div"),t=F("div"),s=qe(n),r=J(),o=F("span"),l=qe(a),c=J(),I(t,"class","KeyButton svelte-b8dfu9"),I(e,"class","keyWrapper svelte-b8dfu9")},m(f,h){Me(f,e,h),E(e,t),E(t,s),E(e,r),E(e,o),E(o,l),E(e,c)},p(f,h){h&2&&n!==(n=f[2].key+"")&&Bt(s,n),h&2&&a!==(a=f[2].text+"")&&Bt(l,a)},d(f){f&&_e(e)}}}function Vc(i){let e,t=i[2].key&&Hc(i);return{c(){t&&t.c(),e=Pn()},m(n,s){t&&t.m(n,s),Me(n,e,s)},p(n,s){n[2].key?t?t.p(n,s):(t=Hc(n),t.c(),t.m(e.parentNode,e)):t&&(t.d(1),t=null)},d(n){t&&t.d(n),n&&_e(e)}}}function B1(i){let e,t,n=i[0]&&Gc(i);return{c(){n&&n.c(),e=Pn()},m(s,r){n&&n.m(s,r),Me(s,e,r),t=!0},p(s,[r]){s[0]?n?(n.p(s,r),r&1&&le(n,1)):(n=Gc(s),n.c(),le(n,1),n.m(e.parentNode,e)):n&&(ln(),ue(n,1,1,()=>{n=null}),cn())},i(s){t||(le(n),t=!0)},o(s){ue(n),t=!1},d(s){n&&n.d(s),s&&_e(e)}}}function G1(i,e,t){let n=!1,s=[{key:"SPACE",text:"Freecam"},{key:"W",text:"Transform"},{key:"R",text:"Rotate"},{key:"L",text:"Local/World"}];return It("showControls",r=>{t(1,s=r),t(0,n=!0)}),It("hideControls",()=>{t(0,n=!1)}),[n,s]}class H1 extends at{constructor(e){super(),ot(this,e,G1,B1,rt,{})}}function V1(i){let e;return{c(){e=F("div"),I(e,"class","mainDiv svelte-a0rpam")},m(t,n){Me(t,e,n),i[1](e)},p:qt,i:qt,o:qt,d(t){t&&_e(e),i[1](null)}}}function W1(i){return new Intl.NumberFormat("en-US",{style:"currency",currency:"USD",minimumFractionDigits:0,maximumFractionDigits:0}).format(i)}function j1(i,e,t){let n;It("showMoneyPopup",r=>{const o=document.createElement("div");o.classList.add("particleDiv");let a="+";r<0&&(a="",o.style.color="rgb(255, 65, 65)",o.style.textShadow="0 0 1vh rgba(255, 65, 65, 0.445)"),o.textContent=a+W1(r),n==null||n.appendChild(o),o.addEventListener("animationend",()=>{o.remove()})});function s(r){xn[r?"unshift":"push"](()=>{n=r,t(0,n)})}return[n,s]}class X1 extends at{constructor(e){super(),ot(this,e,j1,V1,rt,{})}}function q1(i,e,t){let n;return Be(i,Jo,s=>t(0,n=s)),It("playSound",s=>{const r=new Audio(`${n}/sounds/${s.fileName}`);r.volume=Math.max(0,Math.min(s.volume,1)),r.play()}),[]}class Y1 extends at{constructor(e){super(),ot(this,e,q1,null,rt,{})}}function Z1(i){let e,t,n,s,r,o,a,l,c,f,h,u,p,g,v,m,d;t=new y1({}),s=new T1({}),o=new R1({}),l=new F1({}),f=new H1({}),u=new X1({}),g=new Y1({});let M=!1;return{c(){e=F("main"),Fe(t.$$.fragment),n=J(),Fe(s.$$.fragment),r=J(),Fe(o.$$.fragment),a=J(),Fe(l.$$.fragment),c=J(),Fe(f.$$.fragment),h=J(),Fe(u.$$.fragment),p=J(),Fe(g.$$.fragment),v=J(),m=Pn(),I(e,"id","main"),I(e,"class","svelte-a4h32x")},m(b,x){Me(b,e,x),Ne(t,e,null),E(e,n),Ne(s,e,null),E(e,r),Ne(o,e,null),E(e,a),Ne(l,e,null),E(e,c),Ne(f,e,null),E(e,h),Ne(u,e,null),E(e,p),Ne(g,e,null),Me(b,v,x),Me(b,m,x),d=!0},p(b,[x]){},i(b){d||(le(t.$$.fragment,b),le(s.$$.fragment,b),le(o.$$.fragment,b),le(l.$$.fragment,b),le(f.$$.fragment,b),le(u.$$.fragment,b),le(g.$$.fragment,b),le(M),d=!0)},o(b){ue(t.$$.fragment,b),ue(s.$$.fragment,b),ue(o.$$.fragment,b),ue(l.$$.fragment,b),ue(f.$$.fragment,b),ue(u.$$.fragment,b),ue(g.$$.fragment,b),ue(M),d=!1},d(b){b&&_e(e),Oe(t),Oe(s),Oe(o),Oe(l),Oe(f),Oe(u),Oe(g),b&&_e(v),b&&_e(m)}}}function K1(i,e,t){let n,s,r,o,a,l,c;return Be(i,Sr,f=>t(1,n=f)),Be(i,Go,f=>t(2,s=f)),Be(i,xr,f=>t(3,r=f)),Be(i,Bo,f=>t(4,o=f)),Be(i,$o,f=>t(0,a=f)),Be(i,Cr,f=>t(5,l=f)),Be(i,Fo,f=>t(6,c=f)),It("initFurniture",f=>{bt(Bo,o=f.sections,o),bt(Go,s=f.furniture,s),bt(Fo,c=f.maxKeyholders,c),o.forEach(async function(h){const u=await mr("categories",h);bt(xr,r[h]=u,r)}),s.forEach(async function(h){const u=await mr("furniture",h.model);bt(Sr,n[h.model]=u,n)})}),It("updateFurniture",f=>{bt(Cr,l=f,l),l.sort((h,u)=>h.distance-u.distance)}),It("tintImage",async f=>{const h=await W_(f.txd,f.tint);it("tintedImage",h)}),a&&(o.forEach(async function(f){const h=await mr("categories",f);bt(xr,r[f]=h,r)}),s.forEach(async function(f){const h=await mr("furniture",f.model);bt(Sr,n[f.model]=h,n)})),[a]}class Q1 extends at{constructor(e){super(),ot(this,e,K1,Z1,rt,{})}}new Q1({target:document.getElementById("app")});it("uiLoaded");
