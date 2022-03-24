<template>
    <!--  -->
    <div :class="{'hidden':hidden}" class="pagination-container">

    </div>
</template>
<script>
export default {
    name: "Pagination",

};
</script>
<style scoped>
.pagination-container {
    background: #fff;
    padding: 32px 16px;
}
/* element ui层级关系，需要写样式帮助 */
.pagination-container.hidden {
    display: none;
}
</style>
