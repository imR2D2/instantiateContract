//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory is SimpleStorage {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public{
        //Creamos una instancia de simpleStorage
        //Los parentesis es para indicar que estas mandando a llamar a la funcion 
        //principal del otro archivo
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    //Le pasamos el indice porque como tenemos un contrato de varios 
    //simpleStorage debemos de decirle con cual va a interactuar

    //En el simpleStorageNumgber se lo pasamos porque mandaremos a llamar a la funcion 
    //store del otro contrato y nos pide un numero uint256 como parametro
    function interactionSimpleStorage(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public{
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));

        simpleStorage.store(_simpleStorageNumber);
    }

    //Funcion para mandar a llamar al retrieve del otro contrato
    function viewInteractionSimpleStorage(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));

        return simpleStorage.retrieve();
    }
}


