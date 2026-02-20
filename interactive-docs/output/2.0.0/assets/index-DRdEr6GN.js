(function(){const ce=document.createElement("link").relList;if(ce&&ce.supports&&ce.supports("modulepreload"))return;for(const C of document.querySelectorAll('link[rel="modulepreload"]'))s(C);new MutationObserver(C=>{for(const fn of C)if(fn.type==="childList")for(const Wn of fn.addedNodes)Wn.tagName==="LINK"&&Wn.rel==="modulepreload"&&s(Wn)}).observe(document,{childList:!0,subtree:!0});function Sr(C){const fn={};return C.integrity&&(fn.integrity=C.integrity),C.referrerPolicy&&(fn.referrerPolicy=C.referrerPolicy),C.crossOrigin==="use-credentials"?fn.credentials="include":C.crossOrigin==="anonymous"?fn.credentials="omit":fn.credentials="same-origin",fn}function s(C){if(C.ep)return;C.ep=!0;const fn=Sr(C);fetch(C.href,fn)}})();const Uw={run(){return(function(ce){function Sr(n,r,t){return t.a=n,t.f=r,t}function s(n){return Sr(2,n,(function(r){return function(t){return n(r,t)}}))}function C(n){return Sr(3,n,(function(r){return function(t){return function(u){return n(r,t,u)}}}))}function fn(n){return Sr(4,n,(function(r){return function(t){return function(u){return function(o){return n(r,t,u,o)}}}}))}function Wn(n){return Sr(5,n,(function(r){return function(t){return function(u){return function(o){return function(a){return n(r,t,u,o,a)}}}}}))}function Ae(n){return Sr(6,n,(function(r){return function(t){return function(u){return function(o){return function(a){return function(i){return n(r,t,u,o,a,i)}}}}}}))}function gi(n){return Sr(7,n,(function(r){return function(t){return function(u){return function(o){return function(a){return function(i){return function(b){return n(r,t,u,o,a,i,b)}}}}}}}))}function e(n,r,t){return n.a===2?n.f(r,t):n(r)(t)}function d(n,r,t,u){return n.a===3?n.f(r,t,u):n(r)(t)(u)}function H(n,r,t,u,o){return n.a===4?n.f(r,t,u,o):n(r)(t)(u)(o)}function M(n,r,t,u,o,a){return n.a===5?n.f(r,t,u,o,a):n(r)(t)(u)(o)(a)}function Mn(n,r,t,u,o,a,i){return n.a===6?n.f(r,t,u,o,a,i):n(r)(t)(u)(o)(a)(i)}function ot(n,r,t,u,o,a,i,b){return n.a===7?n.f(r,t,u,o,a,i,b):n(r)(t)(u)(o)(a)(i)(b)}var _d=C((function(n,r,t){for(var u=Array(n),o=0;n>o;o++)u[o]=t(r+o);return u})),Ad=s((function(n,r){for(var t=Array(n),u=0;n>u&&r.b;u++)t[u]=r.a,r=r.b;return t.length=u,c(t,r)})),Cd=s((function(n,r){return r[n]})),jd=C((function(n,r,t){for(var u=t.length,o=Array(u),a=0;u>a;a++)o[a]=t[a];return o[n]=r,o})),zd=s((function(n,r){for(var t=r.length,u=Array(t+1),o=0;t>o;o++)u[o]=r[o];return u[t]=n,u})),Ud=C((function(n,r,t){for(var u=t.length-1;u>=0;u--)r=e(n,t[u],r);return r}));function at(n){throw Error("https://github.com/elm/core/blob/1.0.0/hints/"+n+".md")}function R(n,r){for(var t,u=[],o=Eo(n,r,0,u);o&&(t=u.pop());o=Eo(t.a,t.b,0,u));return o}function Eo(n,r,t,u){if(n===r)return!0;if(typeof n!="object"||n===null||r===null)return typeof n=="function"&&at(5),!1;if(t>100)return u.push(c(n,r)),!0;for(var o in 0>n.$&&(n=ta(n),r=ta(r)),n)if(!Eo(n[o],r[o],t+1,u))return!1;return!0}var Ld=s(R);function gn(n,r,t){if(typeof n!="object")return n===r?0:r>n?-1:1;if(n.$===void 0)return(t=gn(n.a,r.a))||(t=gn(n.b,r.b))?t:gn(n.c,r.c);for(;n.b&&r.b&&!(t=gn(n.a,r.a));n=n.b,r=r.b);return t||(n.b?1:r.b?-1:0)}var Kd=s((function(n,r){var t=gn(n,r);return 0>t?n0:t?Gm:Xm}));function c(n,r){return{a:n,b:r}}function En(n,r,t){return{a:n,b:r,c:t}}function U(n,r){var t={};for(var u in n)t[u]=n[u];for(var u in r)t[u]=r[u];return t}function K(n,r){if(typeof n=="string")return n+r;if(!n.b)return r;var t=Br(n.a,r);n=n.b;for(var u=t;n.b;n=n.b)u=u.b=Br(n.a,r);return t}var $={$:0};function Br(n,r){return{$:1,a:n,b:r}}var Dd=s(Br);function f(n){for(var r=$,t=n.length;t--;)r=Br(n[t],r);return r}function Po(n){for(var r=[];n.b;n=n.b)r.push(n.a);return r}var Sd=C((function(n,r,t){for(var u=[];r.b&&t.b;r=r.b,t=t.b)u.push(e(n,r.a,t.a));return f(u)})),Td=s((function(n,r){return f(Po(r).sort((function(t,u){return gn(n(t),n(u))})))})),Wd=s((function(n,r){return n+r})),qd=s((function(n,r){for(var t=r.length,u=Array(t),o=0;t>o;){var a=r.charCodeAt(o);55296>a||a>56319?(u[o]=n(r[o]),o++):(u[o]=n(r[o]+r[o+1]),o+=2)}return u.join("")})),Zd=C((function(n,r,t){for(var u=t.length,o=0;u>o;){var a=t[o],i=t.charCodeAt(o);o++,55296>i||i>56319||(a+=t[o],o++),r=e(n,a,r)}return r})),Id=C((function(n,r,t){for(var u=t.length;u--;){var o=t[u],a=t.charCodeAt(u);56320>a||a>57343||(o=t[--u]+o),r=e(n,o,r)}return r})),Ed=s((function(n,r){return r.split(n)})),Pd=s((function(n,r){return r.join(n)})),Od=C((function(n,r,t){return t.slice(n,r)})),Md=s((function(n,r){for(var t=r.length;t--;){var u=r[t],o=r.charCodeAt(t);if(56320>o||o>57343||(u=r[--t]+u),n(u))return!0}return!1})),Bd=s((function(n,r){return r.indexOf(n)>-1})),Nd=s((function(n,r){return r.indexOf(n)===0})),Vd=s((function(n,r){return r.length>=n.length&&r.lastIndexOf(n)===r.length-n.length})),Yd=s((function(n,r){var t=n.length;if(1>t)return $;for(var u=0,o=[];(u=r.indexOf(n,u))>-1;)o.push(u),u+=t;return f(o)}));function $i(n){return n+""}var Fd=s(Math.pow),Hd=s((function(n,r){var t=r%n;return n===0?at(11):t>0&&0>n||0>t&&n>0?t+n:t})),Rd=Math.ceil,Jd=Math.floor,Qd=Math.round,xi=Math.log;function Pt(n){return{$:2,b:n}}var Xd=Pt((function(n){return typeof n!="number"?wr("an INT",n):n>-2147483647&&2147483647>n&&(0|n)===n?J(n):!isFinite(n)||n%1?wr("an INT",n):J(n)})),Gd=Pt((function(n){return typeof n=="boolean"?J(n):wr("a BOOL",n)})),nm=Pt((function(n){return typeof n=="number"?J(n):wr("a FLOAT",n)})),rm=Pt((function(n){return J(n)})),em=Pt((function(n){return typeof n=="string"?J(n):n instanceof String?J(n+""):wr("a STRING",n)})),tm=s((function(n,r){return{$:6,d:n,b:r}}));function Oo(n,r){return{$:9,f:n,g:r}}var um=s((function(n,r){return Oo(n,[r])})),om=C((function(n,r,t){return Oo(n,[r,t])})),am=fn((function(n,r,t,u){return Oo(n,[r,t,u])})),cm=s((function(n,r){return Tr(n,r)}));function Tr(n,r){switch(n.$){case 2:return n.b(r);case 5:return r===null?J(n.c):wr("null",r);case 3:return Lu(r)?wi(n.b,r,f):wr("a LIST",r);case 4:return Lu(r)?wi(n.b,r,im):wr("an ARRAY",r);case 6:var t=n.d;if(typeof r!="object"||r===null||!(t in r))return wr("an OBJECT with a field named `"+t+"`",r);var u=Tr(n.b,r[t]);return Vr(u)?u:pn(e(Ri,t,u.a));case 7:var o=n.e;return Lu(r)?o>=r.length?wr("a LONGER array. Need index "+o+" but only see "+r.length+" entries",r):(u=Tr(n.b,r[o]),Vr(u)?u:pn(e(Ji,o,u.a))):wr("an ARRAY",r);case 8:if(typeof r!="object"||r===null||Lu(r))return wr("an OBJECT",r);var a=$;for(var i in r)if(r.hasOwnProperty(i)){if(u=Tr(n.b,r[i]),!Vr(u))return pn(e(Ri,i,u.a));a=Br(c(i,u.a),a)}return J(qn(a));case 9:for(var b=n.f,l=n.g,p=0;l.length>p;p++){if(u=Tr(l[p],r),!Vr(u))return u;b=b(u.a)}return J(b);case 10:return u=Tr(n.b,r),Vr(u)?Tr(n.h(u.a),r):u;case 11:for(var g=$,k=n.g;k.b;k=k.b){if(u=Tr(k.a,r),Vr(u))return u;g=Br(u.a,g)}return pn(o0(qn(g)));case 1:return pn(e(Hi,n.a,r));case 0:return J(n.a)}}function wi(n,r,t){for(var u=r.length,o=Array(u),a=0;u>a;a++){var i=Tr(n,r[a]);if(!Vr(i))return pn(e(Ji,a,i.a));o[a]=i.a}return J(t(o))}function Lu(n){return Array.isArray(n)||typeof FileList<"u"&&n instanceof FileList}function im(n){return e(l0,n.length,(function(r){return n[r]}))}function wr(n,r){return pn(e(Hi,"Expecting "+n,r))}function ct(n,r){if(n===r)return!0;if(n.$!==r.$)return!1;switch(n.$){case 0:case 1:return n.a===r.a;case 2:return n.b===r.b;case 5:return n.c===r.c;case 3:case 4:case 8:return ct(n.b,r.b);case 6:return n.d===r.d&&ct(n.b,r.b);case 7:return n.e===r.e&&ct(n.b,r.b);case 9:return n.f===r.f&&yi(n.g,r.g);case 10:return n.h===r.h&&ct(n.b,r.b);case 11:return yi(n.g,r.g)}}function yi(n,r){var t=n.length;if(t!==r.length)return!1;for(var u=0;t>u;u++)if(!ct(n[u],r[u]))return!1;return!0}function Ku(n){return n}var fm=C((function(n,r,t){return t[n]=r,t}));function it(n){return{$:0,a:n}}function ie(n){return{$:2,b:n,c:null}}var Mo=s((function(n,r){return{$:3,b:n,d:r}})),bm=s((function(n,r){return{$:4,b:n,d:r}})),sm=0;function Bo(n){var r={$:0,e:sm++,f:n,g:null,h:[]};return Vo(r),r}function _i(n){return ie((function(r){r(it(Bo(n)))}))}function Ai(n,r){n.h.push(r),Vo(n)}var lm=s((function(n,r){return ie((function(t){Ai(n,r),t(it(0))}))})),No=!1,Ci=[];function Vo(n){if(Ci.push(n),!No){for(No=!0;n=Ci.shift();)dm(n);No=!1}}function dm(n){for(;n.f;){var r=n.f.$;if(r===0||r===1){for(;n.g&&n.g.$!==r;)n.g=n.g.i;if(!n.g)return;n.f=n.g.b(n.f.a),n.g=n.g.i}else{if(r===2)return void(n.f.c=n.f.b((function(t){n.f=t,Vo(n)})));if(r===5){if(n.h.length===0)return;n.f=n.f.b(n.h.shift())}else n.g={$:r===3?0:1,b:n.f.b,i:n.g},n.f=n.f.d}}}var ft={};function ji(n,r,t,u,o){return{b:n,c:r,d:t,e:u,f:o}}function mm(n,r){var t={g:r,h:void 0},u=n.c,o=n.d,a=n.e,i=n.f;return t.h=Bo(e(Mo,(function b(l){return e(Mo,b,{$:5,b:function(p){var g=p.a;return p.$===0?d(o,t,g,l):a&&i?H(u,t,g.i,g.j,l):d(u,t,a?g.i:g.j,l)}})}),n.b))}var pm=s((function(n,r){return ie((function(t){n.g(r),t(it(0))}))})),vm=s((function(n,r){return e(lm,n.h,{$:0,a:r})}));function zi(n){return function(r){return{$:1,k:n,l:r}}}function Du(n){return{$:2,m:n}}var Su,Ui=[],Yo=!1;function Fo(n,r,t){if(Ui.push({p:n,q:r,r:t}),!Yo){Yo=!0;for(var u;u=Ui.shift();)km(u.p,u.q,u.r);Yo=!1}}function km(n,r,t){var u={};for(var o in Tu(!0,r,u,null),Tu(!1,t,u,null),n)Ai(n[o],{$:"fx",a:u[o]||{i:$,j:$}})}function Tu(n,r,t,u){switch(r.$){case 1:var o=r.k,a=(function(b,l,p,g){return e(b?ft[l].e:ft[l].f,(function(k){for(var h=p;h;h=h.t)k=h.s(k);return k}),g)})(n,o,u,r.l);return void(t[o]=(function(b,l,p){return p=p||{i:$,j:$},b?p.i=Br(l,p.i):p.j=Br(l,p.j),p})(n,a,t[o]));case 2:for(var i=r.m;i.b;i=i.b)Tu(n,i.a,t,u);return;case 3:return void Tu(n,r.o,t,{s:r.n,t:u})}}var fe=typeof document<"u"?document:{};function Ho(n,r){n.appendChild(r)}function Ro(n){return{$:0,a:n}}var Li=s((function(n,r){return s((function(t,u){for(var o=[],a=0;u.b;u=u.b){var i=u.a;a+=i.b||0,o.push(i)}return a+=o.length,{$:1,c:r,d:Si(t),e:o,f:n,b:a}}))})),tn=Li(void 0);s((function(n,r){return s((function(t,u){for(var o=[],a=0;u.b;u=u.b){var i=u.a;a+=i.b.b||0,o.push(i)}return a+=o.length,{$:2,c:r,d:Si(t),e:o,f:n,b:a}}))}))(void 0);var Jo,hm=s((function(n,r){return{$:4,j:n,k:r,b:1+(r.b||0)}})),gm=s((function(n,r){return{$:"a0",n,o:r}})),$m=s((function(n,r){return{$:"a1",n,o:r}})),Ki=s((function(n,r){return{$:"a2",n,o:r}})),er=s((function(n,r){return{$:"a3",n,o:r}})),xm=/^script$/i,wm=/^(on|formAction$)/i,ym=/^\s*j\s*a\s*v\s*a\s*s\s*c\s*r\s*i\s*p\s*t\s*:/i,_m=/^\s*(j\s*a\s*v\s*a\s*s\s*c\s*r\s*i\s*p\s*t\s*:|d\s*a\s*t\s*a\s*:\s*t\s*e\s*x\s*t\s*\/\s*h\s*t\s*m\s*l\s*(,|;))/i;function Di(n){return _m.test(n)?"":n}function Si(n){for(var r={};n.b;n=n.b){var t=n.a,u=t.$,o=t.n,a=t.o;if(u!=="a2"){var i=r[u]||(r[u]={});u==="a3"&&o==="class"?Ti(i,o,a):i[o]=a}else o==="className"?Ti(r,o,a):r[o]=a}return r}function Ti(n,r,t){var u=n[r];n[r]=u?u+" "+t:t}function Be(n,r){var t=n.$;if(t===5)return Be(n.k||(n.k=n.m()),r);if(t===0)return fe.createTextNode(n.a);if(t===4){for(var u=n.k,o=n.j;u.$===4;)typeof o!="object"?o=[o,u.j]:o.push(u.j),u=u.k;var a={j:o,p:r};return(i=Be(u,a)).elm_event_node_ref=a,i}if(t===3)return Qo(i=n.h(n.g),r,n.d),i;var i=n.f?fe.createElementNS(n.f,n.c):fe.createElement(n.c);Su&&n.c=="a"&&i.addEventListener("click",Su(i)),Qo(i,r,n.d);for(var b=n.e,l=0;b.length>l;l++)Ho(i,Be(t===1?b[l]:b[l].b,r));return i}function Qo(n,r,t){for(var u in t){var o=t[u];u==="a1"?Am(n,o):u==="a0"?zm(n,r,o):u==="a3"?Cm(n,o):u==="a4"?jm(n,o):(u!=="value"&&u!=="checked"||n[u]!==o)&&(n[u]=o)}}function Am(n,r){var t=n.style;for(var u in r)t[u]=r[u]}function Cm(n,r){for(var t in r){var u=r[t];u!==void 0?n.setAttribute(t,u):n.removeAttribute(t)}}function jm(n,r){for(var t in r){var u=r[t],o=u.f,a=u.o;a!==void 0?n.setAttributeNS(o,t,a):n.removeAttributeNS(o,t)}}function zm(n,r,t){var u=n.elmFs||(n.elmFs={});for(var o in t){var a=t[o],i=u[o];if(a){if(i){if(i.q.$===a.$){i.q=a;continue}n.removeEventListener(o,i)}i=Um(r,a),n.addEventListener(o,i,Jo&&{passive:2>sf(a)}),u[o]=i}else n.removeEventListener(o,i),u[o]=void 0}}try{window.addEventListener("t",null,Object.defineProperty({},"passive",{get:function(){Jo=!0}}))}catch{}function Um(n,r){function t(u){var o=t.q,a=Tr(o.a,u);if(Vr(a)){for(var i,b=sf(o),l=a.a,p=b?3>b?l.a:l.H:l,g=b==1?l.b:b==3&&l.bz,k=(g&&u.stopPropagation(),(b==2?l.b:b==3&&l.bu)&&u.preventDefault(),n);i=k.j;){if(typeof i=="function")p=i(p);else for(var h=i.length;h--;)p=i[h](p);k=k.p}k(p,g)}}return t.q=r,t}function Lm(n,r){return n.$==r.$&&ct(n.a,r.a)}function ar(n,r,t,u){var o={$:r,r:t,s:u,t:void 0,u:void 0};return n.push(o),o}function Wr(n,r,t,u){if(n!==r){var o=n.$,a=r.$;if(o!==a){if(o!==1||a!==2)return void ar(t,0,u,r);r=(function(z){for(var N=z.e,cn=N.length,dn=Array(cn),yn=0;cn>yn;yn++)dn[yn]=N[yn].b;return{$:1,c:z.c,d:z.d,e:dn,f:z.f,b:z.b}})(r),a=1}switch(a){case 5:for(var i=n.l,b=r.l,l=i.length,p=l===b.length;p&&l--;)p=i[l]===b[l];if(p)return void(r.k=n.k);r.k=r.m();var g=[];return Wr(n.k,r.k,g,0),void(g.length>0&&ar(t,1,u,g));case 4:for(var k=n.j,h=r.j,x=!1,L=n.k;L.$===4;)x=!0,typeof k!="object"?k=[k,L.j]:k.push(L.j),L=L.k;for(var Z=r.k;Z.$===4;)x=!0,typeof h!="object"?h=[h,Z.j]:h.push(Z.j),Z=Z.k;return x&&k.length!==h.length?void ar(t,0,u,r):((x?(function(z,N){for(var cn=0;z.length>cn;cn++)if(z[cn]!==N[cn])return!1;return!0})(k,h):k===h)||ar(t,2,u,h),void Wr(L,Z,t,u+1));case 0:return void(n.a!==r.a&&ar(t,3,u,r.a));case 1:return void Wi(n,r,t,u,Km);case 2:return void Wi(n,r,t,u,Dm);case 3:if(n.h!==r.h)return void ar(t,0,u,r);var B=Xo(n.d,r.d);B&&ar(t,4,u,B);var G=r.i(n.g,r.g);return void(G&&ar(t,5,u,G))}}}function Wi(n,r,t,u,o){if(n.c===r.c&&n.f===r.f){var a=Xo(n.d,r.d);a&&ar(t,4,u,a),o(n,r,t,u)}else ar(t,0,u,r)}function Xo(n,r,t){var u;for(var o in n)if(o!=="a1"&&o!=="a0"&&o!=="a3"&&o!=="a4")if(o in r){var a=n[o],i=r[o];a===i&&o!=="value"&&o!=="checked"||t==="a0"&&Lm(a,i)||((u=u||{})[o]=i)}else(u=u||{})[o]=t?t==="a1"?"":t==="a0"||t==="a3"?void 0:{f:n[o].f,o:void 0}:typeof n[o]=="string"?"":null;else{var b=Xo(n[o],r[o]||{},o);b&&((u=u||{})[o]=b)}for(var l in r)l in n||((u=u||{})[l]=r[l]);return u}function Km(n,r,t,u){var o=n.e,a=r.e,i=o.length,b=a.length;i>b?ar(t,6,u,{v:b,i:i-b}):b>i&&ar(t,7,u,{v:i,e:a});for(var l=b>i?i:b,p=0;l>p;p++){var g=o[p];Wr(g,a[p],t,++u),u+=g.b||0}}function Dm(n,r,t,u){for(var o=[],a={},i=[],b=n.e,l=r.e,p=b.length,g=l.length,k=0,h=0,x=u;p>k&&g>h;){var L=(Pe=b[k]).a,Z=(Oe=l[h]).a,B=Pe.b,G=Oe.b,z=void 0,N=void 0;if(L!==Z){var cn=b[k+1],dn=l[h+1];if(cn){var yn=cn.a,Sn=cn.b;N=Z===yn}if(dn){var P=dn.a,hr=dn.b;z=L===P}if(z&&N)Wr(B,hr,o,++x),Ot(a,o,L,G,h,i),x+=B.b||0,Mt(a,o,L,Sn,++x),x+=Sn.b||0,k+=2,h+=2;else if(z)x++,Ot(a,o,Z,G,h,i),Wr(B,hr,o,x),x+=B.b||0,k+=1,h+=2;else if(N)Mt(a,o,L,B,++x),x+=B.b||0,Wr(Sn,G,o,++x),x+=Sn.b||0,k+=2,h+=1;else{if(!cn||yn!==P)break;Mt(a,o,L,B,++x),Ot(a,o,Z,G,h,i),x+=B.b||0,Wr(Sn,hr,o,++x),x+=Sn.b||0,k+=2,h+=2}}else Wr(B,G,o,++x),x+=B.b||0,k++,h++}for(;p>k;){var Pe;x++,Mt(a,o,(Pe=b[k]).a,B=Pe.b,x),x+=B.b||0,k++}for(;g>h;){var Oe,gr=gr||[];Ot(a,o,(Oe=l[h]).a,Oe.b,void 0,gr),h++}(o.length>0||i.length>0||gr)&&ar(t,8,u,{w:o,x:i,y:gr})}var qi="_elmW6BL";function Ot(n,r,t,u,o,a){var i=n[t];if(!i)return a.push({r:o,A:i={c:0,z:u,r:o,s:void 0}}),void(n[t]=i);if(i.c===1){a.push({r:o,A:i}),i.c=2;var b=[];return Wr(i.z,u,b,i.r),i.r=o,void(i.s.s={w:b,A:i})}Ot(n,r,t+qi,u,o,a)}function Mt(n,r,t,u,o){var a=n[t];if(a){if(a.c===0){a.c=2;var i=[];return Wr(u,a.z,i,o),void ar(r,9,o,{w:i,A:a})}Mt(n,r,t+qi,u,o)}else{var b=ar(r,9,o,void 0);n[t]={c:1,z:u,r:o,s:b}}}function Zi(n,r,t,u){Bt(n,r,t,0,0,r.b,u)}function Bt(n,r,t,u,o,a,i){for(var b=t[u],l=b.r;l===o;){var p=b.$;if(p===1)Zi(n,r.k,b.s,i);else if(p===8)b.t=n,b.u=i,(g=b.s.w).length>0&&Bt(n,r,g,0,o,a,i);else if(p===9){b.t=n,b.u=i;var g,k=b.s;k&&(k.A.s=n,(g=k.w).length>0&&Bt(n,r,g,0,o,a,i))}else b.t=n,b.u=i;if(!(b=t[++u])||(l=b.r)>a)return u}var h=r.$;if(h===4){for(var x=r.k;x.$===4;)x=x.k;return Bt(n,x,t,u,o+1,a,n.elm_event_node_ref)}for(var L=r.e,Z=n.childNodes,B=0;L.length>B;B++){o++;var G=h===1?L[B]:L[B].b,z=o+(G.b||0);if(!(o>l||l>z||(b=t[u=Bt(Z[B],G,t,u,o,z,i)])&&(l=b.r)<=a))return u;o=z}return u}var Wu=null;function qu(n,r){for(var t=0;r.length>t;t++){var u=r[t],o=u.t,a=Sm(o,u);o===n&&(n=a)}return n}function Sm(n,r){switch(r.$){case 0:return(function(b,l,p){var g=b.parentNode,k=Be(l,p);return k.elm_event_node_ref||(k.elm_event_node_ref=b.elm_event_node_ref),g&&k!==b&&g.replaceChild(k,b),k})(n,r.s,r.u);case 4:return Qo(n,r.u,r.s),n;case 3:return n.replaceData(0,n.length,r.s),n;case 1:return qu(n,r.s);case 2:return n.elm_event_node_ref?n.elm_event_node_ref.j=r.s:n.elm_event_node_ref={j:r.s,p:r.u},n;case 6:for(var t=r.s,u=0;t.i>u;u++)n.removeChild(n.childNodes[t.v]);return n;case 7:for(var o=(t=r.s).e,a=n.childNodes[u=t.v];o.length>u;u++)n.insertBefore(Be(o[u],r.u),a);return n;case 9:if(!(t=r.s))return n.parentNode.removeChild(n),n;var i=t.A;return i.r!==void 0&&n.parentNode.removeChild(n),i.s=qu(n,t.w),n;case 8:return(function(b,l){var p=l.s,g=(function(B,G){if(B){for(var z=fe.createDocumentFragment(),N=0;B.length>N;N++){var cn=B[N].A;Ho(z,cn.c===2?cn.s:Be(cn.z,G.u))}return z}})(p.y,l);b=qu(b,p.w);for(var k=p.x,h=0;k.length>h;h++){var x=k[h],L=x.A,Z=L.c===2?L.s:Be(L.z,l.u);b.insertBefore(Z,b.childNodes[x.r])}return g&&Ho(b,g),b})(n,r);case 5:return r.s(n);default:at(10)}}function Ii(n){if(n.nodeType===3)return Ro(n.textContent);if(n.nodeType!==1)return Ro("");for(var r=$,t=n.attributes,u=t.length;u--;){var o=t[u];r=Br(e(er,o.name,o.value),r)}var a=n.tagName.toLowerCase(),i=$,b=n.childNodes;for(u=b.length;u--;)i=Br(Ii(b[u]),i);return d(tn,a,r,i)}var Tm=fn((function(n,r,t,u){return(function(o,a,i,b,l,p){var g=e(cm,o,a?a.flags:void 0);Vr(g)||at(2);var k={},h=i(g.a),x=h.a,L=p(B,x),Z=(function(z,N){var cn;for(var dn in ft){var yn=ft[dn];yn.a&&((cn=cn||{})[dn]=yn.a(dn,N)),z[dn]=mm(yn,N)}return cn})(k,B);function B(z,N){var cn=e(b,z,x);L(x=cn.a,N),Fo(k,cn.b,l(x))}Fo(k,h.b,l(x));var G=Z?{ports:Z}:{};return G.unmount=function(){L(x,!0),Fo(k,Du($),Du($)),k=null,x=null,L=null,Z=null;var z=Wu;if(Wu=null,z.elmFs){for(var N in z.elmFs)z.removeEventListener(N,z.elmFs[N]);delete z.elmFs}z.replaceChildren&&z.replaceChildren(),a&&a.node?z.replaceWith(a.node):z.remove()},G})(r,u,n.bj,n.cI,n.cA,(function(o,a){var i=n.bw&&n.bw(o),b=n.d0,l=fe.title,p=fe.body,g=Ii(p);return(function(k,h){h(k);var x=0;function L(){x=x===1?0:(Go(L),h(k),1)}return function(Z,B){k=Z,B?(h(k),x===2&&(x=1)):(x===0&&Go(L),x=2)}})(a,(function(k){Su=i;var h=b(k),x=tn("body")($)(h.cU),L=(function(Z,B){var G=[];return Wr(Z,B,G,0),G})(g,x);p=(function(Z,B,G,z){return G.length===0?Wu=Z:(Zi(Z,B,G,z),Wu=qu(Z,G))})(p,g,L,o),g=x,Su=0,l!==h.cD&&(fe.title=l=h.cD)}))}))})),Go=typeof requestAnimationFrame<"u"?requestAnimationFrame:function(n){return setTimeout(n,1e3/60)};function na(){return bb(fe.location.href).a||at(1)}var Wm=s((function(n,r){return e(Ta,Sa,ie((function(){history.pushState({},"",r),n()})))})),qm=s((function(n,r){return e(Ta,Sa,ie((function(){history.replaceState({},"",r),n()})))})),Ei={addEventListener:function(){},removeEventListener:function(){}},Zm=typeof document<"u"?document:Ei,Nt=typeof window<"u"?window:Ei,Im=C((function(n,r,t){return _i(ie((function(){function u(o){Bo(t(o))}return n.addEventListener(r,u,Jo&&{passive:!0}),function(){n.removeEventListener(r,u)}})))})),Em=s((function(n,r){var t=Tr(n,r);return Vr(t)?_(t.a):A}));function Pi(n,r){return ie((function(t){Go((function(){var u=document.getElementById(n);t(u?it(r(u)):{$:1,a:xp(n)})}))}))}var Zu,ra,Oi,bt,Pm=s((function(n,r){return Pi(r,(function(t){return t[n](),0}))})),Om=C((function(n,r,t){return Pi(n,(function(u){return u.scrollLeft=r,u.scrollTop=t,0}))})),Mm=Wn((function(n,r,t,u,o){for(var a=n.length,i=o.length>=r+a,b=0;i&&a>b;){var l=o.charCodeAt(r);i=n[b++]===o[r++]&&(l===10?(t++,u=1):(u++,(63488&l)==55296?n[b++]===o[r++]:1))}return En(i?r:-1,t,u)})),Bm=C((function(n,r,t){return t.length>r?(63488&t.charCodeAt(r))==55296?n(t.substr(r,2))?r+2:-1:n(t[r])?t[r]===`
`?-2:r+1:-1:-1})),Nm=C((function(n,r,t){return t.charCodeAt(r)===n})),Vm=s((function(n,r){for(;r.length>n;n++){var t=r.charCodeAt(n);if(48>t||t>57)return n}return n})),Ym=C((function(n,r,t){for(var u=0;t.length>r;r++){var o=t.charCodeAt(r)-48;if(0>o||o>=n)break;u=n*u+o}return c(r,u)})),Fm=s((function(n,r){for(var t=0;r.length>n;n++){var u=r.charCodeAt(n);if(u<48||57<u)if(u<65||70<u){if(97>u||u>102)break;t=16*t+u-87}else t=16*t+u-55;else t=16*t+u-48}return c(n,t)})),Mi=Wn((function(n,r,t,u,o){for(var a=o.indexOf(n,r),i=0>a?o.length:a+n.length;i>r;){var b=o.charCodeAt(r++);b===10?(u=1,t++):(u++,(63488&b)==55296&&r++)}return En(a,t,u)})),Hm=s((function(n,r){var t="g";n.dx&&(t+="m"),n.cV&&(t+="i");try{return _(RegExp(r,t))}catch{return A}})),Rm=s((function(n,r){return r.match(n)!==null})),Bi=C((function(n,r,t){for(var u,o=[],a=0,i=t,b=r.lastIndex,l=-1;a++<n&&(u=r.exec(i))&&l!=r.lastIndex;){for(var p=u.length-1,g=Array(p);p>0;){var k=u[p];g[--p]=k?_(k):A}o.push(H(ll,u[0],u.index,a,f(g))),l=r.lastIndex}return r.lastIndex=b,f(o)})),Jm=fn((function(n,r,t,u){var o=0;return u.replace(r,(function(a){if(o++>=n)return a;for(var i=arguments.length-3,b=Array(i);i>0;){var l=arguments[i];b[--i]=l?_(l):A}return t(H(ll,a,arguments[arguments.length-2],o,f(b)))}))})),Ni=1/0,m=Dd,ea=Ud,Vi=C((function(n,r,t){var u=t.c,o=t.d,a=s((function(i,b){return d(ea,i.$?n:a,b,i.a)}));return d(ea,a,d(ea,n,r,o),u)})),Qm=function(n){return d(Vi,m,$,n)},Yi=C((function(n,r,t){for(;;){if(t.$===-2)return r;var u=t.d,o=n,a=d(n,t.b,t.c,d(Yi,n,r,t.e));n=o,r=a,t=u}})),ta=function(n){return d(Yi,C((function(r,t,u){return e(m,c(r,t),u)})),$,n)},Xm=1,Gm=2,n0=0,r0=s((function(n,r){return r(n)})),Ne="2.0.0",_=function(n){return{$:0,a:n}},A={$:1},Jn=s((function(n,r){return e(Pd,n,Po(r))})),e0=s((function(n,r){return f(e(Ed,n,r))})),wn=C((function(n,r,t){return e(Jn,r,e(e0,n,t))})),Fi=d(wn,"$version$",Ne,"https://package.elm-lang.org/packages/agj/elm-knobs/$version$"),_n=function(n){return n},t0={df:!1},u0={cT:"",a7:2,db:!1,de:!1},pn=function(n){return{$:1,a:n}},Hi=s((function(n,r){return{$:3,a:n,b:r}})),Ri=s((function(n,r){return{$:0,a:n,b:r}})),Ji=s((function(n,r){return{$:1,a:n,b:r}})),J=function(n){return{$:0,a:n}},o0=function(n){return{$:2,a:n}},bn=$i,Bn=C((function(n,r,t){for(;;){if(!t.b)return r;var u=t.b,o=n,a=e(n,t.a,r);n=o,r=a,t=u}})),yr=function(n){return d(Bn,s((function(r,t){return t+1})),0,n)},Qi=Sd,a0=C((function(n,r,t){for(;;){if(gn(n,r)>=1)return t;var u=n,o=r-1,a=e(m,r,t);n=u,r=o,t=a}})),c0=s((function(n,r){return d(a0,n,r,$)})),Vt=s((function(n,r){return d(Qi,n,e(c0,0,yr(r)-1),r)})),Iu=function(n){var r=n.charCodeAt(0);return 55296>r||r>56319?r:1024*(r-55296)+n.charCodeAt(1)-56320+65536},ua=function(n){var r=Iu(n);return r>=97&&122>=r},Ve=function(n){var r=Iu(n);return 90>=r&&r>=65},oa=function(n){var r=Iu(n);return 57>=r&&r>=48},aa=function(n){return ua(n)||Ve(n)||oa(n)},qn=function(n){return d(Bn,m,$,n)},Eu=function(n){var r=n.charCodeAt(0);return isNaN(r)?A:_(55296>r||r>56319?c(n[0],n.slice(1)):c(n[0]+n[1],n.slice(2)))},mr=32,st=fn((function(n,r,t,u){return{$:0,a:n,b:r,c:t,d:u}})),lt=[],Xi=Rd,Gi=s((function(n,r){return xi(r)/xi(n)})),i0=function(n){return n},Nr=Xi(e(Gi,2,mr)),ca=H(st,0,Nr,lt,lt),nf=_d,ia=function(n){return{$:1,a:n}},rf=s((function(n,r){return n(r)})),Pu=Ld,ef=Jd,dt=function(n){return n.length},Yt=s((function(n,r){return gn(n,r)>0?n:r})),Ft=function(n){return{$:0,a:n}},fa=Ad,f0=s((function(n,r){for(;;){var t=e(fa,mr,n),u=t.b,o=e(m,Ft(t.a),r);if(!u.b)return qn(o);n=u,r=o}})),ba=function(n){return n.a},b0=s((function(n,r){for(;;){var t=Xi(r/mr);if(t===1)return e(fa,mr,n).a;n=e(f0,n,$),r=t}})),tf=s((function(n,r){if(r.n){var t=r.n*mr,u=ef(e(Gi,mr,t-1)),o=n?qn(r.r):r.r,a=e(b0,o,r.n);return H(st,dt(r.p)+t,e(Yt,5,u*Nr),a,r.p)}return H(st,dt(r.p),Nr,lt,r.p)})),s0=Wn((function(n,r,t,u,o){for(;;){if(0>r)return e(tf,!1,{r:u,n:t/mr|0,p:o});var a=ia(d(nf,mr,r,n));r-=mr,u=e(m,a,u)}})),l0=s((function(n,r){if(n>0){var t=n%mr;return M(s0,r,n-t-mr,n,$,d(nf,t,n-t,r))}return ca})),Vr=function(n){return!n.$},uf=Du,of=uf($),d0={di:A,ch:function(){return _n},cA:function(){return of}},m0={cP:"#ffffff",cT:"linear-gradient(150deg, #0087cf 0%, #56cfff 100%)",a9:"Fira Code",ba:"IBM Plex Sans",bb:"IBM Plex Serif",b0:A,be:!1,dc:A,bn:A,dy:"#bdecff",dz:"#ffffff",dA:"#ffffff",dP:!1,dV:"",bD:A},p0=s((function(n,r){return{bS:t0,bV:u0,cy:d0,bK:m0,cD:r,d_:n}})),v0=p0(_n),af={df:A},cf={cT:A,a7:A,db:A,de:A},Kn=C((function(n,r,t){return r(n(t))})),k0=qd,Yr=function(n){return n.trim()},sa=e(Kn,Yr,k0((function(n){return aa(n)?(function(r){return r.toLowerCase()})(n):"-"}))),mt=function(n){return{cU:"",bS:af,o:$,bV:cf,b2:A,bj:A,b8:!0,cD:n,cJ:"/"+sa(n)}},ff=function(n){return{$:1,a:n}},Vn=um,Ou=function(n){return{$:0,a:n}},la=function(n){return{k:!1,dY:_({c3:e(Vn,(function(){return la(n)}),Ou(0)),c7:function(){return null}}),d$:n,d0:ff($)}},Yn=$i,Ht=function(n){return'"'+d(wn,`
`,"\\n",d(wn,'"','\\"',n))+'"'},bf=function(n){return d(wn,"$float$",Yn(n.aH),d(wn,"$name$",Ht(n.L),"{ name = $name$, credits = $float$ }"))},pr=function(n){return{$:0,a:n}},h0=om,sf=function(n){switch(n.$){case 0:return 0;case 1:return 1;case 2:return 2;default:return 3}},Rt=Ku,cr=s((function(n,r){return e(Ki,n,Rt(r))})),j=cr("className"),pt=nm,vt=Ku,_r=tn("input"),Jt=s((function(n,r){return 0>gn(n,r)?n:r})),lf=gm,Mu=s((function(n,r){return e(lf,n,{$:0,a:r})})),Qt=function(n){return e(Mu,"blur",Ou(n))},g0=function(n){return c(n,!0)},$0=s((function(n,r){return e(lf,n,{$:1,a:r})})),Ce=tm,df=fn((function(n,r,t,u){if(u.b){var o=u.a,a=u.b;if(a.b){var i=a.a,b=a.b;if(b.b){var l=b.a,p=b.b;if(p.b){var g=p.b;return e(n,o,e(n,i,e(n,l,e(n,p.a,t>500?d(Bn,n,r,qn(g)):H(df,n,r,t+1,g)))))}return e(n,o,e(n,i,e(n,l,r)))}return e(n,o,e(n,i,r))}return e(n,o,r)}return r})),be=C((function(n,r,t){return H(df,n,r,0,t)})),mf=s((function(n,r){return d(be,Ce,r,n)})),Ye=em,x0=e(mf,f(["target","value"]),Ye),qr=function(n){return e($0,"input",e(Vn,g0,e(Vn,n,x0)))},kt=function(n){return e(cr,"step",n)},Bu=function(n){if(n.length===0||/[\sxbo]/.test(n))return A;var r=+n;return r==r?_(r):A},Zr=cr("type"),Fr=cr("value"),W=s((function(n,r){return r.$?n:r.a})),Nu=fn((function(n,r,t,u){var o=n.a,a=n.b,i=e(Jt,a,e(Yt,o,e(W,t,Bu(u))));return{k:!1,dY:_({c3:e(Vn,e(Kn,Yn,d(Nu,c(o,a),r,t)),pt),c7:function(){return vt(i)}}),d$:i,d0:pr((function(){return e(_r,f([j("knob-float-constrained"),Zr("number"),Fr(u),kt(Yn(r)),qr(d(Nu,c(o,a),r,t)),Qt(H(Nu,c(o,a),r,t,Yn(i)))]),$)}))}})),da=function(n){var r=n.bk,t=n.by,u=n.cp;return H(Nu,c(u.a,u.b),t,r,Yn(r))},An=s((function(n){return n})),w0=s((function(n,r){return r.b?d(be,m,r,n):n})),je=function(n){return d(be,w0,$,n)},y0=function(n){return{$:1,a:n}},Vu=hm,S=s((function(n,r){return d(be,s((function(t,u){return e(m,n(t),u)})),$,r)})),pf=function(n){return d(Bn,s((function(r,t){return d(fm,r.a,r.b,t)})),{},n)},ht=s((function(n,r){var t,u,o=n,a=r,i=function(k){return k.$?k.a:f([k.a])},b=C((function(k,h){return e(Vu,k,h(0))})),l=ff(je(f([e(S,b((function(k){return e(ht,o,k)})),i(a.d0)),e(S,b((function(k){return e(ht,k,a)})),i(o.d0))]))),p=W({c3:y0("err"),c7:An(null)}),g=(t=p(a.dY),u=p(o.dY),{c3:d(h0,s((function(k,h){return e(ht,k,h)})),e(Ce,"cur",u.c3),e(Ce,"prev",t.c3)),c7:function(){return pf(f([c("cur",u.c7(0)),c("prev",t.c7(0))]))}});return{k:a.k||o.k,dY:_(g),d$:a.d$(o.d$),d0:l}})),Xt=function(n){return{k:!1,dY:_({c3:e(Vn,Xt,Ye),c7:function(){return Rt(n)}}),d$:n,d0:pr((function(){return e(_r,f([j("knob-string"),Zr("text"),Fr(n),qr(Xt)]),$)}))}},vf={a3:`
        Knob.compose
            (\\name credits ->
                { name = name, credits = credits }
            )
            |> Knob.stack (Knob.stringInput "Ale")
            |> Knob.stack
                (Knob.floatConstrained
                    { step = 1, range = ( 0, 99 ), initial = 10 }
                )
        `,a6:A,bc:function(n){return n.aG},W:e(ht,da({bk:10,cp:c(0,99),by:1}),e(ht,Xt("Ale"),la(s((function(n,r){return{aH:r,L:n}}))))),bm:_(f(["compose","stack"])),L:"compose + stack",bv:s((function(n,r){return U(n,{aG:r})})),bL:bf},ma=C((function(n,r,t){var u=e(W,r,Bu(t));return{k:!1,dY:_({c3:e(Vn,e(Kn,Yn,e(ma,n,r)),pt),c7:function(){return vt(u)}}),d$:u,d0:pr((function(){return e(_r,f([j("knob-float"),Zr("number"),Fr(t),kt(Yn(n)),qr(e(ma,n,r))]),$)}))}})),kf=function(n){var r=n.bk;return d(ma,n.by,r,Yn(r))},_0=tn("label"),en=Ro,I=tn("div"),pa=s((function(n,r){var t=r.d0;if(t.$){var u=t.a;return e(I,f([j("knobs-stack")]),e(S,(function(o){return e(Vu,n,o(0))}),u))}return e(Vu,n,(0,t.a)(0))})),va=s((function(n,r){var t=r;return{k:t.k,dY:t.dY,d$:t.d$,d0:pr((function(){return e(_0,f([j("knob-label")]),f([en(n),e(pa,va(n),t)]))}))}})),hf={a3:`
        Knob.label "Amount"
            (Knob.float { step = 1, initial = 0 })
        `,a6:A,bc:function(n){return n.aR},W:e(va,"Amount",kf({bk:0,by:1})),bm:A,L:"label",bv:s((function(n,r){return U(n,{aR:r})})),bL:Yn},Yu=tn("code"),gf={$:0},A0=gf,se=tn("span"),$f=Du,Zn=$f($),C0=s((function(n,r){return(function(t){return{$:3,a:t}})((function(t){return c(e(n,r,t),Zn)}))})),j0=function(n){n:for(;!n.$;)switch(n.a){case 1:return"knobs-anchor-bottom-right";case 2:return"knobs-anchor-top-left";case 3:return"knobs-anchor-top-right";default:break n}return"knobs-anchor-bottom-left"},z0=tn("aside"),Hr=s((function(n,r){return d(be,s((function(t,u){return n(t)?e(m,t,u):u})),$,r)})),U0=function(n){return n.b},le=function(n){return j(e(Jn," ",e(S,ba,e(Hr,U0,n))))},L0=C((function(n,r,t){var u=n(r);return u.$?t:e(m,u.a,t)})),ir=s((function(n,r){return d(be,L0(n),$,r)})),gt=function(n){return n.b?_(n.a):A},xf=s((function(n,r){for(;;){if(!r.b)return!1;var t=r.b;if(n(r.a))return!0;r=t}})),Ar=s((function(n,r){return e(xf,(function(t){return R(t,n)}),r)})),Rr=function(n){return!n},K0=tn("section"),D0=s((function(n,r){return n?r:en("")})),S0=C((function(n,r,t){var u=t,o=e(K0,f([j("knobs-panel")]),f([e(pa,r,u)])),a=gt(e(ir,(function(l){return l.$===1?_(l.a):A}),n)),i=e(Ar,gf,n),b=e(I,f([j("knobs-dock")]),f([e(I,f([j("knobs-dock-icon")]),f([en("🎛")]))]));return e(z0,f([le(f([c("knobs",!0),c(j0(a),!0),c("knobs-keep-open",u.k),c("knobs-detached",i)]))]),f([e(D0,!i,b),o]))})),T0=C((function(n,r,t){return c(t.L,(function(u){var o=n(u),a=t.bL(t.bc(o).d$);return e(I,f([j("component-preview")]),f([d(S0,f([A0]),C0(e(Kn,t.bv(o),r)),t.bc(o)),e(I,$,f([en("Value: "),e(se,f([j("elm-book-md")]),f([e(Yu,f([j("elm-book-monospace")]),f([en(a)]))]))]))]))}))})),Fu=C((function(n,r,t){return{a3:t.a3,c$:d(T0,n,r,t),a6:t.a6,bm:t.bm,L:t.L}})),ka=e(Fu,(function(n){return n.bW}),s((function(n,r){return U(r,{bW:n})}))),wf=s((function(n,r){return ht(e(va,n,r))})),yf={a3:`
        Knob.compose
            (\\name credits ->
                { name = name, credits = credits }
            )
            |> Knob.stackLabel "Name"
                (Knob.stringInput "Ale")
            |> Knob.stackLabel "Credits"
                (Knob.floatConstrained
                    { step = 1, range = ( 0, 99 ), initial = 10 }
                )
        `,a6:A,bc:function(n){return n.aX},W:d(wf,"Credits",da({bk:10,cp:c(0,99),by:1}),d(wf,"Name",Xt("Ale"),la(s((function(n,r){return{aH:r,L:n}}))))),bm:_(f(["compose","stackLabel"])),L:"compose + stackLabel",bv:s((function(n,r){return U(n,{aX:r})})),bL:bf},_f=f([ka(vf),ka(hf),ka(yf)]),W0=Md,Ln=function(n){return n.length},de=Od,vr=s((function(n,r){return 1>n?r:d(de,n,Ln(r),r)})),Af=function(n){var r,t=(function(o){return f(o.split(/\r\n|\r|\n/g))})(n),u=e(W,0,(r=e(S,s((function(o,a){n:for(;;){var i=Eu(a);if(i.$===1)return o;var b=i.a,l=b.b;switch(b.a){case" ":case"	":o+=1,a=l;continue n;default:return o}}}))(0),e(Hr,W0((function(o){return o!==" "&&o!=="	"})),t))).b?_(d(Bn,Jt,r.a,r.b)):A);return e(Jn,`
`,e(S,vr(u),t))},q0=function(n){return d(wn,"$elmKnobsVersion$",Ne,d(wn,"$code$",Yr(Af(n.a3)),d(wn,"$apiDocsLink$",(t=(r=n).bm).$===1?d(wn,"$elmKnobsVersion$",Ne,d(wn,"$name$",r.L,"📦 [API docs.](https://package.elm-lang.org/packages/agj/elm-knobs/$elmKnobsVersion$/Knob#$name$)")):e(Jn,`
`,e(S,(function(u){return d(wn,"$elmKnobsVersion$",Ne,d(wn,"$name$",u,"- 📦 [API docs](https://package.elm-lang.org/packages/agj/elm-knobs/$elmKnobsVersion$/Knob#$name$) for `$name$`."))}),t.a)),d(wn,"$description$",Yr(Af(e(W,"",n.a6))),d(wn,"$knobName$",n.L,`
## $knobName$

$description$

$apiDocsLink$

<component
    with-label="$knobName$"
    with-hidden-label="true"
/>

\`\`\`elm
$code$
\`\`\`
`)))));var r,t},Hu=function(n){return e(Jn,`


`,e(S,q0,n))},Z0=d(wn,"$knobDocs$",Hu(_f),`
Examples of composing multiple knobs into a bigger data structure.

$knobDocs$
`),$t=s((function(n,r){return U(r,{cU:K(r.cU,n)})})),I0=function(n){var r;return{aR:n.a,d0:(r=n.b,{$:1,a:r})}},Ru=s((function(n,r){var t=r;return U(t,{o:K(e(S,I0,n),t.o)})})),E0=e($t,Z0,e(Ru,e(S,(function(n){return n.c$}),_f),mt("Composition & organization"))),P0=e($t,d(wn,"$apiDocsUrl$",Fi,d(wn,"$elmKnobsVersion$",Ne,`
This is the interactive documentation for the [agj/**elm-knobs**
$elmKnobsVersion$ Elm package][package]. This documentation contains interactive
examples of the knobs, so that you can see them in action in your browser.
Select a section from the menu on the left to jump to the examples.

The package offers a way to easily tweak values interactively within a running
Elm app, using a panel of input controls that map to those values, which we
call “knobs” here. While not in use, the panel can recede to a small icon in the
corner. For a full explanation of the package and its functionality, [see the
API docs][package].

[package]: $apiDocsUrl$
`)),mt("What this is")),Cf={a3:`
        Knob.floatConstrained
            { step = 0.01, range = ( 0, 1 ), initial = 0 }
        `,a6:A,bc:function(n){return n.aK},W:da({bk:0,cp:c(0,1),by:.01}),bm:A,L:"floatConstrained",bv:s((function(n,r){return U(n,{aK:r})})),bL:Yn},jf={a3:`
        Knob.float { step = 0.01, initial = 0 }
        `,a6:A,bc:function(n){return n.aJ},W:kf({bk:0,by:.01}),bm:A,L:"float",bv:s((function(n,r){return U(n,{aJ:r})})),bL:Yn},zf=cr("max"),Uf=cr("min"),ha=fn((function(n,r,t,u){var o=n.a,a=n.b,i=e(Jt,a,e(Yt,o,e(W,t,Bu(u))));return{k:!1,dY:_({c3:e(Vn,e(Kn,Yn,d(ha,c(o,a),r,t)),pt),c7:function(){return vt(i)}}),d$:i,d0:pr((function(){return e(I,$,f([e(_r,f([j("knob-float-slider"),Zr("range"),Fr(u),Uf(Yn(o)),zf(Yn(a)),kt(Yn(r)),qr(d(ha,c(o,a),r,t))]),$),e(I,$,f([en(Yn(i))]))]))}))}})),Lf={a3:`
        Knob.floatSlider
            { step = 0.01, range = ( 0, 1 ), initial = 0 }
        `,a6:A,bc:function(n){return n.aL},W:(Zu={bk:0,cp:c(0,1),by:.01},ra=Zu.bk,H(ha,Zu.cp,Zu.by,ra,Yn(ra))),bm:A,L:"floatSlider",bv:s((function(n,r){return U(n,{aL:r})})),bL:Yn},ga=Xd,$a=Ku,Fe=function(n){for(var r=0,t=n.charCodeAt(0),u=t==43||t==45?1:0,o=u;n.length>o;++o){var a=n.charCodeAt(o);if(48>a||a>57)return A;r=10*r+a-48}return o==u?A:_(t==45?-r:r)},Ju=fn((function(n,r,t,u){var o=n.a,a=n.b,i=e(Jt,a,e(Yt,o,e(W,t,Fe(u))));return{k:!1,dY:_({c3:e(Vn,e(Kn,bn,d(Ju,c(o,a),r,t)),ga),c7:function(){return $a(i)}}),d$:i,d0:pr((function(){return e(_r,f([j("knob-int-constrained"),Zr("number"),Fr(u),kt(bn(r)),qr(d(Ju,c(o,a),r,t)),Qt(H(Ju,c(o,a),r,t,bn(i)))]),$)}))}})),Kf={a3:`
        Knob.intConstrained
            { step = 1, range = ( 0, 10 ), initial = 0 }
        `,a6:A,bc:function(n){return n.aN},W:(function(n){var r=n.bk,t=n.by,u=n.cp;return H(Ju,c(u.a,u.b),t,r,bn(r))})({bk:0,cp:c(0,10),by:1}),bm:A,L:"intConstrained",bv:s((function(n,r){return U(n,{aN:r})})),bL:bn},xa=C((function(n,r,t){var u=e(W,r,Fe(t));return{k:!1,dY:_({c3:e(Vn,e(Kn,bn,e(xa,n,r)),ga),c7:function(){return $a(u)}}),d$:u,d0:pr((function(){return e(_r,f([j("knob-int"),Zr("number"),Fr(t),kt(bn(n)),qr(e(xa,n,r))]),$)}))}})),Df=function(n){var r=n.bk;return d(xa,n.by,r,bn(r))},Sf={a3:`
        Knob.int { step = 1, initial = 0 }
        `,a6:A,bc:function(n){return n.aM},W:Df({bk:0,by:1}),bm:A,L:"int",bv:s((function(n,r){return U(n,{aM:r})})),bL:bn},wa=fn((function(n,r,t,u){var o=n.a,a=n.b,i=e(Jt,a,e(Yt,o,e(W,t,Fe(u))));return{k:!1,dY:_({c3:e(Vn,e(Kn,bn,d(wa,c(o,a),r,t)),ga),c7:function(){return $a(i)}}),d$:i,d0:pr((function(){return e(I,$,f([e(_r,f([j("knob-int-slider"),Zr("range"),Fr(u),Uf(bn(o)),zf(bn(a)),kt(bn(r)),qr(d(wa,c(o,a),r,t))]),$),e(I,$,f([en(bn(i))]))]))}))}})),Tf={a3:`
        Knob.intSlider
            { step = 1, range = ( 0, 10 ), initial = 0 }
        `,a6:A,bc:function(n){return n.aO},W:(function(n){var r=n.bk;return H(wa,n.cp,n.by,r,bn(r))})({bk:0,cp:c(0,10),by:1}),bm:A,L:"intSlider",bv:s((function(n,r){return U(n,{aO:r})})),bL:bn},xt=e(Fu,(function(n){return n.cf}),s((function(n,r){return U(r,{cf:n})}))),Wf=f([xt(jf),xt(Cf),xt(Lf),xt(Sf),xt(Kf),xt(Tf)]),O0=d(wn,"$knobDocs$",Hu(Wf),"\nThese are all the knobs that manage an `Int` or a `Float` value.\n\n$knobDocs$\n"),M0=e($t,O0,e(Ru,e(S,(function(n){return n.c$}),Wf),mt("Number"))),qf=Gd,Zf=Ku,ya=s((function(n,r){return e(Ki,n,Zf(r))})),_a=ya("checked"),B0=e(mf,f(["target","checked"]),qf),Aa=function(n){return{k:!1,dY:_({c3:e(Vn,Aa,qf),c7:function(){return Zf(n)}}),d$:n,d0:pr((function(){return e(_r,f([j("knob-bool-checkbox"),Zr("checkbox"),_a(n),(r=Aa,e(Mu,"change",e(Vn,r,B0)))]),$);var r}))}},If={a3:`
        Knob.boolCheckbox False
        `,a6:A,bc:function(n){return n.aB},W:Aa(!1),bm:A,L:"boolCheckbox",bv:s((function(n,r){return U(n,{aB:r})})),bL:function(n){return n?"True":"False"}},N0=Wd,He=function(n){return e(N0,n,"")},fr=Fd,Ef=C((function(n,r,t){n:for(;;){if(!r.b)return J(t);var u=r.a,o=r.b;switch(u){case"0":n=a=n-1,r=i=o,t=b=t;continue n;case"1":var a=n-1,i=o,b=t+e(fr,16,n);n=a,r=i,t=b;continue n;case"2":a=n-1,i=o,b=t+2*e(fr,16,n),n=a,r=i,t=b;continue n;case"3":a=n-1,i=o,b=t+3*e(fr,16,n),n=a,r=i,t=b;continue n;case"4":a=n-1,i=o,b=t+4*e(fr,16,n),n=a,r=i,t=b;continue n;case"5":a=n-1,i=o,b=t+5*e(fr,16,n),n=a,r=i,t=b;continue n;case"6":a=n-1,i=o,b=t+6*e(fr,16,n),n=a,r=i,t=b;continue n;case"7":a=n-1,i=o,b=t+7*e(fr,16,n),n=a,r=i,t=b;continue n;case"8":a=n-1,i=o,b=t+8*e(fr,16,n),n=a,r=i,t=b;continue n;case"9":a=n-1,i=o,b=t+9*e(fr,16,n),n=a,r=i,t=b;continue n;case"a":a=n-1,i=o,b=t+10*e(fr,16,n),n=a,r=i,t=b;continue n;case"b":a=n-1,i=o,b=t+11*e(fr,16,n),n=a,r=i,t=b;continue n;case"c":a=n-1,i=o,b=t+12*e(fr,16,n),n=a,r=i,t=b;continue n;case"d":a=n-1,i=o,b=t+13*e(fr,16,n),n=a,r=i,t=b;continue n;case"e":a=n-1,i=o,b=t+14*e(fr,16,n),n=a,r=i,t=b;continue n;case"f":a=n-1,i=o,b=t+15*e(fr,16,n),n=a,r=i,t=b;continue n;default:return pn(He(u)+" is not a valid hexadecimal character.")}}})),br=function(n){return n===""},$n=s((function(n,r){return r.$?pn(r.a):J(n(r.a))})),Qu=s((function(n,r){return r.$?pn(n(r.a)):J(r.a)})),V0=function(n){return-n},ze=Nd,Y0=Id,Pf=function(n){return d(Y0,m,$,n)},Of=function(n){if(br(n))return pn("Empty strings are not valid hexadecimal strings.");var r=(function(){if(e(ze,"-",n)){var t=e(W,$,(function(u){return u.b?_(u.b):A})(Pf(n)));return e($n,V0,d(Ef,yr(t)-1,t,0))}return d(Ef,Ln(n)-1,Pf(n),0)})();return e(Qu,(function(t){return e(Jn," ",f(['"'+n+'"',"is not a valid hexadecimal string because",t]))}),r)},Ue=s((function(n,r){return 1>n?"":d(de,0,n,r)})),rn=s((function(n,r){return r.$?A:_(n(r.a))})),F0=s((function(n,r){var t=Eu(r);if(t.$||t.a.a!=="#")return n;var u=t.a.b,o=function(i){return e(rn,(function(l){return l/255}),(b=Of(i)).$?A:_(b.a));var b},a=En(o(e(Ue,2,u)),o(e(Ue,2,e(vr,2,u))),o(e(Ue,2,e(vr,4,u))));return a.a.$||a.b.$||a.c.$?n:{bQ:a.c.a,b1:a.b.a,cr:a.a.a}})),Mf=C((function(n,r,t){return n>0?d(Mf,n>>1,K(r,r),1&n?K(t,r):t):t})),me=s((function(n,r){return d(Mf,n,r,"")})),H0=C((function(n,r,t){return K(e(me,n-Ln(t),He(r)),t)})),Jr=Hd,Bf=function(n){n:for(;;)switch(n){case 0:return"0";case 1:return"1";case 2:return"2";case 3:return"3";case 4:return"4";case 5:return"5";case 6:return"6";case 7:return"7";case 8:return"8";case 9:return"9";case 10:return"a";case 11:return"b";case 12:return"c";case 13:return"d";case 14:return"e";case 15:return"f";default:continue n}},Nf=s((function(n,r){for(;;){if(16>r)return e(m,Bf(r),n);n=e(m,Bf(e(Jr,16,r)),n),r=r/16|0}})),Vf=function(n){var r=function(o){return d(H0,2,"0",(function(a){return(function(i){return Po(i).join("")})(0>a?e(m,"-",e(Nf,$,-a)):e(Nf,$,a))})(ef(255*o)))},t=n.bQ,u=n.b1;return"#"+K(r(n.cr),K(r(u),r(t)))},R0=am,Ca=function(n){return e(Mu,"focus",Ou(n))},Gt=C((function(n,r,t){var u=e(F0,r,t);return{k:n,dY:_({c3:H(R0,C((function(o,a,i){return d(Gt,!1,r,Vf({bQ:i,b1:a,cr:o}))})),e(Ce,"red",pt),e(Ce,"green",pt),e(Ce,"blue",pt)),c7:function(){return pf(f([c("red",vt(u.cr)),c("green",vt(u.b1)),c("blue",vt(u.bQ))]))}}),d$:u,d0:pr((function(){return e(_r,f([j("knob-color-picker"),Zr("color"),Fr(t),qr(e(Gt,n,r)),Ca(d(Gt,!0,r,t)),Qt(d(Gt,!1,r,t))]),$)}))}})),J0=Qd,ja=function(n){return Yn(J0(100*n)/100)},Yf={a3:`
        Knob.colorPicker { red = 1, green = 1, blue = 1 }
        `,a6:A,bc:function(n){return n.aF},W:(function(n){return d(Gt,!1,n,Vf(n))})({bQ:1,b1:1,cr:1}),bm:A,L:"colorPicker",bv:s((function(n,r){return U(n,{aF:r})})),bL:function(n){var r=n.b1,t=n.cr;return d(wn,"$blue$",ja(n.bQ),d(wn,"$green$",ja(r),d(wn,"$red$",ja(t),"{ red = $red$, green = $green$, blue = $blue$ }")))}},nu=e(Fu,(function(n){return n.ci}),s((function(n,r){return U(r,{ci:n})}))),pe={$:-2},wt=pe,vn=Wn((function(n,r,t,u,o){return{$:-1,a:n,b:r,c:t,d:u,e:o}})),yt=Wn((function(n,r,t,u,o){if(o.$!==-1||o.a){if(u.$!==-1||u.a||u.d.$!==-1||u.d.a)return M(vn,n,r,t,u,o);var a=u.d;return i=u.e,M(vn,0,u.b,u.c,M(vn,1,a.b,a.c,a.d,a.e),M(vn,1,r,t,i,o))}var i,b=o.b,l=o.c,p=o.d,g=o.e;return u.$!==-1||u.a?M(vn,n,b,l,M(vn,0,r,t,u,p),g):M(vn,0,r,t,M(vn,1,u.b,u.c,u.d,i=u.e),M(vn,1,b,l,p,g))})),za=Kd,Ua=C((function(n,r,t){if(t.$===-2)return M(vn,0,n,r,pe,pe);var u=t.a,o=t.b,a=t.c,i=t.d,b=t.e;switch(e(za,n,o)){case 0:return M(yt,u,o,a,d(Ua,n,r,i),b);case 1:return M(vn,u,o,r,i,b);default:return M(yt,u,o,a,i,d(Ua,n,r,b))}})),_t=C((function(n,r,t){var u=d(Ua,n,r,t);return u.$!==-1||u.a?u:M(vn,1,u.b,u.c,u.d,u.e)})),Re=function(n){return d(Bn,s((function(r,t){return d(_t,r.a,r.b,t)})),wt,n)},ve=s((function(n,r){n:for(;;){if(r.$===-2)return A;var t=r.c,u=r.d,o=r.e;switch(e(za,n,r.b)){case 0:r=u;continue n;case 1:return _(t);default:r=o;continue n}}})),Q0=s((function(n,r){for(;;){if(!r.b)return A;var t=r.a,u=r.b;if(n(t))return _(t);r=u}})),X0=tn("option"),G0=tn("select"),np=ya("selected"),ru=C((function(n,r,t){var u=Re(r.dM),o=function(b){return e(W,r.bk,e(ve,b,u))},a=o(t),i=e(S,(function(b){var l=o(b);return e(X0,f([Fr(b),np(R(r.bk,l))]),f([en(b)]))}),e(S,ba,r.dM));return{k:n,dY:_({c3:e(Vn,(function(b){return d(ru,!1,r,b)}),Ye),c7:function(){return Rt((b=a,e(W,"",e(rn,(function(l){return l.a}),e(Q0,(function(l){return R(l.b,b)}),r.dM)))));var b}}),d$:a,d0:pr((function(){return e(G0,f([j("knob-select"),qr((function(b){return d(ru,!1,r,b)})),Ca(d(ru,!0,r,t)),Qt(d(ru,!1,r,t))]),i)}))}})),Ff={a3:`
        Knob.select
            { options =
                [ ( "Carrot", Carrot )
                , ( "Lettuce", Lettuce )
                , ( "Beet", Beet )
                ]
            , initial = Carrot
            }
        `,a6:_("\n        This example creates a `select` knob for a `Vegetable` custom type.\n        "),bc:function(n){return n.aW},W:(Oi={bk:0,dM:f([c("Carrot",0),c("Lettuce",1),c("Beet",2)])},d(ru,!1,Oi,"")),bm:A,L:"select",bv:s((function(n,r){return U(n,{aW:r})})),bL:function(n){switch(n){case 0:return"Carrot";case 1:return"Lettuce";default:return"Beet"}}},Hf={a3:`
        Knob.stringInput "Enter text here"
        `,a6:A,bc:function(n){return n.aY},W:Xt("Enter text here"),bm:A,L:"stringInput",bv:s((function(n,r){return U(n,{aY:r})})),bL:Ht},rp=function(n){return e(er,"cols",bn(n))},Rf=le($),ep=function(n){return e(er,"rows",bn(n))},tp=tn("textarea"),La=function(n){return{k:!1,dY:_({c3:e(Vn,(function(r){return La(U(n,{bk:r}))}),Ye),c7:function(){return Rt(n.bk)}}),d$:n.bk,d0:pr((function(){return e(tp,f([j("knob-string-textarea"),e(W,Rf,e(rn,ep,n.dX)),e(W,Rf,e(rn,rp,n.c_)),qr((function(r){return La(U(n,{bk:r}))}))]),f([en(n.bk)]))}))}},Jf={a3:`
        Knob.stringTextarea
            { columns = Just 40
            , rows = Just 5
            , initial = "Enter text here"
            }
        `,a6:A,bc:function(n){return n.aZ},W:La({c_:_(40),bk:"Enter text here",dX:_(5)}),bm:A,L:"stringTextarea",bv:s((function(n,r){return U(n,{aZ:r})})),bL:Ht},Qf=f([nu(Hf),nu(Jf),nu(If),nu(Ff),nu(Yf)]),up=d(wn,"$knobDocs$",Hu(Qf),`
Knobs for non-numeric types.

$knobDocs$
`),op=e($t,up,e(Ru,e(S,(function(n){return n.c$}),Qf),mt("Other types"))),At=tn("button"),Je=function(n){return e(Mu,"click",Ou(n))},Xf={a3:`
        let
            -- Defining the custom knob.
            abcKnob : String -> Knob String
            abcKnob initial =
                let
                    view : () -> Html (Knob String)
                    view () =
                        Html.div []
                            [ Html.button
                                [ Html.Events.onClick (abcKnob "A") ]
                                [ Html.text "Set A" ]
                            , Html.button
                                [ Html.Events.onClick (abcKnob "B") ]
                                [ Html.text "Set B" ]
                            , Html.button
                                [ Html.Events.onClick (abcKnob "C") ]
                                [ Html.text "Set C" ]
                            ]

                    serialization =
                        { encode = \\() -> Json.Encode.string initial
                        , decoder = Json.Decode.map abcKnob Json.Decode.string
                        }
                in
                Knob.custom
                    { value = initial
                    , view = view
                    , serialization = Just serialization
                    }
        in
        -- Using the custom knob.
        abcKnob "A"
        `,a6:_(`
        A custom knob consisting of three buttons, each emitting a different
        string value.

        We're making a serializable knob here, but notice that it's an optional
        feature, so feel free to ignore that part and use \`serialization =
        Nothing\`.
        `),bc:function(n){return n.aI},W:(bt=function(n){return(function(r){return{k:!1,dY:r.dY,d$:r.d$,d0:pr(r.d0)}})({dY:_({c3:e(Vn,bt,Ye),c7:function(){return Rt(n)}}),d$:n,d0:function(){return e(I,$,f([e(At,f([Je(bt("A"))]),f([en("Set A")])),e(At,f([Je(bt("B"))]),f([en("Set B")])),e(At,f([Je(bt("C"))]),f([en("Set C")]))]))}})},bt("A")),bm:A,L:"custom",bv:s((function(n,r){return U(n,{aI:r})})),bL:Ht},Ka=s((function(n,r){var t=r;return{k:t.k,dY:e(rn,(function(u){var o=u.c3,a=u.c7;return{c3:e(Vn,Ka(n),o),c7:a}}),t.dY),d$:n(t.d$),d0:pr((function(){return e(pa,Ka(n),t)}))}})),Gf={a3:`
        Knob.int { step = 10, initial = 0 }
            |> Knob.map (\\int -> "$" ++ String.fromInt int)
        `,a6:_("\n        Uses `map` to add a “$” sign in front of the number. The resulting knob\n        is not of type `Knob Int`, but rather `Knob String`.\n        "),bc:function(n){return n.aT},W:e(Ka,(function(n){return"$"+bn(n)}),Df({bk:0,by:10})),bm:A,L:"map",bv:s((function(n,r){return U(n,{aT:r})})),bL:Ht},nb=e(Fu,(function(n){return n.cG}),s((function(n,r){return U(r,{cG:n})}))),rb=f([nb(Gf),nb(Xf)]),ap=d(wn,"$knobDocs$",Hu(rb),`
Examples of what you can do to get more customized behaviour out of your knobs.

$knobDocs$
`),cp=e($t,ap,e(Ru,e(S,(function(n){return n.c$}),rb),mt("Transformation & custom"))),eb=function(n){return{cU:"",bS:af,o:$,bV:cf,b2:A,bj:A,b8:!1,cD:n.cD,cJ:n.cJ}},Ct=tn("a"),ip=d(wn,"$version$",Ne,"https://github.com/agj/elm-knobs/tree/$version$"),jt=function(n){return e(cr,"href",ym.test(r=n)?"":r);var r},fp=tn("iframe"),tb=function(n){return e(cr,"src",Di(n))},Qr=$m,Da=cr("target"),bp=function(n){var r;return{aR:n.a,d0:(r=n.b,{$:0,a:r})}},sp=s((function(n,r){var t=r;return U(t,{o:K(e(S,bp,n),t.o)})})),lp=e(S,(function(n){var r=d(wn,"$slug$",n.O,d(wn,"%githubUrl%",ip,"%githubUrl%/examples/$slug$/")),t=s((function(o,a){return e(Ct,f([Da("blank_"),jt(o)]),f([en(a)]))})),u=d(wn,"%slug%",n.O,"./examples/%slug%");return e($t,d(wn,"$sourceUrl$",r,d(wn,"$exampleUrl$",u,`
- <component with-label="link-source" with-display="inline" />
- <component with-label="link-full-page" with-display="inline" />

<component
    with-label="iframe"
    with-hidden-label="true"
/>
`)),e(sp,f([c("iframe",e(fp,f([tb(u),j("full-example"),e(Qr,"height",n.U)]),$)),c("link-source",e(t,r,"Source code on Github. ↗")),c("link-full-page",e(t,u,"Open on its own. ↗"))]),mt(n.L)))}),f([{U:"7em",L:"Basic",O:"basic"},{U:"500px",L:"Polygon",O:"polygon"},{U:"17em",L:"Options",O:"options"},{U:"13em",L:"Web Storage API",O:"web-storage"}])),dp={bW:{aG:vf.W,aR:hf.W,aX:yf.W},cf:{aJ:jf.W,aK:Cf.W,aL:Lf.W,aM:Sf.W,aN:Kf.W,aO:Tf.W},ci:{aB:If.W,aF:Yf.W,aW:Ff.W,aY:Hf.W,aZ:Jf.W},cG:{aI:Xf.W,aT:Gf.W}},mp=s((function(n,r){return U(r,{di:_(s((function(){return n})))})})),pp=s((function(n,r){return U(r,{bn:_(n)})})),ub=function(n){return tn((function(r){return xm.test(r)?"p":r})(n))},vp=d(ub,"style",$,f([en(`
    .knobs {
        /* Variables */

        --knobs-background-color: Canvas;
        --knobs-text-color: CanvasText;
        --knobs-text-size: 1rem;
        --knobs-separation: calc(0.5 * var(--knobs-text-size));
        --knobs-dock-icon-size: calc(3.5 * var(--knobs-text-size));
        --knobs-shadow:
            0 0
            calc(0.4 * var(--knobs-text-size))
            rgb(0 0 0 / 0.2);

        /* Main container */

        color: var(--knobs-text-color);
        display: flex;
        font-size: var(--knobs-text-size);
        gap: var(--knobs-separation);
        max-height: 100vh;
        z-index: 888;

        /* Attachment */

        &:not(.knobs-detached) {
            position: fixed;

            &.knobs-anchor-bottom-left {
                bottom: 0;
                left: 0;
            }

            &.knobs-anchor-bottom-right {
                bottom: 0;
                right: 0;
            }

            &.knobs-anchor-top-left {
                left: 0;
                top: 0;
            }

            &.knobs-anchor-top-right {
                right: 0;
                top: 0;
            }
        }

        /* Dock */

        .knobs-dock {
            align-items: center;
            background-color: var(--knobs-background-color);
            border-radius: 50%;
            box-shadow: var(--knobs-shadow);
            display: flex;
            height: var(--knobs-dock-icon-size);
            justify-content: center;
            line-height: 1;
            margin: calc(1 * var(--knobs-separation));
            width: var(--knobs-dock-icon-size);
            font-size: calc(2 * var(--knobs-text-size));
        }

        /* Panel */

        .knobs-panel {
            background-color: var(--knobs-background-color);
            box-shadow: var(--knobs-shadow);
            display: none;
            overflow-y: auto;
            padding: calc(3 * var(--knobs-separation));
        }

        /* Show and hide */

        &.knobs-detached,
        &:hover,
        &.knobs-keep-open {
            .knobs-dock {
                display: none;
            }

            .knobs-panel {
                display: block;
            }
        }

        /* Knobs */

        .knobs-stack {
            display: flex;
            flex-direction: column;
            gap: calc(2 * var(--knobs-separation));
        }

        label {
            display: flex;
            flex-direction: column;
            gap: var(--knobs-separation);
        }

        label:has(> input[type="checkbox"]) {
            align-items: center;
            flex-direction: row;

            > input[type="checkbox"] {
                order: -1;
            }
        }

        input[type="range"] + * {
            color: darkgray;
            text-align: center;
        }
    }
    `)])),kp=s((function(n,r){return U(r,{bD:_(n)})})),hp=rm,gp=function(n){return{$:2,a:n}},$p=function(n){return{$:1,a:n}},xp=_n,ob=Ae((function(n,r,t,u,o,a){return{c9:a,b4:r,bt:u,ck:t,cn:n,co:o}})),eu=Bd,Xu=Yd,ab=Wn((function(n,r,t,u,o){if(br(o)||e(eu,"@",o))return A;var a=e(Xu,":",o);if(a.b){if(a.b.b)return A;var i=a.a,b=Fe(e(vr,i+1,o));if(b.$===1)return A;var l=b;return _(Mn(ob,n,e(Ue,i,o),l,r,t,u))}return _(Mn(ob,n,o,A,r,t,u))})),cb=fn((function(n,r,t,u){if(br(u))return A;var o=e(Xu,"/",u);if(o.b){var a=o.a;return M(ab,n,e(vr,a,u),r,t,e(Ue,a,u))}return M(ab,n,"/",r,t,u)})),ib=C((function(n,r,t){if(br(t))return A;var u=e(Xu,"?",t);if(u.b){var o=u.a;return H(cb,n,_(e(vr,o+1,t)),r,e(Ue,o,t))}return H(cb,n,A,r,t)})),fb=s((function(n,r){if(br(r))return A;var t=e(Xu,"#",r);if(t.b){var u=t.a;return d(ib,n,_(e(vr,u+1,r)),e(Ue,u,r))}return d(ib,n,A,r)})),bb=function(n){return e(ze,"http://",n)?e(fb,0,e(vr,7,n)):e(ze,"https://",n)?e(fb,1,e(vr,8,n)):A},Sa=function(n){},Xr=it,wp=Xr(0),Le=Mo,Gu=s((function(n,r){return e(Le,(function(t){return Xr(n(t))}),r)})),yp=C((function(n,r,t){return e(Le,(function(u){return e(Le,(function(o){return Xr(e(n,u,o))}),t)}),r)})),no=function(n){return d(be,yp(m),Xr($),n)},sb=pm,_p=s((function(n,r){var t=r;return _i(e(Le,sb(n),t))})),Ap=C((function(n,r){return e(Gu,(function(){return 0}),no(e(S,_p(n),r)))})),Cp=C((function(){return Xr(0)})),jp=s((function(n,r){return e(Gu,n,r)}));ft.Task=ji(wp,Ap,Cp,jp);var lb=zi("Task"),Ta=s((function(n,r){return lb(e(Gu,n,r))})),ro=function(n){return n.cJ},Wa=zd,eo=4294967295>>>32-Nr,db=function(n){return[n]},to=Cd,mb=jd,tu=fn((function(n,r,t,u){var o=eo&r>>>n;if(gn(o,dt(u))>-1){if(n===5)return e(Wa,ia(t),u);var a=Ft(H(tu,n-Nr,r,t,lt));return e(Wa,a,u)}var i=e(to,o,u);return i.$?(a=Ft(H(tu,n-Nr,r,t,db(i))),d(mb,o,a,u)):(a=Ft(H(tu,n-Nr,r,t,i.a)),d(mb,o,a,u))})),zp=s((function(n,r){var t=r.a,u=r.b,o=r.c,a=dt(r.d),i=dt(n),b=t+(i-a);if(R(i,mr)){if(gn(b>>>Nr,1<<u)>0){var l=u+Nr,p=H(tu,l,t,n,db(Ft(o)));return H(st,b,l,p,lt)}return H(st,b,u,H(tu,u,t,n,o),lt)}return H(st,b,u,o,n)})),Up=s((function(n,r){return e(zp,e(Wa,n,r.d),r)})),Lp=s((function(n,r){var t,u=r,o=(t=s((function(i,b){var l=b.b;return c(b.a,e(Vt,s((function(p){return p+i})),l))})),qn(d(Bn,s((function(i,b){var l=i.b,p=b.a,g=b.b;return c(e(m,e(t,g,c(i.a,l)),p),g+yr(l))})),c($,0),n).a)),a=d(Bn,s((function(i,b){var l=i.b;return d(Bn,s((function(p,g){return{cX:d(_t,ro(p),g.R,g.cX),Q:e(Up,p,g.Q),R:g.R+1}})),{cX:b.cX,Q:b.Q,R:b.R},l)})),{cX:wt,Q:ca,R:0},n);return{cX:a.cX,cY:o,bS:u.bS,Q:a.Q,bV:u.bV,cy:u.cy,bK:u.bK,cD:u.cD,d_:u.d_}})),uu=s((function(n,r){return r.$?A:n(r.a)})),Kp=C((function(n,r,t){for(;;){var u=e(to,eo&r>>>n,t);if(u.$)return e(to,eo&r,u.a);n-=Nr,t=u.a}})),Qe=s((function(n,r){var t=r.a,u=r.b,o=r.c,a=r.d;return 0>n||gn(n,t)>-1?A:gn(n,(function(i){return i>>>5<<5})(t))>-1?_(e(to,eo&n,a)):_(d(Kp,u,n,o))})),qa=s((function(n,r){return e(uu,(function(t){return e(Qe,t,n.Q)}),e(ve,r,n.cX))})),zt=s((function(n,r){var t=r.cJ;return r.b8&&n?"#"+t:t})),or=C((function(n,r,t){return n(r(t))})),Dp={cP:A,cT:A,dy:A,dz:A,dA:A},Za=s((function(n,r){return n?e(W,"/",r.c9):r.bt})),Ia=function(n){return n.be},pb=function(n){return n.bj},vb=C((function(n,r,t){return r.$===1||t.$===1?A:_(e(n,r.a,t.a))})),uo=s((function(n,r){var t=r.b;return c(n(r.a),t)})),Ea=qm,Sp=fn((function(n,r,t,u){var o=e(Za,n.bK.be,t),a=Ia(n.bK),i=n.bK.dP,b=e(rn,n.cy.ch(i),e(rn,(function(k){return e(k,r,u)}),n.cy.di)),l=e(qa,n,e(Za,a,t)),p=e(W,c(b,Zn),e(uu,(function(k){return e(rn,uo(_),d(vb,s((function(h,x){return x(h)})),b,pb(k)))}),l)),g=p.b;return c({F:$,ac:!1,bO:A,A:0,S:i,B:!1,ai:!1,aj:!1,aP:!1,Z:u,_:"",z:p.a,aw:Dp,cJ:o},l.$?e(W,e(Ea,u,"/"),e(rn,e(or,Ea(u),zt(a)),e(Qe,0,n.Q))):g)})),oo={$:0},Tp={$:12},Wp={$:13},qp={$:18},Zp={$:19},Ip={$:16},Ep={$:14},Ke=function(n){return n.toLowerCase()},Pp=e(Vn,(function(n){switch(Ke(n)){case"arrowdown":return Tp;case"arrowup":return Wp;case"shift":return Ep;case"meta":return Ip;case"enter":return qp;case"k":return Zp;default:return oo}}),e(Ce,"key",Ye)),Op={$:17},Mp={$:15},Bp=e(Vn,(function(n){switch(Ke(n)){case"shift":return Mp;case"meta":return Op;default:return oo}}),e(Ce,"key",Ye)),kb=C((function(n,r,t){return{$:0,a:n,b:r,c:t}})),hb=s((function(n,r){return{cj:r,cz:n}})),Np=Xr(e(hb,$,wt)),Vp=function(n){var r=n.b;return c(K((function(t){return t?"w_":"d_"})(n.a),r),n)},Yp=function(n){return ie((function(r){var t=n.f;t.$===2&&t.c&&t.c(),n.f=null,r(it(0))}))},ao=C((function(n,r,t){for(;;){if(t.$===-2)return r;var u=t.e,o=n,a=d(n,t.b,t.c,d(ao,n,r,t.d));n=o,r=a,t=u}})),Fp=Ae((function(n,r,t,u,o,a){var i=C((function(g,k,h){n:for(;;){var x=h.a,L=h.b;if(x.b){var Z=x.a,B=Z.a,G=Z.b,z=x.b;if(0>gn(B,g)){h=c(z,d(n,B,G,L));continue n}return gn(B,g)>0?c(x,d(t,g,k,L)):c(z,H(r,B,G,k,L))}return c(x,d(t,g,k,L))}})),b=d(ao,i,c(ta(u),a),o),l=b.a,p=b.b;return d(Bn,s((function(g,k){return d(n,g.a,g.b,k)})),p,l)})),Hp=s((function(n,r){return{bZ:r,cc:n}})),Rp=vm,Jp=C((function(n,r,t){return e(Gu,(function(u){return c(r,u)}),d(Im,t.a?Nt:Zm,t.b,(function(u){return e(Rp,n,e(Hp,r,u))})))})),gb=s((function(n,r){return d(ao,_t,r,n)})),Qp=C((function(n,r,t){var u=C((function(g,k,h){var x=h.c;return En(h.a,h.b,e(m,d(Jp,n,g,k),x))})),o=C((function(g,k,h){var x=h.b,L=h.c;return En(e(m,k,h.a),x,L)})),a=fn((function(g,k,h,x){var L=x.c;return En(x.a,d(_t,g,k,x.b),L)})),i=e(S,Vp,r),b=Mn(Fp,o,a,u,t.cj,Re(i),En($,wt,$)),l=b.b,p=b.c;return e(Le,(function(g){return Xr(e(hb,i,e(gb,l,Re(g))))}),e(Le,(function(){return no(p)}),no(e(S,Yp,b.a))))})),Xp=C((function(n,r,t){var u=r.cc,o=r.bZ,a=e(ir,(function(i){var b=i.b.c;return R(i.a,u)?e(Em,b,o):A}),t.cz);return e(Le,(function(){return Xr(t)}),no(e(S,sb(n),a)))})),Gp=s((function(n,r){return d(kb,r.a,r.b,e(Vn,n,r.c))}));ft["Browser.Events"]=ji(Np,Qp,Xp,0,Gp);var nv=zi("Browser.Events"),$b=C((function(n,r,t){return nv(d(kb,n,r,t))})),rv=e($b,0,"keydown"),ev=e($b,0,"keyup"),tv=bm,xb=s((function(n,r){return lb(e(tv,e(or,e(or,Xr,n),pn),e(Le,e(or,e(or,Xr,n),J),r)))})),uv=function(n){return n.cD},ov=Pm("focus"),Pa=function(n){return n.a},wb=function(n){return e(Ta,Sa,ie((function(){try{Nt.location=n}catch{fe.location.reload(!1)}})))},Oa=Wm,av=C((function(n,r,t){for(;;){var u=e(fa,mr,n),o=u.a,a=u.b;if(0>gn(dt(o),mr))return e(tf,!0,{r,n:t,p:o});n=a,r=e(m,ia(o),r),t+=1}})),cv=s((function(n,r){return(t=d(Vi,s((function(u,o){return n(u)?e(m,u,o):o})),$,r)).b?d(av,t,$,0):ca;var t})),yb=s((function(n,r){if(n==="")return r;var t=Ke(n);return e(cv,(function(u){return e(eu,t,Ke(u.cD))}),r)})),iv=Om,fv=s((function(n,r){return n.$===1?r:r+":"+bn(n.a)})),_b=C((function(n,r,t){return r.$===1?t:K(t,K(n,r.a))})),Ut=s((function(n,r){return c(U(n,{aw:r(n.aw)}),Zn)})),bv=C((function(n,r,t){var u=s((function(P,hr){return c(U(t,{F:e(m,c(P,hr),t.F)}),Zn)})),o=Ia(n.bK),a=e(W,"",e(rn,(function(P){return P+" / "}),e(rn,uv,e(qa,n,t.cJ))));switch(r.$){case 1:var i=r.a;return i.$===1?c(t,wb(b=i.a)):e(eu,"/logAction",(b=i.a).bt)?e(u,a,"Navigate to: "+d(wn,"/logAction","",b.bt)):c(t,e(Oa,t.Z,(function(P){return d(_b,"#",P.c9,d(_b,"?",P.co,K(e(fv,P.ck,K(P.cn?"https://":"http://",P.b4)),P.bt)))})(b)));case 2:var b;if((b=e(Za,o,r.a))==="/")return e(W,c(U(t,{cJ:"/"}),Zn),e(rn,(function(P){return c(t,e(Oa,t.Z,o?"#"+ro(P):ro(P)))}),e(Qe,0,n.Q)));var l=e(uu,(function(P){return e(Qe,P,n.Q)}),e(ve,b,n.cX));if(l.$)return c(U(t,{B:!1,cJ:b}),e(Ea,t.Z,o?"#/":"/"));var p=l.a,g=e(W,c(t.z,Zn),e(rn,uo(_),d(vb,s((function(P,hr){return hr(P)})),t.z,pb(p)))),k=g.b;return c(U(t,{B:!1,z:g.a,cJ:b}),$f(f([k,e(xb,(function(){return oo}),d(iv,"elm-book-main",0,0))])));case 5:var h=!t.S;return c(U(t,{S:h,z:e(rn,n.cy.ch(h),t.z)}),Zn);case 3:var x=r.a;return e(W,c(t,Zn),e(rn,uo((function(P){return U(t,{z:_(P)})})),e(rn,x,t.z)));case 4:return e(u,r.a,r.b);case 6:return c(U(t,{ac:!0}),Zn);case 7:return c(U(t,{ac:!1}),Zn);case 8:return c(U(t,{A:0,aj:!0}),Zn);case 9:default:return c(t,Zn);case 10:return c(U(t,{A:0,_:r.a}),Zn);case 11:return c(U(t,{B:!t.B}),Zn);case 12:return c(U(t,{A:t.A+1}),Zn);case 13:return c(U(t,{A:t.A-1}),Zn);case 14:return c(U(t,{aP:!0}),Zn);case 15:return c(U(t,{aP:!1}),Zn);case 16:return c(U(t,{ai:!0}),Zn);case 17:return c(U(t,{ai:!1}),Zn);case 19:return c(t,t.ai?e(xb,(function(){return oo}),ov("elm-book-search")):Zn);case 18:if(t.aj){var L=e(yb,t._,n.Q),Z=(function(P){return!P.a})(L)?A:e(Qe,e(Jr,Pa(L),t.A),L);if(Z.$)return c(t,Zn);var B=Z.a;return(function(P){return P.b8})(B)?c(t,e(Oa,t.Z,e(zt,o,B))):c(t,wb(ro(B)))}return c(t,Zn);case 20:var G=r.a,z=r.b;return e(Ut,t,(function(P){return U(P,{cT:_("linear-gradient(150deg, "+G+" 0%, "+z+" 100%)")})}));case 21:var N=r.a;return e(Ut,t,(function(P){return U(P,{cT:_(N)})}));case 22:var cn=r.a;return e(Ut,t,(function(P){return U(P,{cP:_(cn)})}));case 23:var dn=r.a;return e(Ut,t,(function(P){return U(P,{dA:_(dn)})}));case 24:var yn=r.a;return e(Ut,t,(function(P){return U(P,{dy:_(yn)})}));case 25:var Sn=r.a;return e(Ut,t,(function(P){return U(P,{dz:_(Sn)})}))}})),sv={$:7},lv={$:6},dv=function(n){return{$:10,a:n}},mv={$:9},pv={$:8},vv={$:5},kv={$:11},hv=s((function(n,r){return U(n,{cP:e(W,n.cP,r.cP),cT:e(W,n.cT,r.cT),dy:e(W,n.dy,r.dy),dz:e(W,n.dz,r.dz),dA:e(W,n.dA,r.dA)})})),gv=function(n){var r=n;return K(e(W,"",e(rn,(function(t){return t+" / "}),r.b2)),r.cD)},$v=C((function(n,r,t){return t.$?(u=t.a,e(W,en(""),e(rn,e(or,n,u),r))):n(u=t.a);var u})),ke=tn("p"),Ab=s((function(n,r){var t=r.a,u=r.b;return e(I,f([j("elm-book-wrapper elm-book-action-log-item-wrapper elm-book-monospace")]),f([e(ke,f([j("elm-book-action-log-item-index")]),f([en("("+bn(n+1)+")")])),e(I,f([j("elm-book-action-log__main")]),f([e(ke,f([j("elm-book-action-log-item-preffix")]),f([en(t)])),e(ke,f([j("elm-book-action-log-item-label")]),f([en(u)]))]))]))})),ou=tn("li"),Cb="--elm-book-background",au=function(n){return"var("+n+")"},jb=au(Cb),co=tn("ul"),xv=function(n){return e(I,f([j("elm-book elm-book-action-log-list-wrapper")]),f([e(ke,f([j("elm-book elm-book-action-log-list-header elm-book-sans"),e(Qr,"background",jb)]),f([en("Action log")])),e(co,f([j("elm-book elm-book-action-log-list")]),e(S,(function(r){return e(ou,f([j("elm-book elm-book-action-log-list-item")]),f([r]))}),qn(e(Vt,Ab,n))))]))},zb=s((function(n,r){return c(r.a,n(r.b))})),wv=e(I,f([j("elm-book-monospace elm-book-action-log-preview-empty-wrapper")]),f([e(I,f([j("elm-book-action-log-preview-empty")]),f([en("Your logged actions will appear here.")]))])),Ub=function(n){return n.bD},yv=s((function(n,r){return{df:e(W,n.df,r.df)}})),Lb=s((function(n,r){var t=r;return{cT:e(W,n.cT,t.cT),a7:e(W,n.a7,t.a7),db:e(W,n.db,t.db),de:e(W,n.de,t.de)}})),io=tn("article"),Ma=s((function(n,r){return r.$?pn(r.a):n(r.a)})),_v=cr("align"),Av=cr("alt"),Cv=tn("blockquote"),jv=tn("br"),zv=C((function(n,r,t){return{bU:r,dQ:t,dW:n}})),Uv=function(n){return d(zv,n.dW,n.bU,n.dQ)},Kb=s((function(n,r){n:for(;;)switch(n.$){case 0:return r;case 1:var t=n.b;n=n.a,r=e(m,t,r);continue n;default:var u=n.b;n=n.a,r=e(Kb,u,r);continue n}})),Tn=s((function(n,r){var t=n({bU:1,f:$,h:1,d:0,dW:1,bx:r});return t.$?pn(e(Kb,t.b,$)):J(t.b)})),cu=s((function(n,r){var t=e(Tn,n,r);return t.$?pn(e(S,Uv,t.a)):J(t.a)})),Db=function(n){return{da:n,V:A}},Xe={$:2},Ba=s((function(n,r){var t=r.a,u=r.b;switch(t.$){case 0:case 2:return{cR:"",dS:0,j:u};case 1:return{cR:"",dS:1,j:u};default:var o=n(t.a);return{cR:o.b,dS:o.a,j:u}}})),Lv=C((function(n,r,t){var u=r.a,o=r.b,a=t.a,i=t.b,b=t.c;if(R(u,Xe))return En(e(m,Db(i),a),f([e(Ba,n,c(u,o))]),A);if(R(_(u),b)){if(i.b){var l=i.a,p=i.b;return En(a,e(m,U(l,{j:K(o,l.j)}),p),b)}return En(a,e(m,e(Ba,n,c(u,o)),i),b)}return En(a,e(m,e(Ba,n,c(u,o)),i),_(u))})),iu=s((function(n,r){return(function(t){var u=t.a;return e(m,Db(t.b),u)})(d(Bn,Lv(n),En($,$,A),r))})),Pn=s((function(n,r){return{$:1,a:n,b:r}})),On=C((function(n,r,t){return{$:0,a:n,b:r,c:t}})),Kv=fn((function(n,r,t,u){for(;;){var o=t(r)(u);if(o.$)return a=o.a,e(Pn,n||a,o.b);var a=o.a,i=o.b,b=o.c;if(i.$)return d(On,n||a,i.a,b);n=n||a,r=i.a,u=b}})),he=s((function(n,r){return function(t){return H(Kv,!1,n,r,t)}})),V=s((function(n,r){var t=r;return function(u){var o=t(u);if(o.$)return e(Pn,o.a,o.b);var a=o.c;return d(On,o.a,n(o.b),a)}})),v=V,sr=function(n){return{$:1,a:n}},hn=function(n){return{$:0,a:n}},Dv=function(n){return n.$?sr(n.a):hn(n.a)},sn=s((function(n,r){return e(he,n,(function(t){return e(v,Dv,r(t))}))})),un=function(n){return{$:1,a:n}},D=function(n){return{$:0,a:n}},on={$:0},jn=s((function(n,r){var t=r;return function(u){var o=t(u);if(o.$===1)return e(Pn,o.a,o.b);var a=o.a,i=o.c,b=n(o.b)(i);if(b.$===1){var l=b.a;return e(Pn,a||l,b.b)}return l=b.a,d(On,a||l,b.b,b.c)}})),Cn=jn,Cr=function(n){return{$:1,a:n}},T=function(n){return{$:3,a:n}},Na={$:0},Sv={$:11},Sb=s((function(n,r){return{$:1,a:n,b:r}})),Tb=fn((function(n,r,t,u){return{bU:r,c1:u,dQ:t,dW:n}})),Va={$:0},Gr=s((function(n,r){return e(Sb,Va,H(Tb,n.dW,n.bU,r,n.f))})),Ya=Bm,Ir=s((function(n,r){return function(t){var u=d(Ya,n,t.d,t.bx);return R(u,-1)?e(Pn,!1,e(Gr,t,r)):R(u,-2)?d(On,!0,0,{bU:1,f:t.f,h:t.h,d:t.d+1,dW:t.dW+1,bx:t.bx}):d(On,!0,0,{bU:t.bU+1,f:t.f,h:t.h,d:u,dW:t.dW,bx:t.bx})}})),Nn=function(n){return e(Ir,n,Sv)},Tv=Wn((function(n,r,t,u,o){for(;;){var a=d(Ya,n,r,o.bx);if(R(a,-1))return d(On,0>gn(o.d,r),0,{bU:u,f:o.f,h:o.h,d:r,dW:t,bx:o.bx});R(a,-2)?(r+=1,t+=1,u=1):(r=a,u+=1)}})),Un=function(n){return function(r){return M(Tv,n,r.d,r.dW,r.bU,r)}},Fa=Un,Wb=C((function(n,r,t){var u=r,o=t;return function(a){var i=u(a);if(i.$===1)return e(Pn,i.a,i.b);var b=i.a,l=i.b,p=o(i.c);if(p.$===1){var g=p.a;return e(Pn,b||g,p.b)}g=p.a;var k=p.c;return d(On,b||g,e(n,l,p.b),k)}})),w=s((function(n,r){return d(Wb,An,n,r)})),tr=w,y=function(n){return function(r){return d(On,!1,n,r)}},Q=y,an=function(n){return e(tr,e(tr,Q(0),Nn(n)),Fa(n))},jr=s((function(n,r){var t=r;return function(u){var o=t(u);if(o.$===1)return e(Pn,o.a,o.b);var a=o.b,i=o.c;return d(On,o.a,e(n,d(de,u.d,i.d,u.bx),a),i)}})),Dn=function(n){return e(jr,An,n)},q=Dn,Wv=wt,qb=s((function(n,r){return d(_t,n,0,r)})),Qn=function(n){return d(Bn,qb,Wv,n)},qv=Qn(f(["and","or","not","only"])),Zv=s((function(n,r){return!e(ve,n,r).$})),Xn=s((function(n,r){return e(Zv,n,r)})),Zb=function(n){return n==="/"},zr=function(n){return n===`
`},Lt=function(n){return n===" "||n==="	"},ge=function(n){return Lt(n)||zr(n)},Iv=Qn(f([":","{","}",",",".","#",">","+","~","*","[","]","|",";","(",")"])),Er=function(n){return!(ge(n)||Zb(n)||e(Xn,n,Iv))},Ib=function(n){return e(v,(function(r){return(function(t){return e(Xn,t,qv)})(r)?e(m,c(T(Cr(2)),r),n):e(m,c(T(Cr(3)),r),n)}),q(an(Er)))},Ev=Qn(f(["@page","@font-face","@swash","@annotation","@ornaments","@stylistic","@styleset","@character-variant"])),Pv=s((function(n,r){return{$:2,a:n,b:r}})),Ov=C((function(n,r,t){n:for(;;){if(t.b){var u=t.b,o=(0,t.a)(n);if(o.$){var a;if((a=o).a)return a;r=e(Pv,r,a.b),t=u;continue n}return o}return e(Pn,!1,r)}})),Y=function(n){return function(r){return d(Ov,r,Va,n)}},O=Y,fu={$:1},Eb=C((function(n,r,t){return e(Cn,(function(u){return n(K(u,r))}),t)})),Ha=C((function(n,r,t){return e(Cn,(function(u){return n(e(m,u,r))}),t)})),Pb={$:10},Kt=function(n){return function(r){return R(Ln(r.bx),r.d)?d(On,!1,0,r):e(Pn,!1,e(Gr,r,n))}},Ob=Kt(Pb),lr=function(n){return{$:8,a:n}},nn=s((function(n,r){return{$:0,a:n,b:r}})),Mb=Mm,Fn=function(n){var r=n.a,t=n.b,u=!br(r);return function(o){var a=M(Mb,r,o.d,o.dW,o.bU,o.bx),i=a.a,b=a.b,l=a.c;return R(i,-1)?e(Pn,!1,e(Gr,o,t)):d(On,u,0,{bU:l,f:o.f,h:o.h,d:i,dW:b,bx:o.bx})}},ln=Fn,F=function(n){return ln(e(nn,n,lr(n)))},dr=s((function(n,r){return e(tr,r,Fa(n))})),fo=s((function(n,r){var t=n.b7,u=n.g,o=n.ca,a=n.bY;return O(f([e(v,An(e(m,a(u),r)),F(u)),e(v,An(r),Ob),d(Eb,fo(n),r,O(t)),d(Ha,fo(n),r,e(v,a,q(e(dr,o,Nn(An(!0))))))]))})),bo=C((function(n,r,t){var u=r.b7,o=r.g,a=r.i,i=r.ca,b=r.bY;return O(f([e(Cn,(function(l){return n===1?Q(l):d(bo,n-1,r,l)}),e(v,An(e(m,b(o),t)),F(o))),d(Ha,e(bo,n+1,r),t,e(v,b,q(e(dr,i,F(a))))),d(Eb,fo(r),t,O(u)),e(v,An(t),Ob),d(Ha,e(bo,n,r),t,e(v,b,q(e(dr,i,Nn(An(!0))))))]))})),xn=function(n){return{$:12,a:n}},kn=function(n){return function(r){return e(Pn,!1,e(Gr,r,n))}},Bb=function(n){return kn(xn(n))},Mv=s((function(n,r){var t=n.ca,u=c(Eu(n.i),Eu(n.g));if(u.a.$===1)return Bb("Trying to parse a delimited helper, but the start token cannot be an empty string!");if(u.b.$===1)return Bb("Trying to parse a delimited helper, but the end token cannot be an empty string!");var o=u.a.a.a,a=u.b.a.a;return n.b9?d(bo,1,U(n,{ca:function(i){return t(i)&&!R(i,o)&&!R(i,a)}}),r):e(fo,U(n,{ca:function(i){return t(i)&&!R(i,a)}}),r)})),Ur=function(n){var r=n.i;return e(Cn,(function(t){return e(Mv,n,f([t]))}),e(v,An((0,n.bY)(r)),F(r)))},Ra=e(v,(function(){return f([c(Xe,`
`)])}),F(`
`)),Bv=Ur({bY:function(n){return c(fu,n)},g:"*/",b7:f([Ra]),b9:!1,ca:function(n){return!zr(n)},i:"/*"}),Pr=function(n){return O(f([e(v,(function(r){return D(e(m,c(on,r),n))}),q(an(Lt))),e(v,(function(r){return D(K(r,n))}),Ra),e(v,(function(r){return D(K(r,n))}),Bv)]))},Nb=function(n){return e(sn,f([c(T(Cr(0)),n)]),(function(r){return O(f([Pr(r),e(v,(function(t){return D(e(m,c(T(Cr(1)),t),r))}),q(an(Er))),e(v,(function(t){return D(e(m,c(on,t),r))}),q(Nn((function(t){return t!=="{"})))),Q(un(r))]))}))},Ja=function(n){return O(f([e(v,An(e(m,c(on,"{"),n)),F("{")),Q(n)]))},Qa={$:5},zn=function(n){var r=n;return function(t){var u=r(t);return u.$===1?e(Pn,!1,u.b):d(On,!1,u.b,u.c)}},De=zn,Nv=Qn(f(["'",'"',"\\","n","r","t","b","f","v"])),Xa=e(tr,e(tr,Q(0),De(F("\\"))),Nn((function(n){return e(Xn,n,Nv)}))),Vv=e(v,(function(n){return f([c(T(Qa),n)])}),q(Xa)),bu=function(n){return n==="\\"},Vb={bY:function(n){return c(T(Na),n)},g:"'",b7:f([Ra,Vv]),b9:!1,ca:function(n){return!(zr(n)||bu(n))},i:"'"},Yv=Ur(U(Vb,{g:'"',i:'"'})),Fv=Ur(Vb),Ge=function(n){return e(v,(function(r){return K(r,n)}),O(f([Fv,Yv])))},Yb={$:4},su=s((function(n,r){return e(Cn,(function(t){return O(f([Ge(t),e(v,(function(u){return e(m,c(T(Na),u),t)}),q(an((function(u){return u!==")"})))),Q(t)]))}),e(v,An(e(m,c(on,"("),e(m,c(T(Yb),n),r))),F(n+"(")))})),Hv=e(Cn,(function(n){switch(n){case"@import":return e(sn,f([c(T(Cr(0)),n)]),(function(r){return O(f([Pr(r),e(v,D,e(su,"url",r)),e(v,D,Ge(r)),e(v,D,Ib(r)),e(v,(function(t){return D(e(m,c(on,t),r))}),q(Nn((function(t){return t!==";"})))),Q(un(r))]))}));case"@namespace":return e(sn,f([c(T(Cr(0)),n)]),(function(r){return O(f([Pr(r),e(v,D,e(su,"url",r)),e(v,D,Ge(r)),e(v,(function(t){return D(e(m,c(T(Cr(1)),t),r))}),q(an(Er))),e(v,(function(t){return D(e(m,c(on,t),r))}),q(Nn((function(t){return t!==";"})))),Q(un(r))]))}));case"@charset":return e(sn,f([c(T(Cr(0)),n)]),(function(r){return O(f([Pr(r),e(v,D,Ge(r)),e(v,(function(t){return D(e(m,c(T(Na),t),r))}),q(an(Er))),e(v,(function(t){return D(e(m,c(on,t),r))}),q(Nn((function(t){return t!==";"})))),Q(un(r))]))}));case"@media":case"@supports":return(function(r){return e(Cn,Ja,e(sn,f([c(T(Cr(0)),r)]),(function(t){return O(f([Pr(t),e(v,D,Ge(t)),e(v,D,Ib(t)),e(v,(function(u){return D(e(m,c(on,u),t))}),q(Nn((function(u){return u!=="{"})))),Q(un(t))]))})))})(n);case"@keyframes":return e(Cn,Ja,Nb(n));case"@counter-style":return Nb(n);case"@font-feature-values":return e(Cn,Ja,e(sn,f([c(T(Cr(0)),n)]),(function(r){return O(f([Pr(r),e(v,(function(t){return D(e(m,c(T(Cr(1)),t),r))}),q(an(Er))),e(v,(function(t){return D(e(m,c(on,t),r))}),q(Nn((function(t){return t!=="{"})))),Q(un(r))]))})));default:return Q(f(e(Xn,n,Ev)?[c(T(Cr(0)),n)]:[c(on,n)]))}}),q(e(dr,Er,F("@")))),Rv={$:3},Fb=function(n){return!(ge(n)||Zb(n)||n===":"||n===";"||n==="}")},Hb={$:6},Jv=Qn(f(["+","-","%","*","/"])),Rb=function(n){return e(Xn,n,Jv)},Jb=function(n){return Fb(n)&&!(n==="("||n===")"||n===","||Rb(n))},Qv=function(n){return e(v,(function(r){return e(m,c(T(Qa),r),n)}),q(e(dr,Jb,F("#"))))},Xv=function(n){return n==="("||n===")"||n===":"||n===","||n==="/"},Gv=Qn(f(["em","ex","ch","rem","vw","vh","vmin","vmax","cm","mm","q","in","pt","pc","px","deg","grad","rad","turn","s","ms","Hz","kHz","dpi","dpcm","dppx"])),Qb=function(n){return oa(n)||n==="."},Xb=e(tr,e(tr,Q(0),Nn(Qb)),Fa(Qb)),n1=e(tr,e(tr,Q(0),De(F("-"))),Xb),so=O(f([Xb,n1])),r1=e(v,(function(n){return c(T(Qa),n)}),q(so)),e1=function(n){return O(f([Pr(n),e(v,D,Ge(n)),e(v,(function(r){return D(e(m,r,n))}),r1),e(v,D,Qv(n)),e(v,D,e(su,"url",n)),e(v,D,e(su,"format",n)),e(v,D,e(su,"local",n)),e(v,(function(r){return(function(t){return e(Xn,t,Gv)})(r)?D(e(m,c(T(Hb),r),n)):D(e(m,c(T(Yb),r),n))}),q(an(Jb))),e(v,(function(r){return D(e(m,c(on,r),n))}),q(an(Xv))),e(v,(function(r){return D(e(m,c(T(Hb),r),n))}),q(an(Rb))),Q(un(n))]))},t1=e(Cn,(function(n){return e(sn,f([n]),e1)}),e(v,(function(n){return c(on,n)}),q(an(Pu(":"))))),u1=function(n){return O(f([Pr(n),e(v,(function(r){return D(e(m,c(T(Rv),r),n))}),q(an(Fb))),e(v,(function(r){return D(e(m,c(on,r),n))}),q(an((function(r){return r===";"||r==="/"})))),e(v,(function(r){return D(K(r,n))}),t1),Q(un(n))]))},o1=e(Cn,(function(n){return e(sn,f([n]),u1)}),e(v,(function(n){return c(on,n)}),q(an((function(n){return n==="{"}))))),lo=function(n){return{$:2,a:n}},Ga=function(n){return{$:5,a:n}},a1=Qn(f(["=","~","|","^","$","*"])),Gb=s((function(n,r){return e(gb,n,r)})),c1=Qn(f([" ","	",`
`])),i1=e(qb,"]",e(Gb,a1,c1)),f1=e(v,(function(n){return c(T(lo(Ga(0))),n)}),q(an((function(n){return!e(Xn,n,i1)})))),b1=e(v,(function(n){return c(T(lo(Ga(2))),n)}),q(O(f([F("~="),F("|="),F("^="),F("$="),F("*="),F("=")])))),s1=function(n){return O(f([Pr(n),e(v,un,Ge(n)),e(v,un,e(v,(function(r){return e(m,c(T(lo(Ga(1))),r),n)}),q(an((function(r){return r!=="]"&&!ge(r)}))))),Q(un(n))]))},l1=function(n){return O(f([Pr(n),e(v,(function(r){return D(e(m,r,n))}),f1),e(Cn,(function(r){return e(v,(function(t){return D(K(t,n))}),e(sn,f([r]),s1))}),b1),Q(un(n))]))},d1=e(Cn,(function(n){return e(sn,f([n]),l1)}),e(v,An(c(on,"[")),F("["))),m1={$:2},p1=e(v,(function(n){return c(m1,n)}),q(e(dr,Er,F(".")))),v1={$:3},k1=e(v,(function(n){return c(v1,n)}),q(O(f([F("+"),F("~"),F(">")])))),h1={$:0},g1=e(v,(function(n){return c(h1,n)}),q(an(Er))),$1={$:1},x1=e(v,(function(n){return c($1,n)}),q(e(dr,Er,F("#")))),w1={$:7},y1=e(v,(function(n){return c(w1,n)}),q(e(dr,Er,F(":")))),_1={$:6},A1=e(v,(function(n){return c(_1,n)}),q(e(dr,Er,F("::")))),C1=e(v,An(c({$:4},"*")),F("*")),j1=O(f([e(v,(function(n){var r=n.b;return f([c(T(lo(n.a)),r)])}),O(f([x1,p1,g1,C1,k1,A1,y1]))),d1])),z1=e(Kn,cu(e(sn,$,(function(n){return O(f([Pr(n),e(v,(function(r){return D(K(r,n))}),Hv),e(v,(function(r){return D(K(r,n))}),j1),e(v,(function(r){return D(K(r,n))}),o1),e(v,(function(r){return D(e(m,c(on,r),n))}),q(Nn(An(!0)))),Q(un(n))]))}))),$n(iu((function(n){switch(n.$){case 0:return c(3,"css-s");case 1:return(function(r){switch(r){case 0:return c(4,"css-ar-i");case 1:return c(6,"css-ar-p");case 2:return c(4,"css-ar-k");default:return c(5,"css-ar-v")}})(n.a);case 2:return(function(r){switch(r.$){case 0:return c(4,"css-s-e");case 1:return c(6,"css-s-i");case 2:return c(6,"css-s-cl");case 3:return c(8,"css-s-c");case 4:return c(4,"css-s-u");case 5:return(function(t){switch(t){case 0:return c(6,"css-s-a-an");case 1:return c(3,"css-s-a-av");default:return c(4,"css-s-a-o")}})(r.a);case 6:return c(0,"css-s-pe");default:return c(0,"css-s-pc")}})(n.a);case 3:return c(5,"css-p");case 4:return c(5,"css-pv");case 5:return c(2,"css-n");default:return c(4,"css-u")}})))),U1=e(Kn,z1,$n(_n)),ns=ya("disabled"),L1=e(v,(function(n){return f([c(fu,n)])}),q(e(dr,e(or,Rr,zr),F("--")))),rs=e(v,(function(){return f([c(Xe,`
`)])}),F(`
`)),K1=Ur({bY:function(n){return c(fu,n)},g:"-}",b7:f([rs]),b9:!0,ca:function(n){return!zr(n)},i:"{-"}),nc=O(f([L1,K1])),D1=Qn(f(["|",".","=","\\","/","(",")","-",">","<",":","+","!","$","%","&","*"])),es=function(n){return e(Xn,n,D1)},S1=q(an(es)),T1=Qn(f([",","[","]","{","}"])),ts=function(n){return e(Xn,n,T1)},rc=function(n){return!(ge(n)||es(n)||ts(n)||(function(r){return r==='"'||r==="'"})(n))},W1=q(e(dr,rc,Nn(Ve))),q1=q(an(ts)),Z1=Qn(f(["+","-","/","*","=",".","$","<",">",":","&","|","^","?","%","#","@","~","!",","])),us=e(v,(function(n){return c(T(5),n)}),q(e(tr,e(tr,e(tr,Q(0),De(F("("))),De(an((function(n){return e(Xn,n,Z1)})))),De(F(")"))))),I1=Qn(f(["as","where","let","in","if","else","then","case","of","type","alias"])),os=function(n){return e(Xn,n,I1)},ec=q(e(dr,rc,Nn(ua))),E1=q(an(rc)),as=O(f([e(v,(function(n){return c(T(7),n)}),q(so)),e(v,An(c(T(3),"()")),F("()")),us,e(v,(function(n){return c(T(1),n)}),S1),e(v,(function(n){return c(T(2),n)}),q1),e(v,(function(n){return c(T(3),n)}),W1),e(v,(function(n){return os(n)?c(T(4),n):c(on,n)}),ec),e(v,(function(n){return c(on,n)}),E1)])),P1=e(v,(function(n){return f([c(T(3),n)])}),q(Xa)),tc={bY:function(n){return c(T(0),n)},g:'"',b7:f([rs,P1]),b9:!1,ca:function(n){return!(zr(n)||bu(n))},i:'"'},O1=Ur(tc),M1=Ur(U(tc,{g:"'",i:"'"})),B1=Ur(U(tc,{g:'"""',i:'"""'})),cs=O(f([B1,O1,M1])),uc=e(v,(function(){return c(Xe,`
`)}),F(`
`)),oc=e(v,(function(n){return c(on,n)}),q(an(Lt))),N1=function(n){return O(f([nt(n),Q(un(n))]))},nt=function(n){return O(f([e(v,(function(r){return D(e(m,r,n))}),oc),e(Cn,N1,e(v,(function(r){return e(m,r,n)}),uc)),e(v,(function(r){return D(K(r,n))}),nc)]))},lu=function(n){return O(f([nt(n),e(v,(function(r){return D(K(r,n))}),cs),e(v,(function(r){return D(e(m,r,n))}),as),Q(un(n))]))},is=function(n){return!(ge(n)||n==="("||n===")"||n==="-"||n===",")},V1=O(f([e(v,An(c(T(6),"()")),F("()")),e(v,An(c(T(1),"->")),F("->")),e(v,(function(n){return c(on,n)}),q(an((function(n){return n==="("||n===")"||n==="-"||n===","})))),e(v,(function(n){return c(T(6),n)}),q(e(dr,is,Nn(Ve)))),e(v,(function(n){return c(on,n)}),q(an(is)))])),Y1=function(n){return O(f([nt(n),e(v,(function(r){return D(e(m,r,n))}),V1),Q(un(n))]))},fs=function(n){return O(f([e(v,un,e(Cn,(function(r){return e(sn,r,Y1)}),e(v,An(e(m,c(T(1),":"),n)),F(":")))),nt(n),e(v,un,e(sn,n,lu)),Q(un(n))]))},mo=function(n){return n==="-"||n==="{"},ac=q(Nn(mo)),du=function(n){return(function(r){var t=r.a,u=r.b,o=!br(t);return function(a){var i=M(Mb,t,a.d,a.dW,a.bU,a.bx),b=i.a,l=i.b,p=i.c;return R(b,-1)||d(Ya,(function(g){return aa(g)||g==="_"}),b,a.bx)>=0?e(Pn,!1,e(Gr,a,u)):d(On,o,0,{bU:p,f:a.f,h:a.h,d:b,dW:l,bx:a.bx})}})(e(nn,n,{$:9,a:n}))},F1=function(n){return!(ge(n)||mo(n)||n==="(")},bs=function(n){return!(ge(n)||mo(n)||n==="("||n===")"||n===","||n===".")},H1=function(n){return zr(n)||mo(n)||n==="("||n===")"},R1=function(n){var r=n.b;return O(f([ss(c(n.a,r)),Q(un(r))]))},ss=function(n){var r=n.a,t=n.b;return O(f([e(v,(function(u){return D(c(r,e(m,u,t)))}),oc),e(Cn,R1,e(v,(function(u){return c(r,e(m,u,t))}),uc)),e(v,(function(u){return D(c(r,K(u,t)))}),nc)]))},J1=function(n){var r=n.a,t=n.b;return O(f([ss(c(r,t)),e(v,(function(u){return D(c(r+1,u))}),e(v,An(e(m,c(on,"("),t)),F("("))),e(v,(function(u){return r?D(c(r-1,u)):un(u)}),e(v,An(e(m,c(on,")"),t)),F(")"))),e(v,(function(u){return D(c(r,e(m,u,t)))}),O(f([e(v,(function(u){return c(on,u)}),ac),e(v,(function(u){return c(on,u)}),q(an(e(or,Rr,H1))))]))),Q(un(t))]))},Q1=function(n){return O(f([nt(n),e(v,un,e(v,An(e(m,c(on,")"),n)),F(")"))),e(v,(function(r){return D(e(m,r,n))}),O(f([us,e(v,(function(r){return c(on,r)}),ac),e(v,(function(r){return c(on,r)}),q(an((function(r){return r===","||r==="."})))),e(v,(function(r){return c(T(6),r)}),q(e(dr,bs,Nn(Ve)))),e(v,(function(r){return c(T(5),r)}),q(an(bs)))]))),e(v,D,e(Cn,(function(r){return e(sn,c(0,r),J1)}),e(v,An(e(m,c(on,"("),n)),F("(")))),Q(un(n))]))},ls=function(n){return O(f([nt(n),e(v,D,e(Cn,(function(r){return e(sn,r,Q1)}),e(v,An(e(m,c(on,"("),n)),F("(")))),e(v,(function(r){return D(e(m,r,n))}),O(f([e(v,(function(r){return c(on,r)}),ac),e(v,An(c(T(4),"exposing")),du("exposing")),e(v,An(c(T(4),"as")),du("as")),e(v,(function(r){return c(on,r)}),q(an(F1)))]))),Q(un(n))]))},X1=s((function(n,r){return r==="module"?e(sn,e(m,c(T(4),r),n),ls):e(sn,e(m,c(T(5),r),n),fs)})),G1=function(n){return O(f([nt(n),e(v,un,e(Cn,X1(n),ec)),e(v,un,e(sn,n,lu)),Q(un(n))]))},nk=s((function(n,r){return r==="module"||r==="import"?e(sn,e(m,c(T(4),r),n),ls):r==="port"?e(sn,e(m,c(T(4),r),n),G1):os(r)?e(sn,e(m,c(T(4),r),n),lu):e(sn,e(m,c(T(5),r),n),fs)})),rk=e(Kn,cu(e(sn,$,(function(n){return O(f([e(v,(function(r){return D(e(m,r,n))}),oc),e(v,(function(r){return D(e(m,r,n))}),uc),e(v,(function(r){return D(K(r,n))}),nc),e(v,D,e(Cn,nk(n),ec)),e(v,D,e(Cn,(function(r){return e(sn,K(r,n),lu)}),cs)),e(v,D,e(Cn,(function(r){return e(sn,e(m,r,n),lu)}),as)),Q(un(n))]))}))),$n(iu((function(n){switch(n){case 0:return c(3,"elm-s");case 1:return c(4,"elm-bs");case 2:return c(5,"elm-gs");case 3:return c(7,"elm-c");case 4:return c(4,"elm-k");case 5:return c(6,"elm-f");case 6:return c(5,"elm-ts");default:return c(2,"elm-n")}})))),ek=e(Kn,rk,$n(_n)),tk=tn("em"),ds=tn("h1"),uk=tn("h2"),ok=tn("h3"),ak=tn("h4"),ck=tn("h5"),ik=tn("h6"),cc=tn("hr"),ic=cr("id"),fk=tn("img"),ms=Qn(f(["{","}","(",")","[","]",",",";"])),bk=e(v,(function(n){return c(on,n)}),q(an((function(n){return e(Xn,n,ms)})))),ps=function(n){return n==="/"},vs=Qn(f(["+","-","*","/","=","!","<",">","&","|","?","^",":","~","%","."])),sk=e(Gb,vs,ms),po=function(n){return!((function(r){return e(Xn,r,sk)})(n)||(function(r){return r==='"'||r==="'"||r==="`"})(n)||ps(n)||ge(n))},lk=e(v,(function(n){return f([c(fu,n)])}),q(e(dr,e(or,Rr,zr),F("//")))),vo=e(v,(function(){return f([c(Xe,`
`)])}),F(`
`)),dk=Ur({bY:function(n){return c(fu,n)},g:"*/",b7:f([vo]),b9:!1,ca:function(n){return!zr(n)},i:"/*"}),mk=O(f([lk,dk])),Dt=function(n){return O(f([e(v,(function(r){return D(e(m,c(on,r),n))}),q(an(Lt))),e(v,(function(r){return D(K(r,n))}),vo),e(v,(function(r){return D(K(r,n))}),mk)]))},pk=function(n){return O(f([Dt(n),e(v,(function(r){return D(e(m,c(T(8),r),n))}),q(an(po))),Q(un(n))]))},vk=function(n){return O(f([Dt(n),e(Cn,(function(r){return r==="extends"?e(v,D,e(sn,e(m,c(T(2),r),n),pk)):Q(D(e(m,c(T(5),r),n)))}),q(an(po))),Q(un(n))]))},kk=function(n){return O(f([Dt(n),e(v,(function(r){return D(e(m,c(T(7),r),n))}),q(an((function(r){return!(ps(r)||ge(r)||r===","||r===")")})))),e(v,(function(r){return D(e(m,c(on,r),n))}),q(an((function(r){return r==="/"||r===","})))),Q(un(n))]))},ks=function(n){return O(f([Dt(n),e(v,(function(r){return D(e(m,c(T(5),r),n))}),q(an(po))),e(v,(function(){return D(e(m,c(T(2),"*"),n))}),F("*")),e(v,D,e(Cn,(function(){return e(sn,e(m,c(on,"("),n),kk)}),F("("))),Q(un(n))]))},hk=C((function(n,r,t){return O(f([Dt(t),e(v,(function(){return un(K(e(m,c(on,"("),t),e(m,c(T(4),n),r)))}),F("(")),Q(un(K(t,e(m,c(on,n),r))))]))})),gk=Qn(f(["var","const","let"])),$k=Qn(f(["break","do","instanceof","typeof","case","else","new","catch","finally","return","void","continue","for","switch","while","debugger","this","with","default","if","throw","delete","in","try","enum","extends","export","import","implements","private","public","yield","interface","package","protected"])),xk=Qn(f(["true","false","null","undefined","NaN","Infinity"])),wk=s((function(n,r){return r==="function"||r==="static"?e(sn,e(m,c(T(3),r),n),ks):r==="class"?e(sn,e(m,c(T(3),r),n),vk):r==="this"||r==="super"?Q(e(m,c(T(7),r),n)):r==="constructor"?e(sn,e(m,c(T(5),r),n),ks):e(Xn,r,$k)?Q(e(m,c(T(2),r),n)):(function(t){return e(Xn,t,gk)})(r)?Q(e(m,c(T(3),r),n)):(function(t){return e(Xn,t,xk)})(r)?Q(e(m,c(T(6),r),n)):e(sn,$,e(hk,r,n))})),yk=e(v,(function(n){return c(T(0),n)}),q(so)),_k=e(v,(function(n){return c(T(2),n)}),q(an((function(n){return e(Xn,n,vs)})))),hs=e(v,(function(n){return f([c(T(6),n)])}),q(Xa)),fc={bY:function(n){return c(T(1),n)},g:"'",b7:f([vo,hs]),b9:!1,ca:function(n){return!(zr(n)||bu(n))},i:"'"},Ak=Ur(U(fc,{g:'"',i:'"'})),Ck=Ur(fc),jk=Ur(U(fc,{g:"`",b7:f([vo,hs]),ca:function(n){return!(zr(n)||bu(n))},i:"`"})),zk=O(f([Ck,Ak,jk])),Uk=e(Kn,cu(e(sn,$,(function(n){return O(f([Dt(n),e(v,(function(r){return D(K(r,n))}),zk),e(v,(function(r){return D(e(m,r,n))}),O(f([_k,bk,yk]))),e(v,D,e(Cn,wk(n),q(an(po)))),Q(un(n))]))}))),$n(iu((function(n){switch(n){case 0:return c(2,"js-n");case 1:return c(3,"js-s");case 2:return c(4,"js-k");case 3:return c(5,"js-dk");case 4:return c(5,"js-fe");case 5:return c(6,"js-f");case 6:return c(7,"js-lk");case 7:return c(8,"js-p");default:return c(6,"js-ce")}})))),Lk=e(Kn,Uk,$n(_n)),gs={$:5},bc=Ym,Kk=Fm,$s=s((function(n,r){return{bU:r.bU+(n-r.d),f:r.f,h:r.h,d:n,dW:r.dW,bx:r.bx}})),xs=Vm,$e=Nm,Dk=s((function(n,r){if(d($e,101,n,r)||d($e,69,n,r)){var t=n+1,u=d($e,43,t,r)||d($e,45,t,r)?t+1:t,o=e(xs,u,r);return R(u,o)?-o:o}return n})),Sk=s((function(n,r){return e(Dk,d($e,46,n,r)?e(xs,n+1,r):n,r)})),ko=Wn((function(n,r,t,u,o){var a=u.a,i=u.b;if(r.$===1)return e(Pn,!0,e(Gr,o,r.a));var b=r.a;return R(t,a)?e(Pn,0>gn(o.d,t),e(Gr,o,n)):d(On,!0,b(i),e($s,a,o))})),ws=fn((function(n,r,t,u){return e(Sb,Va,H(Tb,n,r,t,u))})),ys=Ae((function(n,r,t,u,o,a){var i=o.a,b=e(Sk,i,a.bx);if(0>b)return e(Pn,!0,H(ws,a.dW,a.bU-(b+a.d),n,a.f));if(R(a.d,b))return e(Pn,!1,e(Gr,a,r));if(R(i,b))return M(ko,n,t,a.d,o,a);if(u.$===1)return e(Pn,!0,e(Gr,a,n));var l=u.a,p=Bu(d(de,a.d,b,a.bx));return p.$===1?e(Pn,!0,e(Gr,a,n)):d(On,!0,l(p.a),e($s,b,a))})),Tk=e(s((function(n,r){return t={bP:pn(r),b_:n,aJ:J(_n),b3:pn(r),aM:J(i0),dk:r,cg:pn(r)},function(u){if(d($e,48,u.d,u.bx)){var o=u.d+1,a=o+1;return d($e,120,o,u.bx)?M(ko,t.dk,t.b3,a,e(Kk,a,u.bx),u):d($e,111,o,u.bx)?M(ko,t.dk,t.cg,a,d(bc,8,a,u.bx),u):d($e,98,o,u.bx)?M(ko,t.dk,t.bP,a,d(bc,2,a,u.bx),u):Mn(ys,t.dk,t.b_,t.aM,t.aJ,c(o,0),u)}return Mn(ys,t.dk,t.b_,t.aM,t.aJ,d(bc,10,u.d,u.bx),u)};var t})),gs,gs),_s=e(tr,Q(0),De(Tk)),Wk=e(tr,e(tr,Q(0),De(F("-"))),_s),qk=O(f([_s,Wk,so])),Zk=e(v,(function(n){return c(T(2),n)}),q(qk)),As=e(v,(function(){return c(Xe,`
`)}),F(`
`)),St=function(n){return f([n])},Ik=Qn(f(['"',"\\","/","b","f","n","r","t","u"])),Ek=e(tr,e(tr,Q(0),De(F("\\"))),Nn((function(n){return e(Xn,n,Ik)}))),Pk=e(v,(function(n){return f([c(T(1),n)])}),q(Ek)),Cs=s((function(n,r){return e(v,(function(t){return K(t,r)}),Ur((function(t){return{bY:function(u){return c(T(t),u)},g:'"',b7:f([e(v,St,As),Pk]),b9:!1,ca:function(u){return!(zr(u)||bu(u))},i:'"'}})(n)))})),Ok=e(v,(function(n){return c(on,n)}),q(an(Lt))),ho=O(f([Ok,As])),Mk=function(n){return O(f([e(v,(function(r){return D(e(m,r,n))}),ho),e(v,(function(r){return D(e(m,r,n))}),e(v,(function(){return c(T(7),",")}),F(","))),e(v,(function(r){return un(e(m,r,n))}),e(v,(function(){return c(T(7),"]")}),F("]"))),e(v,(function(r){return D(K(r,n))}),mu()),Q(un(n))]))},Bk=function(n){return O(f([e(v,(function(r){return D(e(m,r,n))}),ho),e(v,D,e(Cs,5,n)),e(v,D,e(Cn,(function(){var r=e(m,c(T(6),":"),n);return e(v,(function(t){return K(t,r)}),O(f([e(Cn,(function(t){return O(f([e(v,(function(u){return K(u,f([t]))}),mu()),Q(f([t]))]))}),ho),mu(),Q($)])))}),F(":"))),e(v,(function(r){return D(e(m,r,n))}),e(v,(function(){return c(T(6),",")}),F(","))),e(v,(function(r){return un(e(m,r,n))}),e(v,(function(){return c(T(6),"}")}),F("}"))),Q(un(n))]))};function mu(){return O(f([e(Cs,0,$),e(v,(function(n){return f([n])}),Zk),lc(),sc(),e(v,(function(n){return f([c(T(4),n)])}),q(du("null"))),e(v,(function(n){return f([c(T(3),n)])}),q(O(f([du("true"),du("false")]))))]))}function sc(){return e(Cn,(function(){return e(sn,f([c(T(7),"[")]),Mk)}),F("["))}function lc(){return e(Cn,(function(){return e(sn,f([c(T(6),"{")]),Bk)}),F("{"))}var Nk=mu();mu=function(){return Nk};var Vk=sc();sc=function(){return Vk};var js=lc();lc=function(){return js};var Yk=e(Kn,cu(e(sn,$,(function(n){return O(f([e(v,(function(r){return D(e(m,r,n))}),ho),e(v,(function(r){return D(K(r,n))}),js),e(v,(function(r){return D(e(m,c(on,r),n))}),q(Nn(An(!0)))),Q(un(n))]))}))),$n(iu((function(n){switch(n){case 0:return c(3,"json-s");case 1:return c(2,"json-e");case 2:return c(2,"json-n");case 3:return c(4,"json-b");case 4:return c(4,"json-null");case 5:return c(5,"json-k");case 6:return c(0,"json-o");default:return c(0,"json-a")}})))),Fk=e(Kn,Yk,$n(_n)),Hk=e(v,(function(){return c(Xe,`
`)}),F(`
`)),Rk=e(v,(function(n){return c(on,n)}),q(an(Lt))),Jk=O(f([Rk,Hk])),Qk=e(Kn,cu(e(sn,$,(function(n){return O(f([e(v,(function(r){return D(e(m,r,n))}),Jk),e(v,(function(r){return D(e(m,c(on,r),n))}),q(Nn(An(!0)))),Q(un(n))]))}))),$n(iu((function(){return c(0,"nolang")})))),Xk=e(Kn,Qk,$n(_n)),Gk=tn("ol"),nh=s((function(n,r){return n.$===1?r.$?pn(e(m,n.a,r.a)):J(r.a):J(n.a)})),Se=function(n){return!n.b},zs=s((function(n,r){return Se(r)?"<"+n+">":"<"+n+" "+(function(t){return e(Jn," ",e(S,(function(u){return u.L+'="'+u.d$+'"'}),t))})(r)+">"})),Us=function(n){var r,t=e(S,(function(u){return u}),n);return r=d(Bn,s((function(u,o){return C((function(a,i,b){return e(nh,d(u,a,i,b),d(o,a,i,b))}))})),C((function(){return pn($)})),t),C((function(u,o,a){return e(Qu,(function(i){if(i.b){if(i.b.b)return`oneOf failed parsing this value:
    `+e(zs,u,o)+`

Parsing failed in the following 2 ways:


`+e(Jn,`

`,e(Vt,s((function(l,p){return"("+bn(l+1)+") "+p})),i))+`
`;var b=i.a;return`Problem with the given value:

`+e(zs,u,o)+`

`+b+`
`}return"Ran into a oneOf with no possibilities!"}),d(r,u,o,a))}))},go=tn("pre"),rh=tn("strong"),eh=tn("table"),th=tn("tbody"),uh=tn("td"),oh=tn("th"),ah=tn("thead"),Ls=cr("title"),Ks=s((function(n,r){return e(er,(function(t){return wm.test(t)?"data-"+t:t})(n),Di(r))})),dc=function(n){var r,t=n.cR,u=n.dS,o=n.j;return!u&&br(t)?en(o):e(se,f([le(f([c((r=u,"elmsh"+(function(){switch(r){case 0:return"0";case 1:return"-comm";case 2:return"1";case 3:return"2";case 4:return"3";case 5:return"4";case 6:return"5";case 7:return"6";default:return"7"}})()),!!u),c("elmsh-"+t,t!=="")]))]),f([en(o)]))},ch=C((function(n,r,t){var u=t.V,o=t.da;return e(I,f([le(f([c("elmsh-line",!0),c("elmsh-hl",R(u,_(0))),c("elmsh-add",R(u,_(1))),c("elmsh-del",R(u,_(2)))])),e(Ks,"data-elmsh-lc",bn(n+r))]),e(S,dc,o))})),ih=function(n){return e(Yu,f([j("elmsh")]),je(e(S,(function(r){var t=r.da,u=r.V;return R(u,A)?e(S,dc,t):f([e(se,f([le(f([c("elmsh-hl",R(u,_(0))),c("elmsh-add",R(u,_(1))),c("elmsh-del",R(u,_(2)))]))]),e(S,dc,t))])}),n)))},fh=s((function(n,r){if(n.$===1)return e(go,f([j("elmsh")]),f([ih(r)]));var t=n.a;return e(go,f([j("elmsh")]),St(e(Yu,$,e(Vt,ch(t),r))))})),bh=s((function(n,r){return e(fh,n,r)})),sh=tn("tr"),Ds=s((function(n,r){return r.$?n:r.a})),Ss=function(n){return n.$||n.a!=="true"?A:_(!0)},lh=function(n){n:for(;!n.$;)switch(n.a){case"block":return _(0);case"inline":return _(1);case"card":return _(2);default:break n}return A},Ts=s((function(n,r){return e(Lb,n,{cT:r.cT,a7:lh(r.a7),db:Ss(r.db),de:Ss(r.de)})})),Ws=s((function(n,r){return C((function(t){return R(t,n)?J(r):pn("Expected "+n+" but was "+t)}))})),dh=s((function(n,r){return{$:4,a:n,b:r}})),qs=s((function(n,r){var t=En(r,n.de,n.a7);return t.a===""||t.b||t.c===1?en(""):e(ke,f([j("elm-book elm-book__chapter-component__title elm-book-sans")]),f([en(r)]))})),mh=s((function(n,r){var t=r.a,u=r.b;return e(io,f([j("elm-book__chapter-component")]),f([e(qs,n,t),e(I,$,f([u]))]))})),ph=s((function(n,r){var t=r.a,u=r.b;return e(io,f([j("elm-book__chapter-component")]),f([e(qs,n,t),e(I,f([j("elm-book__chapter-component__background elm-book-shadows-light"),e(Qr,"background",n.cT)]),f([e(I,f([j("elm-book__chapter-component__content")]),f([u]))]))]))})),vh=s((function(n,r){var t=r.a,u=r.b;switch(n.a7){case 1:return u;case 0:return e(mh,n,c(t,u));default:return e(ph,n,c(t,u))}})),Zs=C((function(n,r,t){var u=t.a;return e(Vu,(function(o){return o.$===4?e(dh,u!==""?n+" / "+u+" / ":n+" / ",o.b):o}),e(vh,r,c(u,t.b)))})),kh=s((function(n,r){for(;;){if(!r.b)return A;var t=r.a,u=r.b;if(n(t))return _(t);r=u}})),ne=s((function(n,r){var t=r;return C((function(u,o,a){return $n(r0((i=e(kh,(function(b){return R(b.L,n)}),o)).$?A:_(i.a.d$)))(d(t,u,o,a));var i}))})),hh=fn((function(n,r,t,u){var o=(function(a){return{a2:function(i){return e(I,f([j("elm-book-md elm-book-serif")]),f([e(Cv,$,i)]))},a4:function(i){var b=i.cU,l=i.dm,p=(function(){switch(e(W,"elm",l)){case"elm":return ek(b);case"js":return Lk(b);case"json":return Fk(b);case"css":return U1(b);default:return Xk(b)}})();return e(Ds,e(I,f([j("elm-book-md")]),f([e(go,f([j("elm-book-md__code-default elm-book-monospace elm-book-shadows-light")]),f([en(b)]))])),e($n,(function(g){return e(I,f([j("elm-book-md")]),f([e(I,f([j("elm-book-md__code elm-book-monospace elm-book-shadows-light")]),f([g]))]))}),e($n,bh(A),p)))},a5:function(i){return e(se,f([j("elm-book-md")]),f([e(Yu,f([j("elm-book-monospace")]),f([en(i)]))]))},a8:tk($),bd:e(I,f([j("elm-book-md")]),f([e(jv,$,$)])),bf:function(i){var b=i.cd,l=i.dR,p=i.bT,g=(function(){switch(b){case 0:return ds(f([j("elm-book-serif")]));case 1:return uk(f([j("elm-book-serif")]));case 2:return ok(f([j("elm-book-serif")]));case 3:return ak(f([j("elm-book-sans")]));case 4:return ck(f([j("elm-book-sans")]));default:return ik(f([j("elm-book-sans")]))}})();if(a)return e(I,f([j("elm-book-md")]),f([g(p)]));var k=sa(l);return e(I,f([j("elm-book-md")]),f([e(Ct,f([jt("#"+k),ic(k),j("elm-book-md__heading-anchor")]),f([g(p)]))]))},bg:Us($),bh:function(i){return e(I,f([j("elm-book-md")]),f([e(fk,f([tb(i.bx),Av(i.a1),Ls(e(W,"",i.cD))]),$)]))},bm:s((function(i,b){return e(Ct,f([jt(i.c4),Ls(e(W,"",i.cD))]),b)})),br:s((function(i,b){return e(I,f([j("elm-book-md elm-book-serif elm-book-md__default")]),f([e(Gk,f([(l=i,e(cr,"start",bn(l)))]),e(S,ou($),b))]));var l})),bs:function(i){return e(I,f([j("elm-book-md elm-book-serif elm-book-md__default")]),f([e(ke,$,i)]))},bA:se($),bB:rh($),bE:function(i){return e(I,f([j("elm-book-md elm-book-md__default elm-book-sans")]),f([e(eh,$,i)]))},bF:th($),bG:s((function(i,b){return e(uh,$,b)})),bH:ah($),bI:function(i){return oh(e(W,$,e(rn,St,e(rn,_v,e(rn,(function(b){switch(b){case 0:return"left";case 2:return"center";default:return"right"}}),i)))))},a_:sh($),j:en,bJ:e(I,f([j("elm-book-md")]),f([e(cc,$,$)])),bM:function(i){return e(I,f([j("elm-book-md elm-book-serif elm-book-md__default")]),f([e(co,$,e(S,(function(b){var l=b.a,p=b.b,g=(function(){switch(l){case 0:return en("");case 1:return e(_r,f([ns(!0),_a(!1),Zr("checkbox")]),$);default:return e(_r,f([ns(!0),_a(!0),Zr("checkbox")]),$)}})();return e(ou,$,e(m,g,p))}),i))]))}}})(n);return U(o,{bg:Us(f([e(ne,"with-full-width",e(ne,"with-display",e(ne,"with-background",e(ne,"with-hidden-label",e(ne,"with-label",e(Ws,"component",Ae((function(a,i,b,l,p){var g=(function(){if(a.$)return gt(t);var h=a.a;return e(rn,(function(x){return c(h,x)}),e(ve,h,Re(t)))})(),k=e(Ts,u,{cT:b,a7:l,db:p,de:i});return e(W,e(I,f([j("elm-book__component-wrapper")]),f([e(I,f([j("elm-book-sans elm-book__component-error")]),f([en('Oops!… "'+e(W,"",a)+'" component not found.')]))])),e(rn,(function(h){return k.a7===1?h:e(I,f([le(f([c("elm-book__component-wrapper",!0),c("full",k.db)]))]),f([h]))}),e(rn,e(Zs,r,k),g)))})))))))),e(ne,"with-full-width",e(ne,"with-display",e(ne,"with-background",e(ne,"with-hidden-label",e(ne,"with-label",e(Ws,"component-list",Ae((function(a,i,b,l,p){var g=e(Ts,u,{cT:b,a7:l,db:p,de:i}),k=a.$?t:e(Hr,e(Kn,ba,ze(a.a)),t);return e(I,f([le(f([c("elm-book__component-wrapper",!0),c("full",g.db)]))]),f([e(co,f([j("elm-book-md__component-list")]),e(S,(function(h){return e(ou,f([j("elm-book elm-book-md__component-list__item")]),f([d(Zs,r,g,h)]))}),k))]))}))))))))]))})})),mc=function(n){return"Problem at row "+bn(n.dW)+`
`+(function(r){switch(r.$){case 0:return"Expecting "+r.a;case 1:return"Expecting int";case 2:return"Expecting hex";case 3:return"Expecting octal";case 4:return"Expecting binary";case 5:return"Expecting float";case 6:return"Expecting number";case 7:return"Expecting variable";case 8:return"Expecting symbol "+r.a;case 9:return"Expecting keyword "+r.a;case 10:return"Expecting keyword end";case 11:return"Unexpected char";case 12:return r.a;default:return"Bad repeat"}})(n.dQ)},ur={$:10},$o=function(n){return{$:11,a:n}},pc=function(n){return{$:4,a:n}},Is=function(n){return{$:7,a:n}},xo=function(n){return{$:5,a:n}},Es=function(n){return{$:3,a:n}},vc=s((function(n,r){return{$:6,a:n,b:r}})),gh={$:0},X=function(n){return{$:0,a:n}},$h={$:8},xh=s((function(n,r){return{$:4,a:n,b:r}})),kc=s((function(n,r){return{$:0,a:n,b:r}})),pu=function(n){return{$:2,a:n}},rt=function(n){return{$:0,a:n}},wo=function(n){return{$:1,a:n}},hc=s((function(n,r){return{$:3,a:n,b:r}})),gc=C((function(n,r,t){return{$:0,a:n,b:r,c:t}})),wh=C((function(n,r,t){return{$:2,a:n,b:r,c:t}})),$c=function(n){return{$:6,a:n}},Ps=function(n){return{$:2,a:n}},yh=C((function(n,r,t){return{$:1,a:n,b:r,c:t}})),xc=s((function(n,r){return{$:0,a:n,b:r}})),vu=function(n){return{$:1,a:n}},_h=C((function(n,r,t){return{$:2,a:n,b:r,c:t}})),$r=Ae((function(n,r,t,u,o,a){return{$:4,a:n,b:r,c:t,d:u,e:o,f:a}})),wc=function(n){return{$:5,a:n}},Lr=function(n){return{$:1,a:n}},ku=function(n){return{$:12,a:n}},yc=function(n){return{$:2,a:n}},Os=function(n){return{$:4,a:n}},Ah=s((function(n,r){return{$:6,a:n,b:r}})),_c=function(n){return{$:8,a:n}},Ms=s((function(n,r){return{$:0,a:n,b:r}})),Bs=s((function(n,r){return{$:0,a:n,b:r}})),Ch={$:8},Ac={$:7},jh=s((function(n,r){return{$:1,a:n,b:r}})),kr=fn((function(n,r,t,u){return{$:3,a:n,b:r,c:t,d:u}})),zh=s((function(n,r){return{a:e(m,r,n.a),b:n.b}})),re=function(n){switch(n){case" ":case"	":return!0;default:return!1}},Uh=e(nn,"\r",X("a carriage return")),Cc=e(nn,`
`,X("a newline")),yo=Y(f([Fn(Cc),e(w,Fn(Uh),Y(f([Fn(Cc),y(0)])))])),et=e(V,(function(){return ur}),e(w,zn(Un(re)),yo)),hu=e(nn," ",X("a space")),Lh=f([ln(e(nn,">",X(">"))),e(w,zn(ln(hu)),Y(f([ln(e(nn,">",X(" >"))),ln(e(nn," >",X("  >"))),ln(e(nn,"  >",X("   >")))])))]),_o=function(n){switch(n){case`
`:case"\r":return!0;default:return!1}},Kr=Un(e(or,Rr,_o)),E=s((function(n,r){return d(Wb,rf,n,r)})),jc=Kt(X("the end of the input")),Gn=Y(f([yo,jc])),zc=e(E,e(w,e(w,y($o),Y(Lh)),Y(f([ln(hu),y(0)]))),e(w,Dn(Kr),Gn)),Ns=s((function(n,r){return je(e(S,n,r))})),Hn=function(n){return e(Jn,`
`,e(S,mc,n))},Tt=Vd,Kh=function(n){n:for(;;)switch(n.$){case 1:return!e(Tt,n.a,`
`);case 12:if((t=n.a).b){n=t.a;continue n}return!1;case 4:var r=n.e;if(r.b){var t;if((t=r.a).b){n=t.a;continue n}return!1}return!1;case 0:return!0;default:return!1}},Dh=function(n){return{$:3,a:n}},Sh=C((function(n,r,t){return{$:0,a:n,b:r,c:t}})),Th=X("at least 1 tag name character"),Vs=function(n){switch(n){case" ":case"\r":case`
`:case"	":case"/":case"<":case">":case'"':case"'":case"=":return!1;default:return!0}},Uc=e(jr,s((function(n){return Ke(n)})),e(w,e(Ir,Vs,Th),Un(Vs))),Wh=Uc,nr=function(n){return Fn(e(nn,n,lr(n)))},qh=Re(f([c("amp","&"),c("lt","<"),c("gt",">"),c("apos","'"),c("quot",'"')])),gu=function(n){return 0>n||n>1114111?"�":n>65535?String.fromCharCode(Math.floor((n-=65536)/1024)+55296,n%1024+56320):String.fromCharCode(n)},Ys=s((function(n,r){return r.$?pn(n):J(r.a)})),Fs=function(n){var r=function(t){return!R(t,n)&&t!==";"};return e(E,e(w,y(_n),nr("&")),e(w,e(jn,(function(t){var u,o=e(ze,"#x",u=t)?e(Qu,xn,e($n,gu,Of(e(vr,2,u)))):e(ze,"#",u)?e(Ys,xn("Invalid escaped character: "+u),e(rn,gu,Fe(e(vr,1,u)))):e(Ys,xn('No entity named "&'+u+';" found.'),e(ve,u,qh));return o.$?kn(o.a):y(o.a)}),Dn(e(w,e(Ir,r,X("an entity character")),Un(r)))),nr(";")))},Zh=C((function(n,r,t){return e(jn,(function(u){return Y(f([e(V,(function(o){return hn(K(t,K(u,He(o))))}),Fs(n)),y(sr(K(t,u)))]))}),Dn(Un(r)))})),Hs=function(n){return e(he,"",e(Zh,n,(function(r){return!R(r,n)&&r!=="&"})))},Ih=Y(f([e(E,e(w,y(_n),nr('"')),e(w,Hs('"'),nr('"'))),e(E,e(w,y(_n),nr("'")),e(w,Hs("'"),nr("'")))])),Eh=s((function(n,r){return _(r.$?n:r.a)})),Rs=function(n){if(n.$===-1&&n.d.$===-1&&n.e.$===-1){if(n.e.d.$!==-1||n.e.d.a){var r=n.d,t=n.e;return i=t.b,b=t.c,u=t.d,g=t.e,M(vn,1,n.b,n.c,M(vn,0,r.b,r.c,r.d,r.e),M(vn,0,i,b,u,g))}var u,o=n.d,a=n.e,i=a.b,b=a.c,l=(u=a.d).d,p=u.e,g=a.e;return M(vn,0,u.b,u.c,M(vn,1,n.b,n.c,M(vn,0,o.b,o.c,o.d,o.e),l),M(vn,1,i,b,p,g))}return n},Js=function(n){if(n.$===-1&&n.d.$===-1&&n.e.$===-1){if(n.d.d.$!==-1||n.d.d.a){var r=n.d,t=r.d,u=n.e;return g=u.b,k=u.c,h=u.d,x=u.e,M(vn,1,o=n.b,a=n.c,M(vn,0,r.b,r.c,t,l=r.e),M(vn,0,g,k,h,x))}var o=n.b,a=n.c,i=n.d,b=i.d,l=i.e,p=n.e,g=p.b,k=p.c,h=p.d,x=p.e;return M(vn,0,i.b,i.c,M(vn,1,b.b,b.c,b.d,b.e),M(vn,1,o,a,l,M(vn,0,g,k,h,x)))}return n},Ph=gi((function(n,r,t,u,o,a,i){if(a.$!==-1||a.a){n:for(;;){if(i.$===-1&&i.a===1){if(i.d.$===-1){if(i.d.a===1)return Js(r);break n}return Js(r)}break n}return r}return M(vn,t,a.b,a.c,a.d,M(vn,0,u,o,a.e,i))})),Ao=function(n){if(n.$===-1&&n.d.$===-1){var r=n.a,t=n.b,u=n.c,o=n.d,a=o.d,i=n.e;if(o.a===1){if(a.$!==-1||a.a){var b=Rs(n);if(b.$===-1){var l=b.e;return M(yt,b.a,b.b,b.c,Ao(b.d),l)}return pe}return M(vn,r,t,u,Ao(o),i)}return M(vn,r,t,u,Ao(o),i)}return pe},$u=s((function(n,r){if(r.$===-2)return pe;var t=r.a,u=r.b,o=r.c,a=r.d,i=r.e;if(0>gn(n,u)){if(a.$===-1&&a.a===1){var b=a.d;if(b.$!==-1||b.a){var l=Rs(r);if(l.$===-1){var p=l.e;return M(yt,l.a,l.b,l.c,e($u,n,l.d),p)}return pe}return M(vn,t,u,o,e($u,n,a),i)}return M(vn,t,u,o,e($u,n,a),i)}return e(Oh,n,ot(Ph,n,r,t,u,o,a,i))})),Oh=s((function(n,r){if(r.$===-1){var t=r.a,u=r.b,o=r.c,a=r.d,i=r.e;if(R(n,u)){var b=(function(l){for(;;){if(l.$!==-1||l.d.$!==-1)return l;l=l.d}})(i);return b.$===-1?M(yt,t,b.b,b.c,a,Ao(i)):pe}return M(yt,t,u,o,a,e($u,n,i))}return pe})),Mh=s((function(n,r){var t=e($u,n,r);return t.$!==-1||t.a?t:M(vn,1,t.b,t.c,t.d,t.e)})),Bh=C((function(n,r,t){var u=r(e(ve,n,t));return u.$?e(Mh,n,t):d(_t,n,u.a,t)})),Lc=function(n){switch(n){case" ":case"\r":case`
`:case"	":return!0;default:return!1}},tt=Un(Lc),Nh=e(V,e(ao,C((function(n,r,t){return e(m,{L:n,d$:r},t)})),$),e(he,wt,(function(n){return Y(f([e(E,e(E,y(s((function(r,t){return hn(d(Bh,Ke(r),Eh(t),n))}))),e(w,e(w,e(w,Wh,tt),nr("=")),tt)),e(w,Ih,tt)),y(sr(n))]))}))),Co=function(n){return function(r){var t=M(Mi,n,r.d,r.dW,r.bU,r.bx),u=t.a,o=t.b,a=t.c,i=0>u?Ln(r.bx):u;return d(On,0>gn(r.d,i),0,{bU:a,f:r.f,h:r.h,d:i,dW:o,bx:r.bx})}},Vh=e(E,e(w,y(_n),nr("<![CDATA[")),e(w,Dn(Co("]]>")),nr("]]>"))),Yh=s((function(n,r){return e(V,(function(t){return t(r)}),Y(n))})),Qs=function(n){var r=e(jn,(function(t){return R(n,t)?y(0):kn(xn("tag name mismatch: "+n+" and "+t))}),Uc);return e(w,e(w,e(w,e(w,nr("</"),tt),r),tt),nr(">"))},Xs=function(n){return e(nn,n,X(n))},Fh=e(E,e(w,y((function(n){return{$:2,a:n}})),Fn(Xs("<!--"))),e(w,Dn(Co("-->")),Fn(Xs("-->")))),Hh=s((function(n,r){return{$:5,a:n,b:r}})),Rh=X("at least 1 uppercase character"),Jh=Dn(e(w,e(Ir,Ve,Rh),Un(Ve))),Qh=e(w,e(Ir,Lc,X("at least one whitespace")),Un(Lc)),Xh=e(E,e(E,e(w,y(Hh),nr("<!")),e(w,Jh,Qh)),e(w,Dn(Co(">")),nr(">"))),Gh=e(E,e(w,y((function(n){return{$:4,a:n}})),nr("<?")),e(w,Dn(Co("?>")),nr("?>"))),Gs=function(n){switch(n){case"<":case"&":return!1;default:return!0}},ng=f([e(V,(function(){return hn(0)}),e(w,e(Ir,Gs,X("is not & or <")),Un(Gs))),e(V,(function(){return hn(0)}),Fs("<")),y(sr(0))]),rg=Dn(e(he,0,(function(){return Y(ng)}))),eg=function(n){return e(he,$,Yh(tg(n)))},tg=function(n){return f([e(V,s((function(r,t){return sr(qn(t))})),Qs(n)),e(jn,(function(r){return br(r)?e(V,s((function(t,u){return sr(qn(u))})),Qs(n)):y((function(t){return hn(e(m,{$:1,a:r},t))}))}),rg),e(V,s((function(r,t){return hn(e(m,r,t))})),Kc())])},ug=function(n){return e(E,e(E,e(w,y(Sh(n)),tt),e(w,Nh,tt)),Y(f([e(V,(function(){return $}),nr("/>")),e(E,e(w,y(_n),nr(">")),eg(n))])))};function Kc(){return Y(f([e(V,Dh,Vh),Gh,Fh,Xh,Dc()]))}function Dc(){return e(E,e(w,y(_n),nr("<")),e(jn,ug,Uc))}var Sc=Kc();Kc=function(){return Sc};var og=Dc();Dc=function(){return og};var nl,rl,Tc,el=e(nn,"	",X("a tab")),ag=Y(f([ln(el),e(w,zn(ln(hu)),Y(f([ln(e(nn,"   ",lr("Indentation"))),ln(e(nn," 	",lr("Indentation"))),ln(e(nn,"  	",lr("Indentation")))])))])),cg=e(E,e(w,y($c),ag),e(w,Dn(Kr),Gn)),xe=function(n){return!e(Jr,2,n)},tl=function(n){return n?1:0},Te=C((function(n,r,t){var u=c(r,t);return u.a===""?t:u.b===""?r:K(r,K(n,t))})),xu=s((function(n,r){return n+`
`+r})),ig=e(jr,s((function(n){return vu(n)})),Kr),fg=e(w,ig,Gn),ul=fn((function(n,r,t,u){return{cU:u,dj:r,ds:t,dN:n}})),we=function(n){return d(On,!1,n.bU,n)},bg=e(E,y((function(n){return c(n,"")})),e(w,we,Gn)),wu=function(n){return e(w,e(Ir,n,xn("Expected one or more character")),Un(n))},ol=e(E,e(E,e(w,y(s((function(n,r){return c(n,r)}))),wu(re)),we),e(w,Dn(Kr),Gn)),sg=e(nn,")",X("a `)`")),lg=e(nn,".",X("a `.`")),dg=Y(f([e(w,y(0),ln(lg)),e(w,y(1),ln(sg))])),mg=e(jr,s((function(n){return e(W,0,Fe(n))})),wu(oa)),al=e(jn,(function(n){return n>999999999?kn(xn("Starting numbers must be nine digits or less.")):y(n)}),mg),ee=Fn(hu),pg=C((function(n,r,t){for(;;){if(0>=r)return n;n=e(m,t,n),r-=1}})),Wc=s((function(n,r){return d(pg,$,n,r)})),jo=s((function(n,r){var t=e(Wc,n,r);if(t.b){var u=t.a,o=t.b;return d(Bn,s((function(a,i){return Y(f([e(w,a,i),y(0)]))})),Y(f([u,y(0)])),o)}return y(0)})),vg=function(n){return n===1?y(n):kn(xn("Lists inside a paragraph or after a paragraph without a blank line must start with 1"))},qc=function(n){return e(V,(function(r){return Mn($r,!0,r.dj,r.ds,r.dN,$,r.cU)}),(function(r){var t=Wn((function(u,o,a,i,b){var l=b.a,p=b.b;return l-i>4?H(ul,o,i-u+1,a,K(e(me,l-i-1," "),p)):H(ul,o,l-u,a,p)}));return e(E,e(E,e(E,e(E,e(E,y(t),we),zn((function(u){return u?e(jn,vg,e(E,e(w,y(_n),e(jo,3,ee)),al)):e(E,e(w,y(_n),e(jo,3,ee)),al)})(r))),zn(dg)),we),r?ol:Y(f([bg,ol])))})(n))},kg={$:1},hg=C((function(n,r,t){return{$:4,a:n,b:r,c:t}})),cl=C((function(n,r,t){return{$:3,a:n,b:r,c:t}})),il=function(n){return{$:0,a:n}},gg=function(n){var r=n,t=r.l;switch(t.$){case 0:return il(r.j);case 1:return kg;case 2:return{$:2,a:r.j};case 3:var u=t.a;return d(cl,u.b,A,f([il(u.a)]));case 4:var o=t.a;return d(cl,o.a,o.b,yu(r.q));case 5:var a=t.a;return d(hg,a.a,a.b,yu(r.q));case 6:return(function(i){return{$:5,a:i}})(t.a);case 7:return e(vc,t.a,yu(r.q));default:return(function(i){return{$:7,a:i}})(yu(r.q))}},yu=function(n){return e(S,gg,n)},fl=s((function(n,r){return{g:r.g-n.s,q:r.q,i:r.i-n.s,j:r.j,v:r.v-n.s,s:r.s-n.s,l:r.l}})),$g=s((function(n,r){return{g:n.g,q:e(m,e(fl,n,r),n.q),i:n.i,j:n.j,v:n.v,s:n.s,l:n.l}})),Zc=Td,bl=function(n){var r=n;return{g:r.g,q:sl(r.q),i:r.i,j:r.j,v:r.v,s:r.s,l:r.l}},sl=function(n){var r=e(Zc,(function(t){return t.i}),n);return r.b?d(xg,r.b,r.a,$):$},xg=C((function(n,r,t){for(;;){var u=r;if(!n.b)return e(m,bl(u),t);var o=n.a,a=n.b;gn(u.g,o.i)<1?(n=a,r=o,t=e(m,bl(u),t)):gn(u.i,o.i)<0&&0<gn(u.g,o.g)?(n=a,r=e($g,u,o)):(n=a,r=u)}})),wg={$:0},ll=fn((function(n,r,t,u){return{c:r,am:n,cf:t,bC:u}})),yg=Hm,Rn=function(n){return e(yg,{cV:!1,dx:!1},n)},rr=/.^/,_g=e(W,rr,Rn("&#([0-9]{1,8});")),_u=Jm(Ni),dl=function(n){return(function(r){return r===9||r===10||r===13||r===133||r>=32&&126>=r||r>=160&&55295>=r||r>=57344&&64975>=r||r>=65008&&65533>=r||r>=65536&&1114109>=r})(n)&&!(function(r){var t=e(Jr,16,r),u=e(Jr,131070,r);return!(131070>r||(0>u||u>15)&&(65536>u||u>65551)||t!==14&&t!==15)})(n)?He(gu(n)):He(gu(65533))},Ag=e(_u,_g,(function(n){var r=n.bC;if(r.b&&!r.a.$){var t=Fe(r.a.a);return t.$?n.am:dl(t.a)}return n.am})),Cg=e(W,rr,Rn("&([0-9a-zA-Z]+);")),jg=Re(f([c("quot",34),c("amp",38),c("apos",39),c("lt",60),c("gt",62),c("nbsp",160),c("iexcl",161),c("cent",162),c("pound",163),c("curren",164),c("yen",165),c("brvbar",166),c("sect",167),c("uml",168),c("copy",169),c("ordf",170),c("laquo",171),c("not",172),c("shy",173),c("reg",174),c("macr",175),c("deg",176),c("plusmn",177),c("sup2",178),c("sup3",179),c("acute",180),c("micro",181),c("para",182),c("middot",183),c("cedil",184),c("sup1",185),c("ordm",186),c("raquo",187),c("frac14",188),c("frac12",189),c("frac34",190),c("iquest",191),c("Agrave",192),c("Aacute",193),c("Acirc",194),c("Atilde",195),c("Auml",196),c("Aring",197),c("AElig",198),c("Ccedil",199),c("Egrave",200),c("Eacute",201),c("Ecirc",202),c("Euml",203),c("Igrave",204),c("Iacute",205),c("Icirc",206),c("Iuml",207),c("ETH",208),c("Ntilde",209),c("Ograve",210),c("Oacute",211),c("Ocirc",212),c("Otilde",213),c("Ouml",214),c("times",215),c("Oslash",216),c("Ugrave",217),c("Uacute",218),c("Ucirc",219),c("Uuml",220),c("Yacute",221),c("THORN",222),c("szlig",223),c("agrave",224),c("aacute",225),c("acirc",226),c("atilde",227),c("auml",228),c("aring",229),c("aelig",230),c("ccedil",231),c("egrave",232),c("eacute",233),c("ecirc",234),c("euml",235),c("igrave",236),c("iacute",237),c("icirc",238),c("iuml",239),c("eth",240),c("ntilde",241),c("ograve",242),c("oacute",243),c("ocirc",244),c("otilde",245),c("ouml",246),c("divide",247),c("oslash",248),c("ugrave",249),c("uacute",250),c("ucirc",251),c("uuml",252),c("yacute",253),c("thorn",254),c("yuml",255),c("OElig",338),c("oelig",339),c("Scaron",352),c("scaron",353),c("Yuml",376),c("fnof",402),c("circ",710),c("tilde",732),c("Alpha",913),c("Beta",914),c("Gamma",915),c("Delta",916),c("Epsilon",917),c("Zeta",918),c("Eta",919),c("Theta",920),c("Iota",921),c("Kappa",922),c("Lambda",923),c("Mu",924),c("Nu",925),c("Xi",926),c("Omicron",927),c("Pi",928),c("Rho",929),c("Sigma",931),c("Tau",932),c("Upsilon",933),c("Phi",934),c("Chi",935),c("Psi",936),c("Omega",937),c("alpha",945),c("beta",946),c("gamma",947),c("delta",948),c("epsilon",949),c("zeta",950),c("eta",951),c("theta",952),c("iota",953),c("kappa",954),c("lambda",955),c("mu",956),c("nu",957),c("xi",958),c("omicron",959),c("pi",960),c("rho",961),c("sigmaf",962),c("sigma",963),c("tau",964),c("upsilon",965),c("phi",966),c("chi",967),c("psi",968),c("omega",969),c("thetasym",977),c("upsih",978),c("piv",982),c("ensp",8194),c("emsp",8195),c("thinsp",8201),c("zwnj",8204),c("zwj",8205),c("lrm",8206),c("rlm",8207),c("ndash",8211),c("mdash",8212),c("lsquo",8216),c("rsquo",8217),c("sbquo",8218),c("ldquo",8220),c("rdquo",8221),c("bdquo",8222),c("dagger",8224),c("Dagger",8225),c("bull",8226),c("hellip",8230),c("permil",8240),c("prime",8242),c("Prime",8243),c("lsaquo",8249),c("rsaquo",8250),c("oline",8254),c("frasl",8260),c("euro",8364),c("image",8465),c("weierp",8472),c("real",8476),c("trade",8482),c("alefsym",8501),c("larr",8592),c("uarr",8593),c("rarr",8594),c("darr",8595),c("harr",8596),c("crarr",8629),c("lArr",8656),c("uArr",8657),c("rArr",8658),c("dArr",8659),c("hArr",8660),c("forall",8704),c("part",8706),c("exist",8707),c("empty",8709),c("nabla",8711),c("isin",8712),c("notin",8713),c("ni",8715),c("prod",8719),c("sum",8721),c("minus",8722),c("lowast",8727),c("radic",8730),c("prop",8733),c("infin",8734),c("ang",8736),c("and",8743),c("or",8744),c("cap",8745),c("cup",8746),c("int",8747),c("there4",8756),c("sim",8764),c("cong",8773),c("asymp",8776),c("ne",8800),c("equiv",8801),c("le",8804),c("ge",8805),c("sub",8834),c("sup",8835),c("nsub",8836),c("sube",8838),c("supe",8839),c("oplus",8853),c("otimes",8855),c("perp",8869),c("sdot",8901),c("lceil",8968),c("rceil",8969),c("lfloor",8970),c("rfloor",8971),c("lang",9001),c("rang",9002),c("loz",9674),c("spades",9824),c("clubs",9827),c("hearts",9829),c("diams",9830)])),zg=e(_u,Cg,(function(n){var r=n.bC;if(r.b&&!r.a.$){var t=e(ve,r.a.a,jg);return t.$?n.am:He(gu(t.a))}return n.am})),Ug=e(W,rr,Rn("(\\\\+)([!\"#$%&\\'()*+,./:;<=>?@[\\\\\\]^_`{|}~-])")),Lg=e(_u,Ug,(function(n){var r=n.bC;if(r.b&&!r.a.$&&r.b.b&&!r.b.a.$){var t=r.b.a.a;return K(e(me,Ln(r.a.a)/2|0,"\\"),t)}return n.am})),Kg=e(W,rr,Rn("&#[Xx]([0-9a-fA-F]{1,8});")),Ic=Zd,Dg=e(_u,Kg,(function(n){var r,t=n.bC;return t.b&&!t.a.$?dl((r=t.a.a,d(Ic,s((function(u,o){return 16*o+e(Jr,39,Iu(u))-9})),0,Ke(r)))):n.am})),Ec=function(n){var r=Lg(n);return e(eu,"&",r)?Dg(Ag(zg(r))):r},zo=function(n){return{g:0,q:$,i:0,j:Ec(n),v:0,s:0,l:wg}},Sg=C((function(n,r,t){var u=r,o={g:u.g,q:d(ml,u.j,$,u.q),i:u.i,j:u.j,v:u.v,s:u.s,l:u.l};if(t.b){var a=t.a;return a.l.$?R(u.g,a.i)?e(m,o,t):0>gn(u.g,a.i)?e(m,o,e(m,zo(d(de,u.g,a.i,n)),t)):t:e(m,o,t)}var i=e(vr,u.g,n);return br(i)?f([o]):f([o,zo(i)])})),ml=C((function(n,r,t){for(;;){if(!t.b){if(r.b){var u=r.a;return u.i>0?e(m,zo(e(Ue,u.i,n)),r):r}return br(n)?$:f([zo(n)])}var o=t.b,a=n,i=d(Sg,n,t.a,r);n=a,r=i,t=o}})),Uo=C((function(n,r,t){n:for(;;){if(!r.b)return $;var u=r.a,o=r.b;if(n.b){var a=n.a,i=n.b;if(0>gn(a.c,u.c)){if(t){n=i,t+=1;continue n}return e(m,a,d(Uo,i,r,t+1))}if(t>1){r=o,t-=1;continue n}if(t===1)return e(m,u,d(Uo,n,o,t-1));r=o,t=0}else if(1<t)r=o,t-=1;else{if(t===1)return e(m,u,d(Uo,n,o,t-1));r=o,t=0}}})),Tg=e(W,rr,Rn("(\\\\*)(\\<)")),ye=Bi(Ni),Wg={$:4},qg=function(n){var r=n.bC;if(r.b&&r.b.b&&!r.b.a.$){var t=e(W,0,e(rn,Ln,r.a));return xe(t)?_({c:n.c+t,bl:1,e:Wg}):A}return A},Zg=e(W,rr,Rn("(\\\\*)(\\>)")),pl=function(n){return{$:5,a:n}},Ig=function(n){var r=n.bC;if(r.b&&r.b.b&&!r.b.a.$){var t=e(W,0,e(rn,Ln,r.a));return _({c:n.c+t,bl:1,e:xe(t)?pl(1):pl(0)})}return A},Eg=e(W,rr,Rn("(\\\\*)([^*])?(\\*+)([^*])?")),Pg=s((function(n,r){return{$:7,a:n,b:r}})),Og=e(Ic,s((function(n,r){return r||(function(t){switch(t){case"!":case'"':case"#":case"%":case"&":case"'":case"(":case")":case"*":case",":case"-":case".":case"/":case":":case";":case"?":case"@":case"[":case"]":case"_":case"{":case"}":case"~":return!0;default:return!1}})(n)})),!1),Mg=e(Ic,s((function(n,r){return r||(function(t){switch(t){case" ":case"\f":case`
`:case"\r":case"	":case"\v":case" ":case"\u2028":case"\u2029":return!0;default:return!1}})(n)})),!1),vl=function(n){if(n.$)return 0;var r=n.a;return br(r)||Mg(r)?0:Og(r)?1:2},kl=C((function(n,r,t){var u=t.bC;if(u.b&&u.b.b&&u.b.b.b&&!u.b.b.a.$&&u.b.b.b.b){var o=u.a,a=u.b,i=a.a,b=a.b,l=b.a.a,p=vl(b.b.a),g=i.$?0:Ln(i.a),k=t.c&&!g?_(d(de,t.c-1,t.c,r)):i,h=o.$?0:Ln(o.a),x=!xe(h)&&!g||!k.$&&k.a==="\\",L=x?Ln(l)-1:Ln(l),Z=x?1:vl(k);return 0>=L||n==="_"&&Z===2&&p===2?A:_({c:t.c+h+g+(x?1:0),bl:L,e:e(Pg,n,{aS:Z,aV:p})})}return A})),Bg=e(W,rr,Rn("(\\\\*)(\\`+)")),hl=function(n){return{$:0,a:n}},Ng=function(n){var r=n.bC;if(r.b&&r.b.b&&!r.b.a.$){var t=r.b.a.a,u=e(W,0,e(rn,Ln,r.a));return _({c:n.c+u,bl:Ln(t),e:xe(u)?hl(1):hl(0)})}return A},Vg=e(W,rr,Rn("(?:(\\\\+)|( {2,}))\\n")),gl={$:8},Yg=function(n){var r=n.bC;n:for(;;){if(r.b){if(r.a.$){if(r.b.b&&!r.b.a.$)return _({c:n.c,bl:Ln(n.am),e:gl});break n}var t=Ln(r.a.a);return xe(t)?A:_({c:n.c+t-1,bl:2,e:gl})}break n}return A},Fg=(Rn("(?:(\\\\+)|( *))\\n"),e(W,rr,Rn("(\\\\*)(\\])"))),Hg={$:3},Rg=function(n){var r=n.bC;if(r.b&&r.b.b&&!r.b.a.$){var t=e(W,0,e(rn,Ln,r.a));return xe(t)?_({c:n.c+t,bl:1,e:Hg}):A}return A},Jg=e(W,rr,Rn("(\\\\*)(\\!)?(\\[)")),Qg={$:2},Pc=function(n){return{$:1,a:n}},Xg=function(n){var r=n.bC;if(r.b&&r.b.b&&r.b.b.b&&!r.b.b.a.$){var t=r.b.a,u=e(W,0,e(rn,Ln,r.a)),o=!xe(u),a=o?n.c+u+1:n.c+u;return o?t.$?A:_({c:a,bl:1,e:Pc(0)}):_(t.$?{c:a,bl:1,e:Pc(0)}:{c:a,bl:2,e:Qg})}return A},$l=function(n){return{$:9,a:n}},Gg=function(n){var r=n.bC;if(r.b&&r.b.b&&!r.b.a.$){var t=r.b.a.a,u=e(W,0,e(rn,Ln,r.a)),o=xe(u)?c(Ln(t),$l(1)):c(Ln(t),$l(0));return _({c:n.c+u,bl:o.a,e:o.b})}return A},n$=e(W,rr,Rn("(\\\\*)(~{2,})([^~])?")),r$=e(W,rr,Rn("(\\\\*)([^_])?(\\_+)([^_])?")),_e=s((function(n,r){if(n.b){var t=n.a,u=n.b;if(r.b){var o=r.a,a=r.b;return 0>gn(t.c,o.c)?e(m,t,e(_e,u,r)):e(m,o,e(_e,n,a))}return n}return r})),xl={$:2},Oc=function(n){return{$:5,a:n}},Mc=function(n){return{$:4,a:n}},e$={$:8},wl=function(n){return{$:3,a:n}},yl=Rm,t$=e(W,rr,Rn("%(?:3B|2C|2F|3F|3A|40|26|3D|2B|24|23|25)")),_l=function(n){return encodeURIComponent(n)},Bc=e(Kn,_l,e(_u,t$,(function(n){return e(W,n.am,(function(r){try{return _(decodeURIComponent(r))}catch{return A}})(n.am))}))),u$=e(W,rr,Rn("^([A-Za-z][A-Za-z0-9.+\\-]{1,31}:[^<>\\x00-\\x20]*)$")),Al=Bi,o$=e(W,rr,Rn("^\\[\\s*([^\\[\\]\\\\]*(?:\\\\.[^\\[\\]\\\\]*)*)\\s*\\]")),Nc=function(n){return n},Cl=e(Kn,Nc,Ke),Vc=s((function(n,r){return c(Bc(Ec(n)),e(rn,Ec,r))})),a$=C((function(n,r,t){var u,o=br(u=e(W,n.j,e(W,A,e(uu,e(Kn,(function(k){return k.bC}),gt),t))))?n.j:u,a=e(ve,Cl(o),r);if(a.$===1)return A;var i=a.a,b=i.a,l=i.b,p=n.l.$===5?Oc(e(Vc,b,l)):Mc(e(Vc,b,l)),g=t.$?0:Ln(t.a.am);return _(U(n,{g:n.g+g,l:p}))})),jl=C((function(n,r,t){return d(a$,r,t,gt(d(Al,1,o$,n)))})),Yc=" \\t\\f\\v\\r\\n",c$=e(W,rr,Rn("^\\(\\s*(?:<([^<>\\f\\v\\r\\n]*)>|([^"+Yc+"\\(\\)\\\\]*(?:\\\\.[^"+Yc+"\\(\\)\\\\]*)*))(?:["+Yc+`]+(?:'([^'\\\\]*(?:\\\\.[^'\\\\]*)*)'|"([^"\\\\]*(?:\\\\.[^"\\\\]*)*)"|\\(([^\\)\\\\]*(?:\\\\.[^\\)\\\\]*)*)\\)))?\\s*\\)`)),zl=function(n){return d(Bn,s((function(r,t){return t.$?r:_(t.a)})),A,n)},i$=s((function(n,r){var t,u=r.bC;if(u.b&&u.b.b&&u.b.b.b&&u.b.b.b.b&&u.b.b.b.b.b){var o=u.a,a=u.b,i=a.a,b=a.b,l=b.b,p=zl(f([b.a,l.a,l.b.a])),g=zl(f([o,i]));return _((t=e(W,"",g),U(n,{g:n.g+Ln(r.am),l:(n.l.$===5?Oc:Mc)(e(Vc,t,p))})))}return A})),Ul=C((function(n,r,t){var u=r,o=d(Al,1,c$,n);if(o.b){var a=e(i$,u,o.a);return a.$?d(jl,n,u,t):_(a.a)}return d(jl,n,u,t)})),Ll=s((function(n,r){var t=n,u=Hr((function(o){var a=o;return gn(t.g,a.i)>0&&0>gn(t.g,a.g)}));return Se(r)||Se(u(r))?_(e(m,t,r)):A})),f$=e(W,rr,Rn("^([a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~\\-]+@[a-zA-Z0-9](?:[a-zA-Z0-9\\-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9\\-]{0,61}[a-zA-Z0-9])?)*)$")),b$=function(n){var r=n;return e(yl,f$,r.j)?J(U(r,{l:wl(c(r.j,"mailto:"+Bc(r.j)))})):pn(r)},s$=C((function(n,r,t){for(;;){if(!t.b)return A;var u=t.a,o=t.b;if(r(u))return _(En(u,qn(n),o));n=e(m,u,n),t=o}})),Wt=s((function(n,r){return d(s$,$,n,r)})),l$=s((function(n,r){return{$:6,a:n,b:r}})),Lo=function(n){return d(On,!1,n.d,n)},d$=s((function(n,r){var t=r,u=e(E,e(E,e(E,y(C((function(a,i,b){return{b5:i,bl:b-a}}))),Lo),Sc),Lo),o=e(Tn,u,e(vr,t.i,n));return o.$?A:_({c:t.i,bl:o.a.bl,e:e(l$,0,o.a.b5)})})),m$=s((function(n,r){return r.$?n(r.a):r})),p$=s((function(n,r){var t=r.e;return!t.$&&(t.a?R(r.bl,n.bl):R(r.bl-1,n.bl))})),v$=function(n){switch(n.e.$){case 1:case 2:return!0;default:return!1}},Kl=s((function(n,r){var t=r.e;if(t.$===7){var u=t.b,o=n.e;if(o.$===7){var a=o.b;return!(!R(t.a,o.a)||(R(u.aS,u.aV)||R(a.aS,a.aV))&&!e(Jr,3,n.bl+r.bl)&&(e(Jr,3,n.bl)||e(Jr,3,r.bl)))}return!1}return!1})),k$=s((function(n,r){var t=(function(){var i=r.e;return i.$===9?i.a?c(!0,r.bl):c(!0,r.bl-1):c(!1,0)})(),u=t.a,o=t.b,a=(function(){var i=n.e;return i.$===9?i.a?c(!0,n.bl):c(!0,n.bl-1):c(!1,0)})();return a.a&&u&&R(a.b,o)})),h$={$:1},Dl=s((function(n,r){return{g:n.c+n.bl,q:$,i:n.c,j:"",v:0,s:0,l:r}})),g$=s((function(n,r){for(;;){if(!n.b)return r;var t=n.a,u=n.b;t.e.$!==8?n=u:(n=u,r=e(m,e(Dl,t,h$),r))}})),Sl=s((function(n,r){var t=n;return e(Hr,(function(u){return gn(u.c,t.g)>-1}),r)})),$$=Ae((function(n,r,t,u,o,a){var i=a.c,b=e(m$,b$,(function(p){var g=p;return e(yl,u$,g.j)?J(U(g,{l:wl(c(g.j,Bc(g.j)))})):pn(g)})(ot(Au,u,o,(function(p){return p}),xl,a.a,n,$)));if(b.$===1){if(r===1){var l=e(d$,o,b.a);return l.$?A:_(c(e(m,l.a,i),t))}return A}return _(c(i,e(m,b.a,t)))})),x$=Wn((function(n,r,t,u,o){n:for(;;){if(!n.b)return M(_$,qn(r),$,t,u,o);var a=n.a,i=n.b,b=a.e;switch(b.$){case 0:var l=e(Wt,p$(a),r);if(l.$){n=i,r=e(m,a,r);continue n}var p=M(w$,a,t,u,o,l.a);n=i,r=Z=p.a,t=B=p.b;continue n;case 5:var g=b.a,k=function(G){return G.e.$===4},h=e(Wt,k,r);if(h.$){n=i,r=e(Hr,e(or,Rr,k),r);continue n}var x=Mn($$,a,g,t,u,o,h.a);if(x.$){n=i,r=e(Hr,e(or,Rr,k),r);continue n}var L=x.a,Z=L.a,B=L.b;n=i,r=e(Hr,e(or,Rr,k),Z),t=B;continue n;default:n=i,r=e(m,a,r);continue n}}})),w$=Wn((function(n,r,t,u,o){var a=o.a,i=o.c,b=(function(){var l=a.e;return l.$||l.a?a:U(a,{c:a.c+1,bl:a.bl-1})})();return c(i,e(m,ot(Au,t,u,Nc,xl,b,n,$),r))})),y$=Wn((function(n,r,t,u,o){n:for(;;){if(!n.b)return M(j$,qn(r),$,t,u,o);var a=n.a,i=n.b,b=a.e;if(b.$!==7)n=i,r=e(m,a,r);else{var l=b.a,p=b.b.aV,g=b.b.aS;if(R(g,p)){if(!p||l==="_"&&p!==1){n=i;continue n}var k=e(Wt,Kl(a),r);if(k.$){n=i,r=e(m,a,r);continue n}var h=M(Tl,u,o,a,i,k.a);n=h.a,r=h.c,t=e(m,h.b,t);continue n}if(0>gn(g,p)){n=i,r=e(m,a,r);continue n}var x=e(Wt,Kl(a),r);if(x.$){n=i;continue n}var L=M(Tl,u,o,a,i,x.a);n=L.a,r=L.c,t=e(m,L.b,t)}}})),Tl=Wn((function(n,r,t,u,o){var a=o.a,i=o.b,b=o.c,l=a.bl-t.bl,p=l?l>0?{aE:t,an:U(a,{c:a.c+l,bl:t.bl}),aU:e(m,U(a,{bl:l}),b),a0:u}:{aE:U(t,{bl:a.bl}),an:a,aU:b,a0:e(m,U(t,{c:t.c+a.bl,bl:-l}),u)}:{aE:t,an:a,aU:b,a0:u},g=ot(Au,n,r,(function(k){return k}),{$:7,a:p.an.bl},p.an,p.aE,qn(i));return En(p.a0,g,p.aU)})),_$=Wn((function(n,r,t,u,o){for(;;){if(!n.b)return M(A$,qn(r),$,t,u,o);var a=n.a,i=n.b,b=a.e;b.$!==6?(n=i,r=e(m,a,r)):(n=i,t=e(m,e(Dl,a,{$:6,a:b.b}),t))}})),A$=Wn((function(n,r,t,u,o){n:for(;;){if(!n.b)return M(y$,qn(r),$,t,u,o);var a=n.a,i=n.b;if(a.e.$!==3)n=i,r=e(m,a,r);else{var b=e(Wt,v$,r);if(b.$){n=i;continue n}var l=Mn(C$,a,i,t,u,o,b.a);if(l.$){n=i;continue n}var p=l.a;n=p.a,r=p.c,t=p.b}}})),C$=Ae((function(n,r,t,u,o,a){var i=a.a,b=a.b,l=a.c,p=En(r,t,K(b,l)),g=e(vr,n.c+1,o),k=function(cn){return ot(Au,u,o,(function(dn){return dn}),cn?Mc(c("",A)):Oc(c("",A)),i,n,qn(b))},h=i.e;switch(h.$){case 2:var x=k(!1),L=d(Ul,g,x,u);if(L.$===1)return _(p);var Z=e(Ll,z=L.a,t);if(Z.$)return _(p);var B=Z.a;return _(En(e(Sl,z,r),B,l));case 1:if(h.a)return _(p);x=k(!0);var G=d(Ul,g,x,u);if(G.$===1)return _(p);var z,N=e(Ll,z=G.a,t);return N.$?_(p):(B=N.a,_(En(e(Sl,z,r),B,e(S,(function(cn){return cn.e.$===1?U(cn,{e:Pc(1)}):cn}),l))));default:return A}})),j$=Wn((function(n,r,t,u,o){n:for(;;){if(!n.b)return e(g$,qn(r),t);var a=n.a,i=n.b;if(a.e.$!==9)n=i,r=e(m,a,r);else{var b=e(Wt,k$(a),r);if(b.$){n=i,r=e(m,a,r);continue n}var l=M(z$,a,t,u,o,b.a);n=i,r=l.a,t=l.b}}})),z$=Wn((function(n,r,t,u,o){var a=o.a,i=o.c,b=(function(){var l=a.e;return l.$!==9||l.a?a:U(a,{c:a.c+1,bl:a.bl-1})})();return c(i,e(m,ot(Au,t,u,Nc,e$,b,n,$),r))})),Au=gi((function(n,r,t,u,o,a,i){var b=o.c+o.bl,l=a.c,p=t(d(de,b,l,r)),g=o.c,k=a.c+a.bl,h={g:k,q:$,i:g,j:p,v:l,s:b,l:u};return{g:k,q:e(S,(function(x){return e(fl,h,x)}),H(Wl,i,$,n,r)),i:g,j:p,v:l,s:b,l:u}})),Wl=fn((function(n,r,t,u){return M(x$,n,$,r,t,u)})),U$=s((function(n,r){var t=Yr(r),u=(function(o){return e(_e,d(Uo,e(Zc,(function(a){return a.c}),e(ir,qg,e(ye,Tg,o))),e(Zc,(function(a){return a.c}),(function(a){return e(ir,Ig,e(ye,Zg,a))})(o)),0),e(_e,(function(a){return e(ir,Yg,e(ye,Vg,a))})(o),e(_e,(function(a){return e(ir,Rg,e(ye,Fg,a))})(o),e(_e,(function(a){return e(ir,Xg,e(ye,Jg,a))})(o),e(_e,(function(a){return e(ir,Gg,e(ye,n$,a))})(o),e(_e,(function(a){return e(ir,e(kl,"_",a),e(ye,r$,a))})(o),e(_e,(function(a){return e(ir,e(kl,"*",a),e(ye,Eg,a))})(o),(function(a){return e(ir,Ng,e(ye,Bg,a))})(o))))))))})(t);return yu(d(ml,t,$,sl(H(Wl,u,$,n,t))))})),L$=Y(f([Fn(e(nn," ",X(" "))),Fn(e(nn,">",X(">"))),e(w,e(w,e(Ir,(function(n){return ua(n)||Ve(n)}),X("Alpha")),Un((function(n){return aa(n)||n==="-"}))),Y(f([Fn(e(nn,":",X(":"))),Fn(e(nn,"@",X("@"))),Fn(e(nn,"\\",X("\\"))),Fn(e(nn,"+",X("+"))),Fn(e(nn,".",X(".")))])))])),Fc=zn(e(jr,s((function(n){return vu(n)})),e(w,e(w,e(w,Fn(e(nn,"<",X("<"))),L$),Kr),Gn))),xr=function(n){return Fn(e(nn,n,X(n)))},K$=e(V,e(Bn,s((function(n,r){return e(m,Yr(n),r)})),$),e(he,c(A,$),(function(n){var r=n.a,t=n.b,u=e(W,sr(t),e(rn,(function(i){return sr(e(m,i,t))}),r)),o=e(W,hn(c(A,t)),e(rn,(function(i){return hn(c(A,e(m,i,t)))}),r)),a=function(i){return hn(c(_((function(b){return K(e(W,"",r),b)})(i)),t))};return Y(f([e(V,(function(){return u}),xr(`|
`)),e(V,(function(){return u}),xr(`
`)),e(V,(function(){return u}),Kt(X("end"))),e(w,zn(y(a("|"))),xr("\\\\|")),e(w,zn(y(a("\\"))),xr("\\\\")),e(w,zn(y(a("|"))),xr("\\|")),e(w,zn(y(o)),xr("|")),e(jr,s((function(i){return a(i)})),e(Ir,An(!0),xn("No character found")))]))}))),ql=e(E,e(w,y(_n),Y(f([xr("|"),y(0)]))),K$),D$=s((function(n,r){var t=n.b,u=e(Tn,ql,r);return u.$?pn("Unable to parse previous line as a table header"):(function(o){return R(yr(o),yr(t))?J((function(a){return d(Qi,s((function(i,b){return{aA:b,aR:i}})),a,t)})(o)):pn("Tables must have the same number of header columns ("+bn(yr(o))+") as delimiter columns ("+bn(yr(t))+")")})(u.a)})),S$=s((function(n,r){return{cU:r,dm:n}})),T$={aC:"`",aQ:0,a$:e(nn,"`",X("a '`'"))},Hc=s((function(n,r){var t=d(Bn,s((function(u,o){return e(w,o,u)})),y(0),e(Wc,n,Fn(r.a$)));return e(jr,s((function(u){return c(r,Ln(u))})),e(w,t,Un(Pu(r.aC))))})),W$={aC:"~",aQ:1,a$:e(nn,"~",X("a `~`"))},Ko=Y(f([e(w,e(w,ee,Y(f([ee,y(0)]))),Y(f([ee,y(0)]))),y(0)])),q$=e(E,e(E,e(w,y(s((function(n,r){return{aD:r.a,bi:n,bl:r.b}}))),Ko),e(jn,(function(n){switch(n){case 1:return y(0);case 2:return y(1);case 3:return y(2);case 4:return y(3);default:return kn(X("Fenced code blocks should be indented no more than 3 spaces"))}}),we)),Y(f([e(Hc,3,T$),e(Hc,3,W$)]))),Z$=Pu(" "),I$=s((function(n,r){return e(w,e(w,e(w,e(w,y(0),Ko),e(Hc,n,r)),Un(Z$)),Gn)})),E$=function(n){return d(On,!1,n.bx,n)},P$=function(n){var r,t=n.a,u=n.b;return Y(f([e(w,y(sr(u)),Kt(Pb)),e(jr,s((function(o){return hn(c(t,K(u,o)))})),yo),zn(e(w,y(sr(u)),e(I$,t.bl,t.aD))),e(E,e(E,e(E,y(C((function(o,a,i){return hn(c(t,K(u,d(de,o,a,i))))}))),(r=t.bi,e(E,e(w,y(_n),e(jo,r,ee)),e(w,e(w,Lo,Kr),Gn)))),Lo),E$)]))},Rc=e(jn,(function(n){return e(E,e(E,y(S$),e(w,(r=n.aD,e(jr,s((function(t){var u=Yr(t);return u===""?A:_(u)})),Un(r.aQ?e(or,Rr,_o):function(t){return t!=="`"&&!_o(t)}))),Gn)),(function(t){return e(he,c(t,""),P$)})(n));var r}),q$),O$=s((function(n,r){return 1>n?r:d(de,0,-n,r)})),M$=e(nn,"#",X("a `#`")),B$=Un((function(n){return n===" "||n===`
`||n==="\r"})),Jc=e(E,e(E,e(w,e(w,y(kc),e(jn,(function(n){var r=Ln(n);return 4>r?y(r):kn(X("heading with < 4 spaces in front"))}),Dn(B$))),ln(M$)),e(jn,(function(n){var r=Ln(n)+1;return 7>r?y(r):kn(X("heading with < 7 #'s"))}),Dn(Un((function(n){return n==="#"}))))),Y(f([e(w,y(""),ln(Cc)),e(E,e(w,y(_n),Y(f([ln(hu),ln(el)]))),e(jr,s((function(n){return(function(r){var t=(function(u){for(;;){if(!e(Tt,"#",u))return u;u=e(O$,1,u)}})(r);return e(Tt," ",t)||br(t)?(function(u){return u.replace(/\s+$/,"")})(t):r})(Yr(n))})),Kr))]))),N$=Mi,Do=function(n){var r=n.a,t=n.b;return function(u){var o=M(N$,r,u.d,u.dW,u.bU,u.bx),a=o.a,i=o.b,b=o.c;return R(a,-1)?e(Pn,!1,H(ws,i,b,t,u.f)):d(On,0>gn(u.d,a),0,{bU:b,f:u.f,h:u.h,d:a,dW:i,bx:u.bx})}},Zl=e(nn,">",X("a `>`")),V$=C((function(n,r,t){return{bU:r,f:t,dW:n}})),Il=s((function(n,r){return{bU:r.bU,f:n,h:r.h,d:r.d,dW:r.dW,bx:r.bx}})),Qc=s((function(n,r){var t=r;return function(u){var o=t(e(Il,e(m,d(V$,u.dW,u.bU,n),u.f),u));return o.$?o:d(On,o.a,o.b,e(Il,u.f,o.c))}})),So=function(n){switch(n){case" ":case`
`:case"	":case"\v":case"\f":case"\r":return!0;default:return!1}},Y$=e(nn,"<",X("a `<`")),F$=e(Qc,"link destination",Y(f([e(E,e(w,y(_l),ln(Y$)),e(w,Dn(Do(Zl)),ln(Zl))),Dn(wu(e(or,Rr,So)))]))),H$=e(nn,"]",X("a `]`")),R$=e(nn,"[",X("a `[`")),J$=e(E,e(w,y(Cl),ln(R$)),e(w,Dn(Do(H$)),ln(e(nn,"]:",X("]:"))))),Xc=e(nn,'"',X("a double quote")),El=function(n){return e(eu,`

`,n)?kn(X("no blank line")):y(n)},Gc=e(w,Un((function(n){return!_o(n)&&So(n)})),Gn),Q$=e(w,e(Ir,So,X("Required whitespace")),Un(So)),ni=e(nn,"'",X("a single quote")),X$=(nl=e(E,e(w,y(_),ln(ni)),e(w,e(w,e(jn,El,Dn(Do(ni))),ln(ni)),Gc)),rl=e(E,e(w,y(_),ln(Xc)),e(w,e(w,e(jn,El,Dn(Do(Xc))),ln(Xc)),Gc)),e(Qc,"title",Y(f([zn(e(E,e(w,y(_n),Q$),Y(f([rl,nl,y(A)])))),e(w,y(A),Gc)])))),G$=e(Qc,"link reference definition",e(E,e(E,e(E,e(w,y(C((function(n,r,t){return c(n,{c4:r,cD:t})}))),Ko),e(w,e(w,e(w,J$,Un(re)),Y(f([yo,y(0)]))),Un(re))),F$),X$)),Pl=Un(re),ri=function(n){var r=xr(He(n));return e(w,e(w,e(w,e(w,e(w,e(w,e(w,y(0),r),Pl),r),Pl),r),Un((function(t){return R(t,n)||re(t)}))),Gn)},Ol=Y(f([ri("-"),ri("*"),ri("_")])),ei=Y(f([e(E,e(w,e(w,e(w,y(_n),ee),Y(f([ee,y(0)]))),Y(f([ee,y(0)]))),Ol),Ol])),nx=s((function(n,r){return{$:13,a:n,b:r}})),rx=e(nn,"=",X("a `=`")),ex=e(nn,"-",X("a `-`")),tx=(Tc=C((function(n,r,t){return e(w,e(w,y(n),Fn(r)),Un(Pu(t)))})),e(jr,s((function(n,r){return e(nx,r,n)})),e(E,e(w,y(_n),Ko),e(w,e(w,Y(f([d(Tc,0,rx,"="),d(Tc,1,ex,"-")])),Un(re)),Gn)))),Ml=Un(re),Bl=function(n){return Y(f([e(Ir,n,xn("Character not found")),y(0)]))},ux=function(n){var r=c(e(ze,":",n),e(Tt,":",n));return r.a?_(r.b?2:0):r.b?_(1):A},ox=e(V,(function(n){return{$:9,a:n}}),e(jn,(function(n){var r=n.a.cH,t=n.b;return Se(t)?kn(X("Must have at least one column in delimiter row.")):yr(t)!==1||e(ze,"|",r)&&e(Tt,"|",r)?y(n):kn(xn("Tables with a single column must have pipes at the start and end of the delimiter row to avoid ambiguity."))}),e(jr,s((function(n,r){return e(Bs,{cq:n,cH:Yr(n)},e(S,ux,qn(r)))})),e(he,$,(function(n){return Y(f([zn(e(V,(function(){return sr(n)}),xr(`|
`))),e(V,(function(){return sr(n)}),xr(`
`)),e(V,(function(){return sr(n)}),Kt(X("end"))),zn(e(w,e(w,y(sr(n)),xr("|")),Kt(X("end")))),e(E,e(w,e(w,y((function(t){return hn(e(m,t,n))})),(r=n,Se(r)?Y(f([xr("|"),y(0)])):xr("|"))),Ml),e(w,Dn(e(w,e(w,e(w,y(0),Bl((function(t){return t===":"}))),wu((function(t){return t==="-"}))),Bl((function(t){return t===":"})))),Ml))]));var r}))))),ax=s((function(n,r){return!e(xf,e(or,Rr,n),r)})),cx=C((function(n,r,t){n:for(;;){if(n>0){if(r.b){var u=r.a;n-=1,r=r.b,t=e(m,u,t);continue n}return t}return t}})),ix=s((function(n,r){return qn(d(cx,n,r,$))})),Nl=C((function(n,r,t){if(r>0){var u=c(r,t);n:for(;;){r:for(;;){if(!u.b.b)return t;if(!u.b.b.b){if(u.a===1)break n;break r}switch(u.a){case 1:break n;case 2:var o=u.b;return f([o.a,o.b.a]);case 3:if(u.b.b.b.b){var a=u.b,i=a.b;return f([a.a,i.a,i.b.a])}break r;default:if(u.b.b.b.b&&u.b.b.b.b.b){var b=u.b,l=b.b,p=l.b,g=p.b,k=g.a,h=g.b;return e(m,b.a,e(m,l.a,e(m,p.a,e(m,k,n>1e3?e(ix,r-4,h):d(Nl,n+1,r-4,h)))))}break r}}return t}return f([u.b.a])}return $})),fx=s((function(n,r){return d(Nl,0,n,r)})),bx=s((function(n,r){var t=yr(r);switch(e(za,n,t)){case 0:return e(fx,n,r);case 1:return r;default:return K(r,e(Wc,n-t,""))}})),sx=function(n){var r,t=n.a,u=n.b;return e(V,(function(o){return _c(e(Ms,t,K(u,f([o]))))}),(r=yr(t),e(jn,(function(o){return Se(o)||e(ax,br,o)?kn(xn("A line must have at least one column")):y(e(bx,r,o))}),ql)))},Vl={$:2},Yl=function(n){return{$:1,a:n}},Fl=s((function(n,r){return{$:0,a:n,b:r}})),lx=fn((function(n,r,t,u){var o=u.a,a=u.b,i=o-t;return i>4?En(r,t-n+1,(function(){switch(a.$){case 0:var b=a.b;return e(Fl,a.a,K(e(me,i-1," "),b));case 1:return b=a.a,Yl(K(e(me,i-1," "),b));default:return Vl}})()):En(r,o-n,a)})),dx=e(E,y((function(n){return c(n,Vl)})),e(w,we,Gn)),mx=Y(f([e(w,y(1),ln(e(nn,"[x] ",lr("[x] ")))),e(w,y(1),ln(e(nn,"[X] ",lr("[X] ")))),e(w,y(0),ln(e(nn,"[ ] ",lr("[ ] "))))])),px=e(E,Y(f([e(E,y(Fl),e(w,mx,Un(re))),y(Yl)])),e(w,Dn(Kr),Gn)),Hl=e(E,e(E,e(w,y(s((function(n,r){return c(n,r)}))),wu(re)),we),px),vx=Y(f([e(w,e(w,y(0),e(jo,3,ee)),ln(e(nn,"-",lr("-")))),e(w,y(1),ln(e(nn,"+",lr("+")))),e(w,y(2),ln(e(nn,"*",lr("*"))))])),ti=function(n){var r=s((function(t,u){switch(u.$){case 0:return{cU:u.b,ds:t,m:_(u.a===1)};case 1:return{cU:u.a,ds:t,m:A};default:return{cU:"",ds:t,m:A}}}));return e(V,(function(t){return H(kr,!0,t.b,$,e(r,t.a,t.c))}),(function(t){return e(E,e(E,e(E,e(E,y(lx),we),zn(vx)),we),t?Hl:Y(f([dx,Hl])))})(n))},kx=s((function(n,r){switch(n.$){case 0:var t=n.a,u=n.b,o=Jl(n.c);if(o.$)return pn(o.a);var a=rt(d(gc,t,u,o.a));return J(e(m,a,r));case 1:var i=ui(n.a);return i.$?pn(X(e(Jn,`
`,e(S,mc,i.a)))):J(K(qn(i.a),r));case 2:return J(e(m,rt(wo(n.a)),r));case 3:return J(e(m,rt(pc(n.a)),r));case 4:return J(e(m,rt(yc(n.a)),r));default:return J(e(m,rt(e(hc,n.a,n.b)),r))}})),hx=function(n){var r=n.b;n:for(;r.b;)switch(r.a.$){case 11:var t=r.a.a,u=r.b,o=e(Tn,In(),t);return o.$?kn(xn(Hn(o.a))):y({a:K(n.a,(N=o.a).a),b:e(m,ku(N.b),u)});case 3:var a=r.a,i=a.a,b=a.b,l=a.c,p=a.d,g=(u=r.b,e(Tn,In(),p.cU));if(g.$)return kn(xn(Hn(g.a)));var k=!e(Ar,ur,(N=g.a).b)&&i;return y({a:K(n.a,N.a),b:e(m,H(kr,k,b,e(m,{cU:N.b,m:p.m},l),p),u)});case 4:var h=r.a,x=(i=h.a,b=h.b,h.c),L=h.d,Z=(l=h.e,p=h.f,u=r.b,e(Tn,In(),p));return Z.$?kn(xn(Hn(Z.a))):(k=!e(Ar,ur,(N=Z.a).b)&&i,y({a:K(n.a,N.a),b:e(m,Mn($r,k,b,x,L,e(m,N.b,l),p),u)}));case 10:if(!r.b.b)break n;switch(r.b.a.$){case 3:var B=r.b,G=B.a,z=(i=G.a,b=G.b,l=G.c,p=G.d,u=B.b,e(Tn,In(),p.cU));return z.$?kn(xn(Hn(z.a))):(k=!e(Ar,ur,(N=z.a).b)&&i,y({a:K(n.a,N.a),b:e(m,H(kr,k,b,e(m,{cU:N.b,m:p.m},l),p),u)}));case 4:var N,cn=r.b,dn=cn.a,yn=(i=dn.a,b=dn.b,x=dn.c,L=dn.d,l=dn.e,p=dn.f,u=cn.b,e(Tn,In(),p));return yn.$?kn(xn(Hn(yn.a))):(k=!e(Ar,ur,(N=yn.a).b)&&i,y({a:K(n.a,N.a),b:e(m,Mn($r,k,b,x,L,e(m,N.b,l),p),u)}));default:break n}default:break n}return y(n)},te=s((function(n,r){var t=c(r,n.b);n:for(;t.b.b;)switch(t.b.a.$){case 5:if(t.a.$===5){var u=t.b,o=u.b;return y({a:n.a,b:e(m,xo({cU:e(xu,u.a.a.cU,t.a.a.cU),dm:A}),o)})}break n;case 6:switch(t.a.$){case 6:var a=t.b;return o=a.b,y({a:n.a,b:e(m,$c(e(xu,a.a.a,t.a.a)),o)});case 10:var i=t.b;return o=i.b,y({a:n.a,b:e(m,$c(e(xu,i.a.a,`
`)),o)});default:break n}case 11:var b=t.b,l=b.a.a;switch(o=b.b,r.$){case 11:return y({a:n.a,b:e(m,$o(e(xu,l,p=r.a)),o)});case 1:var p=r.a,g=e(Tn,In(),l);if(g.$)return kn(xn(Hn(g.a)));var k=(mn=g.a).b;if(k.b){if(Kh(k.a)&&!e(Tt,`
`,l))return y({a:n.a,b:e(m,$o(e(xu,l,p)),o)});var h=e(Tn,In(),l);if(h.$)return kn(xn(Hn(h.a)));var x=h.a;return y({a:K(n.a,mn.a),b:e(m,r,e(m,ku(x.b),o))})}var L=e(Tn,In(),l);return L.$?kn(xn(Hn(L.a))):(x=L.a,y({a:K(n.a,mn.a),b:e(m,r,e(m,ku(x.b),o))}));case 6:p=r.a;var Z=e(Tn,In(),l);if(Z.$)return kn(xn(Hn(Z.a)));var B=(mn=Z.a).b;if(B.b&&B.a.$===1)return y({a:n.a,b:e(m,$o(d(Te," ",l,p)),o)});var G=e(Tn,In(),l);return G.$?kn(xn(Hn(G.a))):(x=G.a,y({a:K(n.a,mn.a),b:e(m,r,e(m,ku(x.b),o))}));default:var z=e(Tn,In(),l);return z.$?kn(xn(Hn(z.a))):y({a:K(n.a,(mn=z.a).a),b:e(m,r,e(m,ku(mn.b),o))})}case 3:var N=t.b,cn=N.a,dn=cn.a,yn=cn.b,Sn=cn.c,P=cn.d;switch(o=N.b,r.$){case 3:var hr=r.b;if(R(P.ds,(Uu=r.d).ds)){var Pe=e(Tn,In(),P.cU);return Pe.$?kn(xn(Hn(Pe.a))):y(e(Ar,ur,(mn=Pe.a).b)?{a:K(n.a,mn.a),b:e(m,H(kr,!1,hr,e(m,{cU:mn.b,m:P.m},Sn),Uu),o)}:{a:K(n.a,mn.a),b:e(m,H(kr,dn,hr,e(m,{cU:mn.b,m:P.m},Sn),Uu),o)})}var Oe=e(Tn,In(),P.cU);if(Oe.$)return kn(xn(Hn(Oe.a)));var gr=!e(Ar,ur,(mn=Oe.a).b)&&dn;return y({a:K(n.a,mn.a),b:e(m,r,e(m,H(kr,gr,yn,e(m,{cU:mn.b,m:P.m},Sn),Uu),o))});case 1:return y({a:n.a,b:e(m,H(kr,dn,yn,Sn,U(P,{cU:d(Te,`
`,P.cU,p=r.a)})),o)});default:var li=e(Tn,In(),P.cU);return li.$?kn(xn(Hn(li.a))):(gr=!e(Ar,ur,(mn=li.a).b)&&dn,y({a:K(n.a,mn.a),b:e(m,r,e(m,H(kr,gr,yn,e(m,{cU:mn.b,m:P.m},Sn),P),o))}))}case 4:var ld=t.b,It=ld.a,Me=(dn=It.a,yn=It.b,It.c),ut=It.d;switch(Sn=It.e,P=It.f,o=ld.b,r.$){case 4:hr=r.b;var Uu=r.f;if(R(Me,r.c)){var di=e(Tn,In(),P);return di.$?kn(xn(Hn(di.a))):(gr=!e(Ar,ur,(mn=di.a).b)&&dn,y({a:K(n.a,mn.a),b:e(m,Mn($r,gr,hr,Me,ut,e(m,mn.b,Sn),Uu),o)}))}var mi=e(Tn,In(),P);return mi.$?kn(xn(Hn(mi.a))):(gr=!e(Ar,ur,(mn=mi.a).b)&&dn,y({a:K(n.a,mn.a),b:e(m,r,e(m,Mn($r,gr,yn,Me,ut,e(m,mn.b,Sn),P),o))}));case 1:return y({a:n.a,b:e(m,Mn($r,dn,yn,Me,ut,Sn,P+`
`+(p=r.a)),o)});default:var pi=e(Tn,In(),P);return pi.$?kn(xn(Hn(pi.a))):(gr=!e(Ar,ur,(mn=pi.a).b)&&dn,y({a:K(n.a,mn.a),b:e(m,r,e(m,Mn($r,gr,yn,Me,ut,e(m,mn.b,Sn),P),o))}))}case 1:switch(t.a.$){case 1:var dd=t.b;return o=dd.b,y({a:n.a,b:e(m,vu(d(Te,`
`,l=dd.a.a,p=t.a.a)),o)});case 13:if(t.a.a){var md=t.b;return o=md.b,y({a:n.a,b:e(m,e(kc,2,md.a.a),o)})}var pd=t.b;return o=pd.b,y({a:n.a,b:e(m,e(kc,1,pd.a.a),o)});case 9:var vd=t.a.a,kd=vd.a,hd=t.b,gd=hd.a.a,$d=(o=hd.b,e(D$,e(Bs,kd,vd.b),gd));return y($d.$?{a:n.a,b:e(m,vu(d(Te,`
`,gd,kd.cq)),o)}:{a:n.a,b:e(m,_c(e(Ms,$d.a,$)),o)});default:break n}case 8:if(t.a.$===8)return o=t.b.b,y({a:n.a,b:e(m,_c(t.a.a),o)});break n;case 10:if(!t.b.b.b)break n;switch(t.b.b.a.$){case 4:var xd=t.b.b,Et=xd.a,vi=(dn=Et.a,yn=Et.b,Me=Et.c,ut=Et.d,Sn=Et.e,P=Et.f,o=xd.b,e(Tn,In(),P));if(vi.$)return kn(xn(Hn(vi.a)));var mn=vi.a;if(r.$===4){hr=r.b;var ki=r.f;return y({a:K(n.a,mn.a),b:e(m,Mn($r,!1,hr,Me,ut,e(m,mn.b,Sn),ki),o)})}return y({a:K(n.a,mn.a),b:e(m,r,e(m,ur,e(m,Mn($r,dn,yn,Me,ut,e(m,mn.b,Sn),P),o)))});case 3:var wd=t.b.b,Io=wd.a,hi=(dn=Io.a,yn=Io.b,Sn=Io.c,P=Io.d,o=wd.b,e(Tn,In(),P.cU));return hi.$?kn(xn(Hn(hi.a))):(mn=hi.a,r.$===3?(ki=r.d,y({a:K(n.a,mn.a),b:e(m,H(kr,!1,yn,e(m,{cU:mn.b,m:P.m},Sn),ki),o)})):y({a:K(n.a,mn.a),b:e(m,r,e(m,ur,e(m,H(kr,dn,yn,e(m,{cU:mn.b,m:P.m},Sn),P),o)))}));default:break n}default:break n}return y({a:n.a,b:e(m,r,n.b)})})),Cu=s((function(n,r){var t=r,u=Re(e(S,zb((function(o){return c(o.c4,o.cD)})),n));return e(S,We,e(U$,u,t))})),We=function(n){switch(n.$){case 0:return{$:7,a:n.a};case 1:return $h;case 2:return(function(u){return{$:6,a:u}})(n.a);case 3:return d(yh,n.a,n.b,e(S,We,t=n.c));case 4:return d(wh,n.a,n.b,e(S,We,t=n.c));case 5:return(function(u){return{$:0,a:u}})(Rl(n.a));case 6:var r=n.a,t=n.b;switch(r){case 1:return Es(e(S,We,t));case 2:return Os(e(S,We,t));default:return xe(r)?Os(f([We(e(vc,r-2,t))])):Es(f([We(e(vc,r-1,t))]))}default:return(function(u){return{$:5,a:u}})(e(S,We,t=n.a))}},Rl=function(n){switch(n.$){case 1:return wo("TODO this never happens, but use types to drop this case.");case 0:return d(gc,n.a,n.b,e(Ns,(function(r){return r.$===1?Ax(r.a):f([rt(Rl(r))])}),n.c));case 2:return wo(n.a);case 3:return pc(n.a);case 4:return yc(n.a);default:return e(hc,n.a,n.b)}},Jl=function(n){return e(gx,n,$)},gx=s((function(n,r){for(;;){if(!n.b)return J(qn(r));var t=n.b,u=e(kx,n.a,r);if(u.$)return pn(u.a);n=t,r=u.a}})),ui=function(n){var r=e(Tn,e(w,In(),jc),n);if(r.$===1)return pn(r.a);var t=To(r.a);return t.$===1?e(Tn,kn(t.a),""):J(e(Hr,(function(u){return!(u.$===5&&!u.a.b)}),t.a))},To=function(n){return d($x,n,n.b,$)},$x=C((function(n,r,t){n:for(;;){if(!r.b)return J(t);var u=r.b,o=e(wx,n.a,r.a);switch(o.$){case 1:r=u,t=e(m,o.a,t);continue n;case 0:r=u;continue n;default:return pn(o.a)}}})),xx=s((function(n,r){return e(S,(function(t){var u=t.aA;return d(Ql,n,(function(o){return{aA:u,aR:o}}),t.aR)}),r)})),wx=s((function(n,r){switch(r.$){case 0:var t=r.b,u=(function(k){switch(k){case 1:return J(0);case 2:return J(1);case 3:return J(2);case 4:return J(3);case 5:return J(4);case 6:return J(5);default:return pn(X("A heading with 1 to 6 #'s, but found "+bn(k)))}})(r.a);return u.$?Ps(u.a):Lr(e(xh,u.a,e(Cu,n,t)));case 1:return Lr(wc(e(Cu,n,t=r.a)));case 2:return Lr(rt(r.a));case 3:var o=r.a,a=r.c,i=s((function(k,h){var x,L=k.$?0:k.a?2:1,Z=(x=To({a:n,b:h})).$?$:x.a;return e(xc,L,Z)}));return Lr(e(jh,tl(o),qn(e(S,(function(k){return e(i,k.m,k.cU)}),a))));case 4:var b=r.d;return a=r.e,i=function(k){var h=To({a:n,b:k});return h.$?$:h.a},Lr(d(_h,tl(o=r.a),b,qn(e(S,i,a))));case 5:return Lr(Is(r.a));case 7:return Lr(Ch);case 10:case 11:return gh;case 12:var l=To({a:n,b:r.a});return l.$?Ps(l.a):Lr({$:3,a:l.a});case 6:return Lr(Is({cU:r.a,dm:A}));case 8:var p=r.a,g=p.b;return Lr(e(Ah,e(xx,n,p.a),e(yx,n,g)));case 9:return Lr(wc(e(Cu,n,r.a.a.cq)));default:return Lr(wc(e(Cu,n,r.b)))}})),Ql=C((function(n,r,t){return r(e(Cu,n,t))})),yx=s((function(n,r){return e(S,(function(t){return e(S,(function(u){return d(Ql,n,_n,u)}),t)}),r)})),_x=function(n){return Y(f([e(V,(function(){return sr(n)}),jc),e(V,(function(r){return hn(e(zh,n,r))}),zn(G$)),(function(){var r=n.b;n:for(;r.b;)switch(r.a.$){case 1:return e(V,(function(z){return hn(z)}),e(jn,te(n),oi()));case 8:var t=r.a.a;return e(V,(function(z){return hn(z)}),e(jn,te(n),Y(f([qe(),sx(t)]))));case 3:var u=r.a,o=u.a,a=u.b,i=u.c,b=u.d,l=r.b,p=s((function(z,N){return U(z,{b:e(m,ur,e(m,H(kr,o,a,i,U(b,{cU:d(Te,"",b.cU,N)})),l))})})),g=s((function(z,N){return U(z,{b:e(m,H(kr,o,a,i,U(b,{cU:d(Te,`
`,b.cU,N)})),l)})}));return Y(f([e(V,(function(z){return hn(z)}),e(V,(function(){return e(p,n,`
`)}),et)),e(V,(function(z){return hn(z)}),e(V,g(n),e(E,e(w,y(_n),ln(e(nn,e(me,a," "),lr("Indentation")))),e(w,Dn(Kr),Gn)))),e(V,(function(z){return hn(z)}),e(jn,te(n),Wo()))]));case 4:var k=r.a,h=(o=k.a,a=k.b,k.c),x=k.d;return i=k.e,b=k.f,l=r.b,p=s((function(z,N){return U(z,{b:e(m,ur,e(m,Mn($r,o,a,h,x,i,b+`
`+N),l))})})),g=s((function(z,N){return U(z,{b:e(m,Mn($r,o,a,h,x,i,b+`
`+N),l)})})),Y(f([e(V,(function(z){return hn(z)}),e(V,(function(){return e(p,n,`
`)}),et)),e(V,(function(z){return hn(z)}),e(V,g(n),e(E,e(w,y(_n),ln(e(nn,e(me,a," "),lr("Indentation")))),e(w,Dn(Kr),Gn)))),e(V,(function(z){return hn(z)}),e(jn,te(n),Wo()))]));case 10:if(!r.b.b)break n;switch(r.b.a.$){case 3:var L=r.b,Z=L.a;return o=Z.a,a=Z.b,i=Z.c,b=Z.d,l=L.b,p=s((function(z,N){return U(z,{b:e(m,ur,e(m,H(kr,o,a,i,U(b,{cU:d(Te,"",b.cU,N)})),l))})})),g=s((function(z,N){return U(z,{b:e(m,H(kr,o,a,i,U(b,{cU:d(Te,`
`,b.cU,N)})),l)})})),Yr(b.cU)===""?e(V,(function(z){return hn(z)}),e(jn,te(n),qe())):Y(f([e(V,(function(z){return hn(z)}),e(V,(function(){return e(p,n,`
`)}),et)),e(V,(function(z){return hn(z)}),e(V,g(n),e(E,e(w,y(_n),ln(e(nn,e(me,a," "),lr("Indentation")))),e(w,Dn(Kr),Gn)))),e(V,(function(z){return hn(z)}),e(jn,te(n),qe()))]));case 4:var B=r.b,G=B.a;return o=G.a,a=G.b,h=G.c,x=G.d,i=G.e,b=G.f,l=B.b,p=s((function(z,N){return U(z,{b:e(m,ur,e(m,Mn($r,o,a,h,x,i,b+`
`+N),l))})})),g=s((function(z,N){return U(z,{b:e(m,Mn($r,o,a,h,x,i,b+`
`+N),l)})})),Yr(b)===""?e(V,(function(z){return hn(z)}),e(jn,te(n),qe())):Y(f([e(V,(function(z){return hn(z)}),e(V,(function(){return e(p,n,`
`)}),et)),e(V,(function(z){return hn(z)}),e(V,g(n),e(E,e(w,y(_n),ln(e(nn,e(me,a," "),lr("Indentation")))),e(w,Dn(Kr),Gn)))),e(V,(function(z){return hn(z)}),e(jn,te(n),qe()))]));default:break n}default:break n}return e(V,(function(z){return hn(z)}),e(jn,te(n),qe()))})(),e(V,(function(r){return hn(r)}),e(jn,te(n),fg))]))},Ax=function(n){return e(Ds,$,ui(n))},Cx=function(n){switch(n.$){case 1:return y(vu(n.a));case 0:var r=n.a,t=n.b,u=Jl(n.c);return u.$?kn(u.a):y(pu(d(gc,r,t,u.a)));case 2:return y(pu(wo(n.a)));case 3:return y(pu(pc(n.a)));case 4:return y(pu(yc(n.a)));default:return y(pu(e(hc,n.a,n.b)))}};function In(){return e(jn,hx,e(he,{a:$,b:$},_x))}function qe(){return Y(f([Fc,et,zc,e(V,xo,zn(Rc)),cg,e(V,(function(){return Ac}),zn(ei)),ti(!1),qc(!1),zn(Jc),ju()]))}function oi(){return Y(f([Fc,et,zc,e(V,xo,zn(Rc)),zn(tx),e(V,(function(){return Ac}),zn(ei)),ti(!0),qc(!0),zn(Jc),ju(),zn(ox)]))}function Wo(){return Y(f([Fc,et,zc,e(V,xo,zn(Rc)),e(V,(function(){return Ac}),zn(ei)),ti(!1),qc(!1),zn(Jc),ju()]))}function ju(){return e(jn,Cx,Sc)}var jx=In();In=function(){return jx};var zx=qe();qe=function(){return zx};var Ux=oi();oi=function(){return Ux};var Lx=Wo();Wo=function(){return Lx};var Kx=ju();ju=function(){return Kx};var ai,Xl=C((function(n,r,t){if(r.$===1)return pn(r.a);var u=r.a;return t.$===1?pn(t.a):J(e(n,u,t.a))})),Or=e(be,Xl(m),J($)),Dx=s((function(n,r){n:for(;;){if(n>0){if(r.b){n-=1,r=r.b;continue n}return r}return r}})),Gl=C((function(n,r,t){n:for(;;){if(!t.b)return r;var u=t.a,o=t.b;switch(u.$){case 0:var a=u.a;if(a.$){b=n,l=e(n,u,r),n=b,r=l,t=o;continue n}var i=a.c,b=n,l=e(n,u,r);n=b,r=l,t=K(i,o);continue n;case 1:var p=e(Ns,(function(k){return k.b}),g=u.b);b=n,l=e(n,u,r),n=b,r=l,t=K(p,o);continue n;case 2:var g=u.c;b=n,l=e(n,u,r),n=b,r=l,t=K(je(g),o);continue n;case 3:g=u.a,b=n,l=e(n,u,r),n=b,r=l,t=K(g,o);continue n;default:b=n,l=e(n,u,r),n=b,r=l,t=o;continue n}}})),zu=function(n){switch(n.$){case 5:return Ze(n.a);case 0:var r=n.a;if(r.$)return"";var t=r.c;return d(Gl,s((function(o,a){return K(a,zu(o))})),"",t);case 1:return e(Jn,`
`,e(S,(function(o){return e(Jn,`
`,e(S,zu,o.b))}),n.b));case 2:return e(Jn,`
`,e(S,(function(o){return e(Jn,`
`,e(S,zu,o))}),n.c));case 3:return e(Jn,`
`,e(S,zu,t=n.a));case 4:return Ze(n.b);case 6:var u=n.b;return e(Jn,`
`,je(f([e(S,Ze,e(S,(function(o){return o.aR}),n.a)),je(e(S,S(Ze),u))])));case 7:return n.a.cU;default:return""}},Ze=function(n){return d(Bn,Sx,"",n)},Sx=s((function(n,r){switch(n.$){case 7:case 6:return K(r,n.a);case 8:return r+" ";case 1:case 2:return K(r,Ze(n.c));case 0:var t=n.a;if(t.$)return r;var u=t.c;return d(Gl,s((function(o,a){return K(a,zu(o))})),r,u);default:return K(r,Ze(n.a))}})),Tx=s((function(n,r){return c(n,r)})),Wx=Wn((function(n,r,t,u,o){var a=u;return e(Ma,(function(i){return e($n,(function(b){return b(i)}),d(a,n,r,t))}),Or(o))})),qx=C((function(n,r,t){var u=e(Zx,n,r);return u.$?t:e(m,u.a,t)})),ci=s((function(n,r){return e(ir,ii(n),r)})),ii=function(n){return function(r){switch(r.$){case 4:var t=r.a;return _(e($n,(function(h){return n.bf({bT:h,cd:t,dR:Ze(u)})}),e(ue,n,u=r.b)));case 5:var u;return _(e($n,n.bs,e(ue,n,u=r.a)));case 0:var o=r.a;return o.$?A:_(H(nd,n,o.a,o.b,o.c));case 1:var a=r.a;return _(e($n,(function(h){return n.bM(e(S,(function(x){return e(xc,x.a,je(x.b))}),h))}),Or(e(S,(function(h){var x=h.b;return e($n,xc(h.a),Or(e(ir,(function(L){var Z=c(a,L);return Z.a===1&&Z.b.$===5?_(e(ue,n,Z.b.a)):e(rn,$n(St),e(ii,n,L))}),x)))}),r.b))));case 2:a=r.a;var i=r.b;return _(e($n,(function(h){return e(n.br,i,e(S,(function(x){return je(x)}),h))}),Or(e(S,(function(h){return Or(e(ir,(function(x){var L=c(a,x);return L.a===1&&L.b.$===5?_(e(ue,n,L.b.a)):e(rn,$n(St),e(ii,n,x))}),h))}),r.c))));case 7:return _(J(n.a4(r.a)));case 8:return _(J(n.bJ));case 3:return _(e($n,n.a2,Or(e(ci,n,r.a))));default:var b=r.a,l=r.b,p=Or(e(S,(function(h){var x=h.aR;return e($n,Tx(h.aA),e(ue,n,x))}),b)),g=e($n,(function(h){return n.bH(St(n.a_(e(S,(function(x){return e(n.bI,x.a,x.b)}),h))))}),p),k=Or(e(S,(function(h){return e($n,n.a_,e($n,Vt(s((function(x,L){return e(n.bG,e(uu,(function(Z){return Z.aA}),gt(e(Dx,x,b))),L)}))),Or(e(S,ue(n),h))))}),l));return _(d(Xl,s((function(h,x){return n.bE(e(m,h,(function(L){return Se(L)?$:f([n.bF(L)])})(x)))})),g,k))}}},nd=fn((function(n,r,t,u){return M(Wx,r,t,u,n.bg,e(ci,n,u))})),Zx=s((function(n,r){switch(r.$){case 4:return _(e($n,n.bB,e(ue,n,r.a)));case 3:return _(e($n,n.a8,e(ue,n,r.a)));case 5:return _(e($n,n.bA,e(ue,n,r.a)));case 2:var t=r.a,u=r.b;return _(J(n.bh({a1:Ze(r.c),bx:t,cD:u})));case 7:return _(J(n.j(r.a)));case 6:return _(J(n.a5(r.a)));case 1:var o=r.a;return u=r.b,_(e(Ma,(function(i){return J(e(n.bm,{c4:o,cD:u},i))}),e(ue,n,r.c)));case 8:return _(J(n.bd));default:var a=r.a;return a.$?A:_(H(nd,n,a.a,a.b,a.c))}})),ue=s((function(n,r){return Or(d(be,qx(n),$,r))})),Ix=s((function(n,r){return Or(e(ci,n,r))})),Ex=Wn((function(n,r,t,u,o){return(function(a){if(a.$){var i=a.a;return e(I,f([j("elm-book__component-wrapper")]),f([e(go,f([j("elm-book-sans elm-book__component-error")]),f([en(i)]))]))}return e(io,$,f([e(I,$,a.a)]))})(e(Ma,(function(a){return e(Ix,H(hh,n,r,t,u),a)}),e(Qu,(function(a){return e(Jn,`
`,e(S,mc,a))}),ui(o))))})),oe=er("d"),Dr=er("fill"),qt=er("height"),fi=Li("http://www.w3.org/2000/svg"),ae=fi("path"),Px=er("stroke"),Ox=er("stroke-linecap"),Mx=er("stroke-linejoin"),Bx=er("stroke-width"),qo=fi("svg"),Zo=er("viewBox"),Zt=er("width"),Nx=function(n){return e(qo,f([Zt(bn(n.dZ)),qt(bn(n.dZ)),Zo("0 0 24 24"),Dr("none"),Px(n.cZ),Bx("2"),Ox("round"),Mx("round")]),f([e(ae,f([oe("M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z")]),$)]))},rd=function(n){return e(qo,f([Zt(bn(n.dZ)),qt(bn(n.dZ)),Zo("0 0 256 256")]),f([e(ae,f([Dr(n.cZ),oe("M128 135.022L7.023 256h241.955z")]),$),e(ae,f([Dr(n.cZ),oe("M202.332 195.311L256 248.98V141.643z")]),$),e(ae,f([Dr(n.cZ),oe("M120.978 128L0 7.022V248.98z")]),$),e(ae,f([Dr(n.cZ),oe("M256 113.806V0H142.193z")]),$),e(ae,f([Dr(n.cZ),oe("M195.584 67.434l60.288 60.289l-60.563 60.564l-60.29-60.29z")]),$),e(ae,f([Dr(n.cZ),oe("M7.021 0l55.725 55.726h121.13L128.15 0z")]),$),e(ae,f([Dr(n.cZ),oe("M128 120.979l55.322-55.323H72.677z")]),$)]))},ed="--elm-book-accent",Ie=au(ed),Vx=e(I,f([j("elm-book elm-book-sans")]),f([e(Ct,f([jt("https://package.elm-lang.org/packages/dtwrks/elm-book/latest/"),Da("_blank"),j("elm-book-footer"),e(Qr,"color",Ie)]),f([rd({cZ:"currentColor",dZ:16}),e(I,f([j("elm-book-footer--text")]),f([en("dtwrks/elm-book")]))]))])),Yx=tn("header"),td=fi("rect"),ud=er("rx"),od=er("transform"),ad=er("x"),cd=er("y"),Fx=function(n){return e(qo,f([Zt(bn(n.dZ)),qt(bn(n.dZ)),Zo("0 0 512 512")]),f([e(ae,f([Dr(n.cZ),oe("M451.792 0H59.208C26.561 0 0 26.561 0 59.208v393.084C0 484.939 26.561 511.5 59.208 511.5h392.584c32.647 0 59.208-26.561 59.208-59.208V59.208C511 26.561 484.439 0 451.792 0zM471 452.292c0 10.591-8.617 19.208-19.208 19.208H59.208C48.617 471.5 40 462.883 40 452.292V59.208C40 48.617 48.617 40 59.208 40h392.584C462.383 40 471 48.617 471 59.208v393.084z")]),$),e(td,f([Dr(n.cZ),ad("105"),cd("377.943"),Zt("386"),qt("40"),ud("20"),od("rotate(-45 105 377.943)")]),$),e(td,f([Dr(n.cZ),ad("133.284"),cd("105"),Zt("386"),qt("40"),ud("20"),od("rotate(45 133.284 105)")]),$)]))},Hx=function(n){return e(qo,f([Zt(bn(n.dZ)),qt(bn(n.dZ)),Zo("0 0 512 512")]),f([e(ae,f([Dr(n.cZ),oe("M176.792 0H59.208C26.561 0 0 26.561 0 59.208v117.584C0 209.439 26.561 236 59.208 236h117.584C209.439 236 236 209.439 236 176.792V59.208C236 26.561 209.439 0 176.792 0zM196 176.792c0 10.591-8.617 19.208-19.208 19.208H59.208C48.617 196 40 187.383 40 176.792V59.208C40 48.617 48.617 40 59.208 40h117.584C187.383 40 196 48.617 196 59.208v117.584zM452 0H336c-33.084 0-60 26.916-60 60v116c0 33.084 26.916 60 60 60h116c33.084 0 60-26.916 60-60V60c0-33.084-26.916-60-60-60zm20 176c0 11.028-8.972 20-20 20H336c-11.028 0-20-8.972-20-20V60c0-11.028 8.972-20 20-20h116c11.028 0 20 8.972 20 20v116zM176.792 276H59.208C26.561 276 0 302.561 0 335.208v117.584C0 485.439 26.561 512 59.208 512h117.584C209.439 512 236 485.439 236 452.792V335.208C236 302.561 209.439 276 176.792 276zM196 452.792c0 10.591-8.617 19.208-19.208 19.208H59.208C48.617 472 40 463.383 40 452.792V335.208C40 324.617 48.617 316 59.208 316h117.584c10.591 0 19.208 8.617 19.208 19.208v117.584zM452 276H336c-33.084 0-60 26.916-60 60v116c0 33.084 26.916 60 60 60h116c33.084 0 60-26.916 60-60V336c0-33.084-26.916-60-60-60zm20 176c0 11.028-8.972 20-20 20H336c-11.028 0-20-8.972-20-20V336c0-11.028 8.972-20 20-20h116c11.028 0 20 8.972 20 20v116z")]),$)]))},Rx=function(n){return e(se,f([j("elm-book-sans elm-book-header-default")]),f([e(W,rd({cZ:Ie,dZ:24}),e(rn,n.d_,(r=n.cC,r.bn))),e(se,f([j("elm-book-header-default--wrapper")]),f([e(se,f([j("elm-book-header-default--title")]),f([en(n.cD)])),e(W,en(""),e(rn,(function(t){return e(se,f([j("elm-book-header-default--subtitle")]),f([en(t)]))}),Ub(n.cC)))]))]));var r},Jx=function(n){return e(Yx,f([j("elm-book-header")]),f([e(Ct,f([jt(n.dg),j("elm-book-header--link"),e(Qr,"color",Ie)]),f([e(ds,f([j("elm-book")]),f([e(W,Rx({cC:n.cC,cD:n.cD,d_:n.d_}),e(rn,n.d_,(r=n.cC,r.dc)))]))])),e(At,f([j("elm-book elm-book-header--button"),Je(n.dE)]),f([n.B?Fx({cZ:Ie,dZ:20}):Hx({cZ:Ie,dZ:20})]))]));var r},Qx=tn("nav"),Xx=function(n){return n?j(""):Da("_blank")},id="--elm-book-nav-accent",bi=au(id),fd="--elm-book-nav-accent-highlight",Gx=au(fd),bd="--elm-book-nav-background",si=au(bd),nw=cr("placeholder"),rw=function(n){return e(I,f([j("elm-book-wrapper elm-book-search-wrapper elm-book-sans")]),f([e(I,f([j("elm-book-search-bg elm-book-inset")]),$),e(I,f([j("elm-book-search-border elm-book-inset")]),$),e(_r,f([ic("elm-book-search"),Fr(n.d$),qr(n.dH),Ca(n.dG),Qt(n.dB),nw('Type "⌘K" to search…')]),$)]))},Mr=function(n){return d(ub,"style",$,f([en(n)]))},ew=Mr(`
@import url('https://fonts.googleapis.com/css2?family=Fira+Code:wght@400;600&family=IBM+Plex+Sans:wght@300;400;600&family=IBM+Plex+Serif:ital,wght@0,400;0,600;1,400;1,600&display=swap');

@keyframes fade-in {
  from { opacity: 0; }
  to   { opacity: 1; }
}

.elm-book-fade-in {
    animation: 0.3s linear fade-in;
}

.elm-book-wrapper * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

.elm-book-wrapper,
.elm-book {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

.elm-book-sans {
    font-family: "IBM Plex Sans", "sans-serif";
}

.elm-book-serif {
    font-family: "IBM Plex Serif", "serif";
}

.elm-book-monospace {
    font-family: "Fira Code", "monospace";
}

.elm-book-inset {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
}

.elm-book-shadows {
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
}

.elm-book-shadows-light {
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.15);
}
`),tw=Mr(`
.elm-book-action-log-preview-wrapper {
    padding: 8px;
}
.elm-book-action-log-preview {
    display: block;
    width: 100%;
    padding: 0;
    margin: 0;
    border: none;
    border-radius: 4px;
    background-color: transparent;
    text-align: left;
    font-size: 14px;
    cursor: pointer;
}
.elm-book-action-log-preview:hover {
    opacity: 0.9;
}
.elm-book-action-log-preview:hover {
    opacity: 0.8;
}

.elm-book-action-log-preview-empty-wrapper {
    padding: 8px;
    font-size: 14px;
    color: #aaa;
}
.elm-book-action-log-preview-empty {
    padding: 12px 20px;
    background-color: #f3f3f3;
    border-radius: 4px;
}

.elm-book-dark-mode .elm-book-action-log-preview-empty {
    background-color: #2f3238;
}

.elm-book-action-log-list-wrapper {
    position: relative;
    padding-top: 34px;
}
.elm-book-action-log-list-header {
    display: flex;
    align-items: center;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 34px;
    padding: 0 20px;
    font-weight: bold;
    font-size: 14px;
    letter-spacing: 0.5px;
    color: #fff;
}
.elm-book-action-log-list {
    list-style-type: none;
    max-height: 70vh;
    overflow-y: auto;
}
.elm-book-action-log-list-item {
    border-top: 1px solid #e0e0e0;
}
.elm-book-dark-mode .elm-book-action-log-list-item {
    border-top-color: #3b3f47;
}

.elm-book-action-log-item-wrapper {
    display: flex;
    align-items: center;
    padding: 8px 20px 8px 0;
    font-size: 14px;
    background-color: #f5f5f5;
}
.elm-book-dark-mode .elm-book-action-log-item-wrapper {
    background-color: #2f3238;
}

.elm-book-action-log-item-index {
    width: 60px;
    text-align: center;
    display: inline-block;
    color: #a0a0a0;
}
.elm-book-action-log__main {
    flex-grow: 1;
}
.elm-book-action-log-item-preffix {
    padding-right: 16px;
    color: #a0a0a0;
    letter-spacing: 0.5px;
    font-size: 12px;
}
.elm-book-action-log-item-label {
    color: #404040;
    font-size: 13px;
    font-weight: bold;
}
.elm-book-dark-mode .elm-book-action-log-item-label {
    color: #f5f5f5;
}
`),Ee="@media screen and (max-width: 768px)",uw=Mr(`
.elm-book-chapter {
    padding: 40px;
    width: 100%;
}
`+Ee+` {
    .elm-book-chapter {
        padding: 24px;
    }
}
`),ow=Mr(`
.elm-book__chapter-component__title {
    padding-bottom: 12px;
    font-size: 14px;
    letter-spacing: 0.5px;
    color: #999;
}

.elm-book__chapter-component__background {
    padding: 12px;
    border-radius: 4px;
    background-color: #fff;
}
.elm-book-dark-mode .elm-book__chapter-component__background {
    background-color: #3b3f47;
}

.elm-book__chapter-component__content {
    border: 1px dashed transparent;
    position: relative;
}
.elm-book__chapter-component__content:hover {
    border-color: #eaeaea;
}
`),aw=Mr(`
.elm-book-chapter-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin: 0;
    padding: 8px 12px 8px 16px;

}
.elm-book-dark-mode .elm-book-chapter-header {
    color: #dadada;
}

.elm-book-chapter-header__title {
    margin: 0;
    padding: 0;
    font-size: 12px;
    font-weight: bold;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    color: #b0b4ba;
}
.elm-book-dark-mode .elm-book-chapter-header__title {
    color: #dadada;
}

.elm-book-chapter-header__btn {
    border: none;
    background: none;
    color: #b0b4ba;
}
.elm-book-chapter-header__btn:hover {
    cursor: pointer;
    opacity: 0.8;
}
.elm-book-chapter-header__btn:active {
    opacity: 0.6;
}
.elm-book-dark-mode .elm-book-chapter-header__btn {
    color: #dadada;
}
`),cw=Mr(`
.elm-book-footer {
    display: flex;
    align-items: center;
    width: 100%;
    margin: 0;
    padding: 13px 12px 13px;
    opacity: 0.8;
    transition: opacity 200ms;
    text-decoration: none;
}
.elm-book-footer:hover {
    opacity: 1;
}

.elm-book-footer--text {
    padding-left: 12px;
    font-size: 10px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    color: currentColor;
}
`),iw=Mr(`
.elm-book-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.elm-book-header--link {
    display: block;
    padding: 8px 12px;
    text-decoration: none;
}
.elm-book-header--link:hover {
    opacity: 0.9;
}
.elm-book-header--link:active {
    opacity: 0.8;
}

.elm-book-header--button {
    display: none;
    padding: 12px;
    border: none;
    border-radius: 4px;
    box-shadow: none;
    background-color: transparent;
    cursor: pointer;
}
.elm-book-header--button:hover {
    opacity: 0.9;
    background-color: rgba(255, 255, 255, 0.1);
}
.elm-book-header--button:active {
    opacity: 0.4;
}
@media screen and (max-width: 768px) {
    .elm-book-header--button {
        display: flex;
        align-items: center;
    }
}

.elm-book-header-default {
    display: flex;
    align-items: center;
}

.elm-book-header-default--wrapper {
    display: block;
    padding-left: 16px;
    font-weight: 600;
    font-size: 16px;
}

.elm-book-header-default--title {
    display: block;
    padding-right: 4px;
}

.elm-book-header-default--subtitle {
    display: block;
    font-weight: 400;
}
`),fw=Mr(`
.elm-book__component-wrapper {
    max-width: 720px;
    margin: 0 auto;
    padding-bottom: 36px;
}
.elm-book__component-wrapper.full {
    max-width: 100%;
}
.elm-book__component-error {
    overflow: auto;
    padding: 20px;
    background-color: #f9e4b5;
    border-radius: 4px;
    border: 2px solid #eac97d;
    color: #ab7700;
}

.elm-book-md__component-list {
    list-style-type: none;
    margin: 0;
    padding: 0;
}
.elm-book-md__component-list__item + .elm-book-md__component-list__item {
    padding-top: 36px;
}

.elm-book-md {
    max-width: 720px;
    margin: 0 auto;
    padding-bottom: 36px;
    color: rgb(41,41,41);
}

.elm-book-dark-mode .elm-book-md {
    color: rgb(180, 180, 180);    
}

.elm-book-md * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
.elm-book-md .elm-book-md__heading-anchor {
    display: block;
    text-decoration: none;
    appearance: none;
    color: inherit;
    &:focus {
        outline: none;
    }
}

@media screen and (min-width: 1720px) {
    .elm-book__component-wrapper {
        max-width: 960px;
    }
    .elm-book__component-wrapper.full {
        max-width: 100%;
    }
    .elm-book-md {
        max-width: 960px;
    }
}

.elm-book-md h1 {
    font-size: 46px;
}
.elm-book-md h2 {
    font-size: 32px;
}
.elm-book-md h3 {
    font-size: 24px;
}
.elm-book-md h4 {
    font-size: 20px;
    font-weight: normal;
    text-transform: uppercase;
}
.elm-book-md h5 {
    font-size: 18px;
    font-weight: normal;
    text-transform: uppercase;
}
.elm-book-md h6 {
    font-size: 16px;
    font-weight: normal;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.elm-book-md h1,
.elm-book-md h2,
.elm-book-md h3 {
    font-weight: bold;
}

.elm-book-md h1,
.elm-book-md h2,
.elm-book-md h3,
.elm-book-md h4,
.elm-book-md h5,
.elm-book-md h6 {
    padding-top: 24px;
}

.elm-book-dark-mode .elm-book-md h1,
.elm-book-dark-mode .elm-book-md h2,
.elm-book-dark-mode .elm-book-md h3,
.elm-book-dark-mode .elm-book-md h4,
.elm-book-dark-mode .elm-book-md h5,
.elm-book-dark-mode .elm-book-md h6 {
    color: #dadada;
}

`+Ee+` {
    .elm-book-md h1 {
        font-size: 40px;
        padding-top: 12px;
    }
}

.elm-book-md__default {
    line-height: 1.8em;
    color: rgb(80, 80, 90);
    font-size: 20px;
}
`+Ee+` {
    .elm-book-md__default {
        font-size: 18px;
    }
}

.elm-book-md a {
    color: #000;
    text-decoration: underline;
}
.elm-book-md a:hover {
    opacity: 0.8;   
}
.elm-book-dark-mode .elm-book-md a {
    color: #f0f0f0;
}

.elm-book-md blockquote {
    font-size: 18px;
    margin-left: 0;
    padding: 8px 0 8px 24px;
    border-left: 4px solid #f0f0f0;
}
.elm-book-md code {
    display: inline-block;
    border-radius: 4px;
    padding: 0 8px;
    background-color: #f0f0f0;
    border: 1px solid #eaeaea;
    color: #4a4a4a;
    font-size: 0.8em;
    line-height: 1.8em;
}
.elm-book-dark-mode .elm-book-md code {
    background-color: #333;
    border: 1px solid #444;
    color: #bababa;
}


.elm-book-md img {
    max-width: 100%;
}
.elm-book-md ul {
    padding-left: 32px;
    list-style: disc;
}
.elm-book-md ol {
    padding-left: 32px;
}

.elm-book-md hr {
    border: none;
    height: 2px;
    background-color: #f0f0f0;
}
.elm-book-dark-mode .elm-book-md hr {
    background-color: #3b3f47;
}

.elm-book-md table {
    border-collapse: collapse;
    overflow-x: auto;
    border: 2px solid #f0f0f0;
}
.elm-book-md thead {
    border: none;
}
.elm-book-md tbody {
    border: none;
}
.elm-book-md tr {
    border: none;
    border-top: 2px solid #f0f0f0;
}
.elm-book-md th,
.elm-book-md td {
    border: none;
    border-right: 2px solid #f0f0f0;
    padding: 12px;
}
.elm-book-md th:last-child,
.elm-book-md td:last-child {
    border-right: none;
}

.elm-book-dark-mode .elm-book-md table,
.elm-book-dark-mode .elm-book-md tr,
.elm-book-dark-mode .elm-book-md th,
.elm-book-dark-mode .elm-book-md td {
    border-color: #3b3f47;
}

.elm-book-md__code,
.elm-book-md__code code,
.elm-book-dark-mode .elm-book-md__code,
.elm-book-dark-mode .elm-book-md__code code {
    font-size: 18px;
    line-height: 22px;
    padding: 20px 24px;
    background-color: #2a354d;
    border-radius: 6px;
    border: none;
    overflow: auto;
}
.elm-book-md__code-default {}

`+Ee+` {
    .elm-book-md__code,
    .elm-book-md__code code,
    .elm-book-dark-mode .elm-book-md__code,
    .elm-book-dark-mode .elm-book-md__code code {
        font-size: 16px;
    }
}

.elm-book-md pre.elmsh {
    padding: 0;
    margin: 0;
}

.elm-book-md code.elmsh {
    padding: 0;
}

.elm-book-md .elmsh {
    color: #f8f8f2;
}
.elm-book-md .elmsh-hl {
    background: #343434;
}
.elm-book-md .elmsh-add {
    background: #003800;
}
.elm-book-md .elmsh-del {
    background: #380000;
}
.elm-book-md .elmsh-comm {
    color: #a4a39c;
}
.elm-book-md .elmsh1 {
    color: #46f0ff;
}
.elm-book-md .elmsh2 {
    color: #a5fb98;
}
.elm-book-md .elmsh3 {
    color: #ff8f00;
}
.elm-book-md .elmsh4 {
    color: #46f0ff;
}
.elm-book-md .elmsh5 {
    color: #46f0ff;
}
.elm-book-md .elmsh6 {
    color: #46f0ff;
}
.elm-book-md .elmsh7 {
    color: #46f0ff;
}
.elm-book-md .elmsh-elm-ts, .elm-book-md .elmsh-js-dk, .elm-book-md .elmsh-css-p {
    font-style: italic;
    color: #46f0ff;
}
.elm-book-md .elmsh-js-ce {
    font-style: italic;
    color: #46f0ff;
}
.elm-book-md .elmsh-css-ar-i {
    font-weight: bold;
    color: #46f0ff;
}
`),bw=Mr(`
.elm-book-nav-empty {
    padding: 12px 20px;
    font-size: 14px;
}

.elm-book-nav-list-wrapper {
    padding-bottom: 16px;
}

.elm-book-nav-list-title {
    padding: 12px 20px 8px;
    font-weight: bold;
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.elm-book-nav-list {
    list-style-type: none;
}

.elm-book-nav-item {
    position: relative;
    display: flex;
    font-size: 14px;
    letter-spacing: 1px;
    text-decoration: none;
}
.elm-book-nav-item:focus {
    outline: none;
}

.elm-book-nav-item-content {
    position: relative;
    z-index: 1;
    padding: 8px 20px;
}

.elm-book-nav-item-bg {
    opacity: 0;
}
.elm-book-nav-item.pre-selected .elm-book-nav-item-bg {
    opacity: 0.1;
}
.elm-book-nav-item.active .elm-book-nav-item-bg {
    opacity: 0.2;
}
.elm-book-nav-item.active.pre-selected .elm-book-nav-item-bg {
    opacity: 0.25;
}
.elm-book-nav-item:hover .elm-book-nav-item-bg {
    opacity: 0.15;
}
.elm-book-nav-item:active .elm-book-nav-item-bg {
    opacity: 0.1;
}
.elm-book-nav-item.active:hover .elm-book-nav-item-bg {
    opacity: 0.25;
}
.elm-book-nav-item.active:active .elm-book-nav-item-bg {
    opacity: 0.2;
}
`),sw=Mr(`
.elm-book-search-wrapper {
    position: relative;
    width: 100%;
}

#elm-book-search {
    position: relative;
    z-index: 1;
    width: 100%;
    padding: 10px 12px;
    border: 0;
    border-radius: 4px;
    background: none;
    font-size: 14px;
    color: `+Ie+`;
    transition: 0.2s;
}
#elm-book-search:focus {
    outline: none;
}
#elm-book-search::placeholder {
    border-radius: 4px;
    color: `+bi+`;
    opacity: 0.7;
}

.elm-book-search-bg {
    opacity: 0.2;
    border-radius: 4px;
    background-color: `+si+`;
}
.elm-book-search-border {
    opacity: 0.5;
    border-radius: 4px;
    border: 0px solid `+Ie+`;
    transition: 0.2s;
}

.elm-book-search-wrapper:hover .elm-book-search-bg {
    opacity: 0.25;
}
.elm-book-search-wrapper:hover .elm-book-search-border {
    border-width: 3px;
}
.elm-book-search-wrapper:focus-within .elm-book-search-border {
    opacity: 1;
    border-width: 3px;
}
`),lw=Mr(`
.elm-book--wrapper--globals {
    display: none;
}

.elm-book--wrapper {
    display: flex;
    align-items: stretch;
    background: `+jb+`;
}
`+Ee+` {
    .elm-book--wrapper {
        flex-direction: column;
    }
}

.elm-book--wrapper--sidebar {
    display: flex;
    flex-direction: column;
    width: 300px;
}
`+Ee+` {
    .elm-book--wrapper--sidebar {
        width: 100%;
    }
    .elm-book--wrapper.is-open .elm-book--wrapper--sidebar {
        flex-grow: 1;
    }
}

.elm-book--wrapper--header {
    padding: 8px 8px 4px;
}

.elm-book--wrapper--menu {
    display: flex;
    flex-direction: column;
    flex-grow: 1;
}
`+Ee+` {
    .elm-book--wrapper--menu {
        display: none;
    }
    .elm-book--wrapper.is-open .elm-book--wrapper--menu {
        display: flex;
    }
}

.elm-book--wrapper--menu--header {
    padding: 8px;
}

.elm-book--wrapper--menu--separator {
    display: block;
    margin: 0;
    padding: 0;
    opacity: 0.2;
    border-top: none;
    border-bottom: 1px solid `+si+`;
}

.elm-book--wrapper--menu--main-wrapper {
    position: relative;
    flex-grow: 1;
}

.elm-book--wrapper--menu--main {
    overflow: auto;
    padding: 8px 0;
}

.elm-book--wrapper--menu--footer {
    padding: 8px;
}

.elm-book--wrapper--main {
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    padding: 8px 8px 0 0;
}
`+Ee+` {
    .elm-book--wrapper--main {
        display: flex;
        padding-left: 8px;
    }
    .elm-book--wrapper.is-open .elm-book--wrapper--main {
        display: none;
    }
}

.elm-book--wrapper--main--wrapper {
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    background-color: #fbfbfd;
    border-radius: 4px 4px 0 0;
    overflow: hidden;
}
.elm-book-dark-mode .elm-book--wrapper--main--wrapper {
    background-color: #20232a;
}

.elm-book--wrapper--main--header {
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}
.elm-book-dark-mode .elm-book--wrapper--main--header {
    border-bottom-color: rgba(255, 255, 255, 0.15);
}

.elm-book--wrapper--main--content {
    position: relative;
    flex-grow: 1;
}

.elm-book--wrapper--main--inner {
    overflow: auto;
}

.elm-book--wrapper--main--footer {
    border-top: 1px solid rgba(0, 0, 0, 0.1);
}
.elm-book-dark-mode .elm-book--wrapper--main--footer {
    border-top-color: rgba(255, 255, 255, 0.15);
}

.elm-book--wrapper--modal {
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 99999;
}

.elm-book--wrapper--modal--bg {
    z-index: 0;
    cursor: pointer;
    background-color: rgba(0, 0, 0, 0.3);
    transition: background-color 300ms;
}
.elm-book--wrapper--modal--bg:hover {
    background-color: rgba(0, 0, 0, 0.2);
}

.elm-book--wrapper--modal--content {
    position: relative;
    z-index: 1;
    margin: 40px;
    width: 640px;
    max-width: 100%;
    max-height: calc 100% - 120px;
    overflow-y: auto;
    background-color: #fff;
    border-radius: 8px;
}
.elm-book-dark-mode .elm-book--wrapper--modal--content {
    background-color: #20232a;
}
`),dw=e(I,$,f([ew,tw,uw,ow,aw,cw,iw,fw,bw,sw,lw])),mw=function(n){return n.cP},pw=function(n){return n.cT},vw=function(n){return n.dy},kw=function(n){return n.dz},hw=function(n){return n.dA},gw=function(n){return e(Ks,"style",(r=e(S,(function(t){return t.a+":"+t.b+";"}),f([c(Cb,pw(n)),c(ed,mw(n)),c(bd,hw(n)),c(id,vw(n)),c(fd,kw(n))])),e(Jn,"",r)));var r},$w=function(n){return e(I,f([gw(n.cC),j(n.S?"elm-book-dark-mode":"")]),f([e(I,f([j("elm-book--wrapper--globals")]),n.b0),e(I,f([le(f([c("elm-book--wrapper elm-book-inset",!0),c("is-open",n.B)]))]),f([e(I,f([j("elm-book--wrapper--sidebar")]),f([e(I,f([j("elm-book--wrapper--header")]),f([n.dc])),e(I,f([j("elm-book--wrapper--menu")]),f([e(I,f([j("elm-book--wrapper--menu--header")]),f([n.dv])),e(cc,f([j("elm-book--wrapper--menu--separator")]),$),e(I,f([j("elm-book--wrapper--menu--main-wrapper")]),f([e(I,f([j("elm-book--wrapper--menu--main elm-book-inset")]),f([n.dt]))])),e(cc,f([j("elm-book--wrapper--menu--separator")]),$),e(I,f([j("elm-book--wrapper--menu--footer")]),f([n.du]))]))])),e(I,f([j("elm-book--wrapper--main")]),f([e(I,f([j("elm-book--wrapper--main--wrapper")]),f([(function(){var r=n.dr;if(r.$)return en("");var t=r.a;return e(I,f([j("elm-book--wrapper--main--header elm-book-sans")]),f([t]))})(),e(I,f([j("elm-book--wrapper--main--content")]),f([e(I,f([ic("elm-book-main"),j("elm-book--wrapper--main--inner elm-book-inset")]),f([n.dp]))])),e(I,f([j("elm-book--wrapper--main--footer")]),f([n.dq]))]))]))])),(function(){var r=n.dw;if(r.$)return en("");var t=r.a;return e(I,f([j("elm-book-inset elm-book-fade-in elm-book--wrapper--modal")]),f([e(I,f([Je(n.dF),j("elm-book-inset elm-book--wrapper--modal--bg")]),$),e(I,f([j("elm-book--wrapper--modal--content elm-book-shadows")]),f([t]))]))})()]))},xw=s((function(n,r){var t,u,o,a,i,b,l,p=e(hv,n.bK,r.aw),g=Ia(n.bK),k=e(qa,n,r.cJ);return{cU:f([dw,$w({S:r.S,b0:e(S,n.d_,e(W,$,n.bK.b0)),dc:Jx({dg:"/",B:r.B,dE:kv,cC:n.bK,cD:n.cD,d_:n.d_}),B:r.B,dp:e(W,en(""),e(rn,(function(h){var x,L,Z=h;return L=(x={cU:Z.cU,bS:e(yv,n.bS,Z.bS),bV:e(Lb,n.bV,Z.bV),c0:e(S,(function(B){return c(B.aR,d($v,n.d_,r.z,B.d0))}),Z.o),be:n.bK.be,cD:Z.cD}).bS.df?x.cU:"# "+x.cD+`
`+x.cU,e(io,f([j("elm-book elm-book-chapter")]),f([M(Ex,x.be,x.cD,x.c0,x.bV,L)]))}),k)),dq:e(W,wv,e(rn,(function(h){return x={dn:h,$7:yr(r.F)-1,dC:lv},e(I,f([j("elm-book-action-log-preview-wrapper")]),f([e(At,f([j("elm-book-action-log-preview"),Je(x.dC)]),f([e(Ab,x.$7,x.dn)]))]));var x}),gt(r.F))),dr:e(rn,(function(h){return x={dI:vv,cD:gv(h)},e(I,f([j("elm-book elm-book-chapter-header")]),f([e(ke,f([j("elm-book-chapter-header__title")]),f([en(x.cD)])),e(At,f([j("elm-book-chapter-header__btn"),Je(x.dI)]),f([Nx({cZ:"currentColor",dZ:16})]))]));var x}),k),dt:(b=e(yb,r._,n.Q),l=e(S,zt(g),Qm(b)),u={cQ:e(rn,zt(g),k),dl:e(S,zb(e(Kn,S((function(h){return e(Qe,h,n.Q)})),e(Kn,ir(_n),e(Kn,S((function(h){var x=h.cD,L=h.b8;return En(e(zt,g,h),x,L)})),Hr((function(h){return e(Ar,h.a,l)})))))),n.cY),dO:r.aj&&Pa(b)>0?e(rn,zt(g),e(Qe,e(Jr,Pa(b),r.A),b)):A},o=function(h){var x=h.a,L=h.b,Z=h.c;return e(ou,$,f([e(Ct,f([jt(x),Xx(Z),le(f([c("elm-book-nav-item",!0),c("active",R(u.cQ,_(x))),c("pre-selected",R(u.dO,_(x)))])),R(u.cQ,_(x))?e(Qr,"color",Gx):e(Qr,"color",bi)]),f([e(I,f([j("elm-book-inset elm-book-nav-item-bg"),e(Qr,"background-color",si)]),$),e(I,f([j("elm-book-nav-item-content")]),f([en(L)]))]))]))},a=function(h){var x=h.a,L=h.b;return Se(L)?en(""):e(I,f([j("elm-book-nav-list-wrapper")]),f([x===""?en(""):e(ke,f([j("elm-book-nav-list-title"),e(Qr,"color",Ie)]),f([en(x)])),e(co,f([j("elm-book-nav-list")]),e(S,o,L))]))},i=!d(Bn,s((function(h,x){return x+yr(h.b)})),0,u.dl),e(I,f([j("elm-book-wrapper elm-book-sans")]),f([i?e(ke,f([j("elm-book-nav-empty"),e(Qr,"color",bi)]),f([en("No results")])):e(Qx,f([j("elm-book-nav")]),e(S,a,u.dl))]))),du:Vx,dv:rw({dB:mv,dG:pv,dH:dv,d$:r._}),dw:r.ac?_(xv(r.F)):A,dF:sv,cC:p})]),cD:(t=e(W,n.cD,e(rn,(function(h){return n.cD+" | "+h}),Ub(n.bK))),k.$?t:k.a.cD+" - "+t)}})),ww=function(n){return uo((function(r){return R(r.cJ,n.cJ)?r:U(r,{F:$})}))},yw=s((function(n,r){var t=e(Lp,n,r);return(function(u){var o=u.dJ,a=u.dK,i=function(){i.a(o(na()))};return Tm({bw:function(b){return i.a=b,Nt.addEventListener("popstate",i),0>Nt.navigator.userAgent.indexOf("Trident")||Nt.addEventListener("hashchange",i),s((function(l,p){if(!(p.ctrlKey||p.metaKey||p.shiftKey||p.button>=1||l.target||l.hasAttribute("download"))){p.preventDefault();var g=l.href,k=na(),h=bb(g).a;b(a(h&&k.cn===h.cn&&k.b4===h.b4&&k.ck.a===h.ck.a?(function(x){return{$:0,a:x}})(h):(function(x){return{$:1,a:x}})(g)))}}))},bj:function(b){return d(u.bj,b,na(),i)},d0:u.d0,cI:u.cI,cA:u.cA})})({bj:Sp(t),dJ:gp,dK:$p,cA:function(u){return uf(f([rv(Pp),ev(Bp),e(W,of,e(rn,t.cy.cA,u.z))]))},cI:s((function(u,o){return e(ww,o,d(bv,t,u,o))})),d0:xw(t)})})),_w=C((function(n,r,t){var u=t,o=r===""?"":"/"+sa(r);return u.b8?U(u,{b2:_(r),cJ:K(n,K(o,u.cJ))}):u})),Aw=s((function(n,r){var t=r;return e(yw,e(S,(function(u){var o=u.a,a=u.b;return c(o,e(S,e(_w,t.bK.dV,o),a))}),n),t)})),sd=s((function(n,r){return d(Bn,rf,r,n)})),Cw=s((function(n,r){return U(r,{cy:e(sd,n,r.cy)})})),jw=s((function(n,r){return U(r,{bK:e(sd,n,r.bK)})})),zw=e(Aw,f([c("",f([P0,eb({cD:"API docs ↗",cJ:Fi}),eb({cD:"Other versions ↗",cJ:"../"})])),c("Knob examples",f([M0,op,E0,cp])),c("Full examples",lp)]),e(Cw,f([mp(dp)]),e(jw,f([kp("interactive docs"),pp(e(I,f([j("page-logo")]),f([en("🎛"),vp]))),function(n){return U(n,{be:!0})}]),v0("elm-knobs "+Ne))));ai={Main:{init:zw(hp)(0)}},ce.Elm?(function n(r,t){for(var u in t)u in r?u=="init"?at(6):n(r[u],t[u]):r[u]=t[u]})(ce.Elm,ai):ce.Elm=ai})(this),(ce=>{const Sr=["Main"];let s=[...Sr],C=ce;for(;s.length>0;){let fn=s.shift();C=C[fn]}return C.__elmModulePath=Sr,C})(this.Elm)}}.run();Uw.init(document.querySelector("main"));
