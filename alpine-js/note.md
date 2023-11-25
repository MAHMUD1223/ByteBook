# Alpine Js
**Alpine**.js is a minimal JavaScript framework for enhancing interactivity and reactivity to your website. It is designed to be lightweight and works seamlessly with existing **HTML**. With its declarative syntax and easy integration, Alpine.js is a great choice for adding **dynamic behavior** to your web pages without needing to learn a more complex framework like **Vue** or **React**.
<br>So, Lets get started.
<br> There is only 15 **attributes**, 6 **properties** and 2 **Methods**.
So, if you have ever worked on web development that will be very easy and won't even take 5 min.
## 15 Attributes
The 15 attributes are:
### 1. x-data
Declare a new Alpine component and its data for a block of HTML.
It is to store data is need for almost every time you use alpine js.
```html
<div x-data="{ open: false }">
    ...
</div>
```
### 2. x-bind
Dynamically set HTML attributes on an element
```html
<div x-bind:class="! open ? 'hidden' : ''">
  ...
</div>
```
### 3. x-on
Listen for browser events on an element
```html
<button x-on:click="open = ! open">
  Toggle
</button>
```
### 4. x-text
Set the text content of an element
```html
<div>
  Copyright ©

  <span x-text="new Date().getFullYear()"></span>
</div>
```
### 5. x-html
Set the inner HTML of an element
```html
<div x-html="(await axios.get('/some/html/partial')).data">
  ...
</div>
```
### 6. x-model
Synchronize a piece of data with an input element
```html
<div x-data="{ search: '' }">
  <input type="text" x-model="search">

  Searching for: <span x-text="search"></span>
</div>
```
### 7. x-show
Toggle the visibility of an element
```html
<div x-show="open">
  ...
</div>
```
### 8. x-transition
Transition an element in and out using CSS transitions
```html
<div x-show="open" x-transition>
  ...
</div>
```
### 9. x-for
Repeat a block of HTML based on a data set
```html
<template x-for="post in posts">
  <h2 x-text="post.title"></h2>
</template>
```
### 10. x-if
Conditionally add/remove a block of HTML from the page entirely
```html
<template x-if="open">
  <div>...</div>
</template>
```
### 11. x-init
Run code when an element is initialized by Alpine
```html
<div x-init="date = new Date()"></div>
```
### 12. x-effect
Execute a script each time one of its dependancies change
```html
<div x-effect="console.log('Count is '+count)"></div>
```
### 13. x-ref
Reference elements directly by their specified keys using the $refs magic property
```html
<input type="text" x-ref="content">

<button x-on:click="navigator.clipboard.writeText($refs.content.value)">
  Copy
</button>
```
### 14. x-cloak
Hide a block of HTML until after Alpine is finished initializing its contents
```html
<div x-cloak>
  ...
</div>
```
### 15. x-ignore
Prevent a block of HTML from being initialized by Alpine
```html
<div x-ignore>
  ...
</div>
```
## 6 properties
The six properties on alpinejs is
### 1. $store
Access a global store registered using Alpine.store(...)
```html
<h1 x-text="$store.site.title"></h1>
```
### 2. $el
Reference the current DOM
```html
<div x-init="new Pikaday($el)"></div>
```
### 3. $dispatch
Dispatch a custom browser event from the current element
```html
<div x-on:notify="...">
  <button x-on:click="$dispatch('notify')">...</button>
</div>
```
### 4. $watch
Watch a piece of data and run the provided callback anytime it changes
```html
<div x-init="$watch('count', value => {
  console.log('count is ' + value)
})">...</div>
```
### 5. $refs
Reference an element by key (specified using x-ref)
```html
<div x-init="$refs.button.remove()">
  <button x-ref="button">Remove Me</button>
</div>
```
### 6. $nextTick
Wait until the next "tick" (browser paint) to run a bit of code
```html
<div
  x-text="count"
  x-text="$nextTick(() => {"
    console.log('count is ' + $el.textContent)
  })
>...</div>
```
## 2 methods
The two methods are
### 1. Alpine.data
Reuse a data object and reference it using x-data
```html
<div x-data="dropdown">
  ...
</div>

...

Alpine.data('dropdown', () => ({
  open: false,

  toggle() { 
    this.open = ! this.open
  }
}))
```
### 2. Alpine.store
Declare a piece of global, reactive, data that can be accessed from anywhere using $store
```html
<button @click="$store.notifications.notify('...')">
  Notify
</button>

...

Alpine.store('notifications', {
  items: [],

  notify(message) { 
    this.items.push(message)
  }
})
```
<br>
Well that was pretty boring. Lets see some example to get ourselves a better understanding.
You can find example [here](/alpine-js/main.html).