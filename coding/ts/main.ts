//const enum Size {"Small", "Medium", "large"}
let employee: {
    readonly id : number,
    name:string,
    fax ?: number
    retire: (date: Date) => void
} = {
    id:1, 
    name:"mahmud", 
    fax:12367748
}