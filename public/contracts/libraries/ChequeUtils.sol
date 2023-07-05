// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library ChequeUtils{

    enum ChequeState { /*Estados aptos para cobro*/
        EMITTED //Emitido || Se creó el cheque
        ,ACCEPTED //Aceptado || Se aceptó el cheque
        ,DUE //Cheque en DUE || Primer rechazo del cheque (Da tiempo a normalizar)
        
        /*Estados FINALES*/
        ,CANCELLED //Cancelado || Se cancela el cheque.
        ,CASHED //Cobrado || Se cobró el cheque
        ,RETRIEVED //Recuperado (CERTIFICADOS) || Se recuperó el dinero de certificación
        ,REJECTED //Rechazado || Se rechazó el cheque
    }
    
    struct ChequeInfo {
        uint256 chequeId;
        address issuer;
        //address recipient;
        uint256 amount;
        uint32 dateFrom;
        //bool isCashed;
        ChequeState state;
        bool isCertified;
    }

    function isEmitted(ChequeInfo storage cheque) internal view returns (bool) {
        return cheque.state == ChequeState.EMITTED;
    }

    function isAccepted(ChequeInfo storage cheque) internal view returns (bool) {
        return cheque.state == ChequeState.ACCEPTED;
    }

    function isDue(ChequeInfo storage cheque) internal view returns (bool) {
        return cheque.state == ChequeState.DUE;
    }

    function isCancelled(ChequeInfo storage cheque) internal view returns (bool) {
        return cheque.state == ChequeState.CANCELLED;
    }

    function isCashed(ChequeInfo storage cheque) internal view returns (bool) {
        return cheque.state == ChequeState.CASHED;
    }

    function isRetrieved(ChequeInfo storage cheque) internal view returns (bool) {
        return cheque.state == ChequeState.RETRIEVED;
    }

    function isRejected(ChequeInfo storage cheque) internal view returns (bool) {
        return cheque.state == ChequeState.REJECTED;
    }

    function setState(ChequeInfo storage cheque, ChequeState state) internal {
        cheque.state = state;
    }
    
}