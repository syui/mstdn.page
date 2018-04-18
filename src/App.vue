<template>
  <div id="app">
    <h1>{{ title }}</h1> 

    <table>
      <thead>
        <tr>
          <th>icon</th>
          <th>user</th>
          <th>created_at</th>
          <th>content</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="article in articles" v-if="article.reblog === null">
          <td><img :src='article.account.avatar'/></td>
          <td>{{article.account.acct}}</td>
          <td>{{article.created_at}}</td>
          <td>{{article.content}}</td>
	</tr>
      </tbody>
    </table>  
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    name: 'app',
    data: function () {
      return {
        articles: []
      }
    },
    methods: {
      fetchArticles: function () {
        axios.get('https://syui.gitlab.io/mstdn.page/json/toot.json').then((response) => {
          this.articles = response.data
        }, (error) => {
          console.log(error)
        })
      }
    },
    mounted: function () {
      this.fetchArticles()
    }
  }
</script>


<style>
  body {
    background-color: #444444;
    font-family: Verdana, Helvetica, Arial;
    font-size: 14px;
  }
  a img {
    border: none;
  }
  a {
    color: #0000FF;
  }
  .clear {
    clear: both;
    height: 0;
    overflow: hidden;
  }
  #app {
    width: 75%;
    margin: 0 auto;
    background-color: #FFF;
    padding: 20px 40px;
    border: solid 1px black;
    margin-top: 20px;
    position: relative;
  }
  #flash_notice, #flash_error, #flash_alert {
    padding: 5px 8px;
    margin: 10px 0;
    margin-right: 150px;
  }
  #flash_notice {
    background-color: #CFC;
    border: solid 1px #6C6;
  }
  #flash_error, #flash_alert {
    background-color: #FCC;
    border: solid 1px #C66;
  }
  .field_with_errors {
    display: inline;
  }
  .error_messages {
    width: 400px;
    border: 2px solid #CF0000;
    padding: 0px;
    padding-bottom: 12px;
    margin-bottom: 20px;
    background-color: #f0f0f0;
    font-size: 12px;
  }
  .error_messages h2 {
    text-align: left;
    font-weight: bold;
    padding: 5px 10px;
    font-size: 12px;
    margin: 0;
    background-color: #c00;
    color: #fff;
  }
  .error_messages p {
    margin: 8px 10px;
  }
  form .field, form .actions {
    margin: 12px 0;
  }
  h4 {
    margin-bottom: 5px;
  }
  table {
      border-collapse: collapse;
      width: 100%;
  }
  th, td {
      text-align: left;
      padding: 8px;
  }
  tr:nth-child(even){background-color: #f2f2f2}
  th {
      background-color: #4CAF50;
      color: white;
  }
  td {
      word-break: break-all;
  }
  tr td img {
      width: 40px;
      height: 40px;
  }
</style>
