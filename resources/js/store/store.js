import { createStore } from 'vuex';

export default createStore({
  state: {
    idLogin: JSON.parse(localStorage.getItem('idLogin')) || null,
    usuarioRecordar: JSON.parse(localStorage.getItem('usuarioRecordar')) || null,
    mostrarComponente: 0,
    mensajeAlerta: null,
    mostrarAlerta: null,
    alertaClase: null,
    idSlider: null,
    idProducto: null,

    inputValue: localStorage.getItem('inputValue') || false,
    summer: null,

  },
  mutations: {
    setProductoId(state,idProducto){
      state.idProducto = idProducto
    },
    setSliderIdComponent(state,idSliderHome){
      state.idSliderHome = idSliderHome
    },
    setSummer(state,bool){
      state.summer = bool
    },
    setInputValue(state,bool){
      state.inputValue = localStorage.setItem('inputValue', bool)
    },
    setUsuarioRecordar(state, usuario){
      state.usuarioRecordar = localStorage.setItem('usuarioRecordar', JSON.stringify(usuario));

    },
    setLoginId(state,idLogin){
      state.idLogin = idLogin
      localStorage.setItem('idLogin', JSON.stringify(state.idLogin));

    },

    mostrarComponente(state,idComponente){
      state.mostrarComponente = idComponente
    },

    setClaseAlerta(state,alertaClase){
      state.alertaClase = alertaClase
    },
    setMostrarAlerta(state,mostrarAlerta){
      state.mostrarAlerta = mostrarAlerta
    },
    setMensajeAlerta(state,mensajeAlerta){
      state.mensajeAlerta = mensajeAlerta
    },
    
  },
 
  getters: {
    getIdProducto(state){
      return state.idProducto;
    },
    getidSlider(state) {
      return state.idSliderHome;
    },
    getSummer(state){
      return state.summer;

    },
    getInputValue(state) {
      return state.inputValue;
    },
    getUsuarioRecordar(state) {
      return state.usuarioRecordar;
    },
    getAlertaClase(state) {
      return state.alertaClase;
    },
    getMostrarAlerta(state) {
      return state.mostrarAlerta;
    },
    getMensajeAlerta(state) {
      return state.mensajeAlerta;
    },
    getIdLogin(state){
      return state.idLogin;
    },
    getMostrarComponente(state) {
      return state.mostrarComponente;
    },
    
  
  }
});
