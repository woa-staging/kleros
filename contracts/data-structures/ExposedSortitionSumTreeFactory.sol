pragma solidity ^0.4.24;

import "./SortitionSumTreeFactory.sol";

/**
 *  @title ExposedSortitionSumTreeFactory
 *  @author Enrique Piqueras - <epiquerass@gmail.com>
 *  @dev Exposed version of SortitionSumTreeFactory for testing.
 */
contract ExposedSortitionSumTreeFactory is SortitionSumTreeFactory {
    /* Storage /*

    /**
     *  @dev Public getter for sortitionSumTrees.
     *  @param _key The key of the tree to get.
     *  @return All of the tree's properties.
     */
    function _sortitionSumTrees(bytes32 _key) public view returns(uint K, uint[] stack, uint[] tree) {
        return (sortitionSumTrees[_key].K, sortitionSumTrees[_key].stack, sortitionSumTrees[_key].tree);
    }

    /* Public */

    /**
     *  @dev Create a sortition sum tree at the specified key.
     *  @param _key The key of the new tree.
     *  @param _K The number of children each node in the tree should have.
     */
    function _createTree(bytes32 _key, uint _K) public {
        createTree(_key, _K);
    }

    /**
     *  @dev Delete a sortition sum tree at the specified key.
     *  @param _key The key of the tree to delete.
     */
    function _deleteTree(bytes32 _key) public {
        deleteTree(_key);
    }

    /**
     *  @dev Append a value to a tree.
     *  @param _key The key of the tree to append to.
     *  @param _value The value to append.
     *  @param _address The candidate's address.
     *  @return The index of the appended value in the tree.
     */
    function _append(bytes32 _key, uint _value, address _address) public returns(uint treeIndex) {
        return append(_key, _value, _address);
    }

    /**
     *  @dev Remove a value from a tree.
     *  @param _key The key of the tree to remove from.
     *  @param _address The candidate's address.
     */
    function _remove(bytes32 _key, address _address) public {
        remove(_key, _address);
    }

    /**
     *  @dev Set a value of a tree.
     *  @param _key The key of the tree.
     *  @param _value The new value.
     *  @param _address The candidate's address.
     */
    function _set(bytes32 _key, uint _value, address _address) public {
        set(_key, _value, _address);
    }

    /* Public Views */

    /**
     *  @dev Query the leafs of a tree.
     *  @param _key The key of the tree to get the leafs from.
     *  @param _cursor The pagination cursor.
     *  @param _count The number of items to return.
     *  @return The index at which leafs start, the values of the returned leafs, and wether there are more for pagination.
     */
    function _queryLeafs(bytes32 _key, uint _cursor, uint _count) public view returns(uint startIndex, uint[] values, bool hasMore) {
        return queryLeafs(_key, _cursor, _count);
    }

    /**
     *  @dev Draw an address from a tree using a number.
     *  @param _key The key of the tree.
     *  @param _drawnNumber The drawn number.
     *  @return The drawn address.
     */
    function _draw(bytes32 _key, uint _drawnNumber) public view returns(address _address) {
        return draw(_key, _drawnNumber);
    }

    /** @dev Gets a specified candidate's associated value.
     *  @param _key The key of the tree.
     *  @param _address The candidate's address.
     */
    function _stakeOf(bytes32 _key, address _address) public view returns(uint value) {
        return stakeOf(_key, _address);
    }
}
