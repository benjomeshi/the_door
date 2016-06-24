/* @flow */

/*::
import type {DOM, Key, Address} from "reflex"
*/

const redirect = (addressBook, index) =>
  action => addressBook[index](action);

export class Thunk {
  /*::
  $type: "Thunk";
  type: "Thunk";
  key: Key;
  view: (...args:Array<any>) => DOM;
  args: Array<any>;

  addressBook: ?Array<Address<any>>;
  value: ?DOM;
  */
  constructor(key/*:Key*/, view/*:(...args:Array<any>) => DOM*/, args/*:Array<any>*/) {
    this.key = key
    this.view = view
    this.args = args
    this.addressBook = null
    this.value = null
  }
  render(previous/*:?DOM*/)/*:DOM*/ {
    if (previous instanceof Thunk && previous.value != null) {
      if (profile) {
        console.time(`${this.key}.receive`)
      }

      const {view, args: passed, key} = this
      const {args, addressBook, value} = previous
      this.addressBook = addressBook
      this.args = args
      this.value = value

      const count = passed.length
      let index = 0
      let isUpdated = view !== previous.view
                    || key !== previous.key

      if (args.length !== count) {
        isUpdated = true
        args.length = count
        addressBook.length = count
      }

      while (index < count) {
        const next = passed[index]
        const arg = args[index]

        if (next !== arg) {
          const isNextAddress = typeof(next) === 'function'
          const isCurrentAddress = typeof(arg) === 'function'

          if (isNextAddress && isCurrentAddress) {
            // Update adrress book with a new address.
            addressBook[index] = next
          } else {
            isUpdated = true

            if (isNextAddress) {
              addressBook[index] = next
              args[index] = redirect(addressBook, index)
            } else {
              args[index] = next
            }
          }
        }

        index = index + 1
      }

      if (profile) {
        console.timeEnd(`${key}.receive`)
      }

      if (isUpdated) {
        if (profile) {
          console.time(`${key}.render`)
        }

        this.value = view(...args)

        if (profile) {
          console.timeEnd(`${key}.render`)
        }
      }
    } else {
      if (profile) {
        console.time(`${this.key}.render`)
      }

      const addressBook = []
      const {args, view, key} = this
      const count = args.length

      let index = 0
      while (index < count) {
       const arg = args[index]
       if (typeof(arg) === 'function') {
         addressBook[index] = arg
         args[index] = redirect(addressBook, index)
       } else {
         args[index] = arg
       }
       index = index + 1
      }

      this.addressBook = addressBook
      this.value = view(...args)

      if (profile) {
        console.timeEnd(`${key}.render`)
      }
    }

    return this.value
  }
}
Thunk.prototype.type = "Thunk"
Thunk.prototype.$type = "Thunk"

let profile = null

export const thunk = /*::<a, b, c, d, e, f, g, h, i, j>*/
  ( key/*:string*/
  , view/*:(a:a, b:b, c:c, d:d, e:e, f:f, g:g, h:h, i:i, j:j) => DOM*/
  , ...args/*:Array<any>*/
  )/*:Thunk*/ =>
  new Thunk(key, view, args)
