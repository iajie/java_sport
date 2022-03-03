<template>
    <el-tabs type="border-card">
        <el-tab-pane label="分类管理">
            <type :active="0"/>
        </el-tab-pane>
        <el-tab-pane label="食物管理">
            <food :active="1"/>
        </el-tab-pane>
    </el-tabs>
</template>

<script>
import Type from "./Type";
import Food from "./Food";
export default {
    components: { Type, Food },
    data() {
        return {
            active: 0,
        }
    }
};
</script>

<style scoped>

</style>
