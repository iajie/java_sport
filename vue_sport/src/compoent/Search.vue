<template>
    <div>
        <el-input :placeholder="text" v-model="value" @keyup.enter.native="search" clearable @clear="search">
            <el-button slot="append" icon="el-icon-search" @click="search" />
        </el-input>
    </div>
</template>
<script>
export default {
    name: "Search",
    props: {
        value: {
            type: String,
            default: undefined
        },
        text: {
            type: String,
            default: '请输入搜索内容'
        }
    },
    methods: {
        search() {
            this.$emit('search', this.value);
        }
    }
};
</script>
<style scoped>
</style>
