export const contextType = {
  userId: "",
  profile: {
    userId: "",
    name: "",
    email: "",
    imageUrl: "",
    address: "",
    phoneNumber: "",
  },
  stores: [
    {
      storeId: "",
      storeName: "",
      country: "",
      city: "",
      storeEmail: "",
      phoneNumber: "",
    },
  ],
  roles: [],
  token: "",
  isLoggedIn: false,
  login: (token) => {},
  logout: () => {},
  refresh: () => {},
}
