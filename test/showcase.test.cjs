const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const vm=require('node:vm');
const root=path.resolve(__dirname,'..');
test('showcase keeps professional identity and canonical metadata',()=>{
 const html=fs.readFileSync(path.join(root,'index.html'),'utf8');
 assert.match(html,/<title>[^<]*Kazi Musharraf/);
 assert.match(html,/<link[^>]+rel="canonical"[^>]+href="https:\/\//);
 assert.match(html,/https:\/\/github.com\/mk-knight23/);
 for(const match of html.matchAll(/<script\b([^>]*)>([\s\S]*?)<\/script>/gi)){
  if(/application\/ld\+json/.test(match[1]))assert.doesNotThrow(()=>JSON.parse(match[2]));
  else if(!/src=|type=["']module/.test(match[1])&&match[2].trim())assert.doesNotThrow(()=>new vm.Script(match[2]));
 }
});
test('checked-in JSON configurations parse',()=>{
 const visit=d=>{for(const item of fs.readdirSync(d,{withFileTypes:true})){
  if(item.name==='.git'||item.name==='node_modules')continue;
  const p=path.join(d,item.name);
  if(item.isDirectory())visit(p);
  else if(item.name.endsWith('.json'))assert.doesNotThrow(()=>JSON.parse(fs.readFileSync(p,'utf8')),p);
 }};visit(root);
});
